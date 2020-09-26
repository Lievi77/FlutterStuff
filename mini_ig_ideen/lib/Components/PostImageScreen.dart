import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:io';
import 'package:mini_ig_ideen/utilities/constants.dart';

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
    //upload begins
    setState(() {
      _isUploading = true;
      _uploadProgress = 0.0;
    });

    //always retrieve the current user
    User user = await _auth.currentUser;

    //when completed
    setState(() {
      _isUploading = false;
      _isUploadComplete = true;
    });
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
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
