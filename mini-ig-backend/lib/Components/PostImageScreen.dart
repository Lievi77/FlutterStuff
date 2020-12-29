import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:io';
import 'package:mini_ig_ideen/utilities/constants.dart';
import 'package:path/path.dart';

//THIS IS THE SCREEN THAT WILL LET THE USER CREATE A NEW POST

class PostImageScreen extends StatefulWidget {
  @override
  _PostImageScreenState createState() => _PostImageScreenState();
}

class _PostImageScreenState extends State<PostImageScreen> {
  // VARIABLES RESPONSIBLE FOR IMAGE SELECTION
  File _image;
  final ImagePicker picker = ImagePicker();

  //VARIABLES RESPONSIBLE FOR HANDLING THE CAPTION
  //fetches the caption, initialize it and assign it to TextField
  TextEditingController _captionInputController = TextEditingController();

  //VARIABLES RESPONSIBLE FOR UPLOADING THE IMAGE TO FIREBASE
  bool _isUploading = false;
  bool _isUploadComplete = false;
  double _uploadProgress = 0.0;

  //firebase
  //WHEN WORKING WITH A FIREBASE DATABASE MANIPULATION, WE MUST CREATE THESE 3 INSTANCES
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  //firestore

  //Opens the camera to take a picture
  pickFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    cropImage(pickedFile);
  }

  //opens gallery to choose an image
  pickFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    cropImage(pickedFile);
  }

  //method to enable crop tools when an image is selected
  cropImage(image) async {
    File croppedImage = await ImageCropper.cropImage(
      sourcePath: image.path,
      compressQuality: 40, //for size optimization
    );

    setState(() {
      _image = croppedImage;
    });
  }

  //method that enables us to upload an image to firebase
  uploadImage() async {
    try {
      if (_image != null) {
        //upload begins
        setState(() {
          _isUploading = true;
          _uploadProgress = 0.0;
        });

        //always retrieve the current user
        User user = await _auth.currentUser;

        //ACTUAL CODE THAT DOES THE UPLOADING:

        //Generate the file path that will be uploaded to Firebase
        String fileName = DateTime.now().millisecondsSinceEpoch.toString() +
            basename(_image.path);

        //create a folder path to store the data
        final StorageReference storageReference =
            _storage.ref().child("posts").child(user.uid).child(fileName);

        //upload
        final StorageUploadTask uploadTask = storageReference.putFile(_image);

        //up next, we will do some optional code that will let us display the storage uploading progress
        final StreamSubscription<StorageTaskEvent> streamSubscription =
            uploadTask.events.listen((event) {
          var totalyBytes = event.snapshot.totalByteCount;
          var transferredBytes = event.snapshot.bytesTransferred;

          double progress = ((transferredBytes * 100) / (totalyBytes)) / 100;

          setState(() {
            _uploadProgress = progress;
          });
        });
///////////////////////////////////////////////////////////////

        StorageTaskSnapshot onComplete =
            await uploadTask.onComplete; //guarantees that our task is done

        String photoUrl = await onComplete.ref.getDownloadURL();

        //update the data base so we can fetch them on the feed screen
        _db.collection("posts").add({
          "photoUrl": photoUrl,
          "name": user.displayName,
          "caption": _captionInputController.text,
          "date": DateTime.now(),
          "uploadedBy": user.uid
        });

        //when completed
        setState(() {
          _isUploading = false;
          _isUploadComplete = true;
        });

        //whenever you create a StremSubscription instance, it is good practice to cancel it after done
        Navigator.pop(this.context);
        streamSubscription.cancel();
      } else {
        //we display a dialog
        showDialog(
            //before edition, we had an error on context: context. This happens whenever we have multiple context
            context: this.context,
            builder: (context) {
              return AlertDialog(
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      //we make the alert dialog disappear

                      Navigator.of(context).pop();
                    },
                    child: Text("Ok"),
                  ),
                ],
                content: Text("Please select an image to continue"),
                title: Text("Null Error"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              );
            });
      }
    } on Exception catch (e) {
      // TODO
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Image"),
        actions: <Widget>[
          IconButton(
            tooltip: "Take picture from camera",
            icon: Icon(Icons.camera_alt),
            onPressed: () {
              pickFromCamera();
            },
          ),
          IconButton(
            tooltip: "Upload photo from phone storage ",
            icon: Icon(Icons.add_photo_alternate),
            onPressed: () {
              pickFromGallery();
            },
          )
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _image != null
                  ? Image.file(_image)
                  : Image(
                      image: AssetImage("assets/placeholder.jpg"),
                    ),
              SizedBox(
                height: 10.0,
              ),

              //this widget lets us display the progress of uploading an item
              //remember we can do boolean evaluations and return certain widgets

              _isUploading
                  ? LinearProgressIndicator(
                      //value goes on domain [0,1]
                      value: _uploadProgress,
                      backgroundColor: Colors.grey,
                    )
                  : Container(),

              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _captionInputController,
                  decoration: kInputDecoration,
                ),
              ),
              RaisedButton(
                child: Text("Press to Save"),
                onPressed: () {
                  //on pressed we will send the image to the Firebase database
                  uploadImage();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
