import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    //called when the widget is inserted in the widget tree ie. when state is created
    //in addition, it is only called once
    super.initState();

    getLocationData();
  }

  //void deactivate(){ //this method gets called whenever the current widget is destroyed
  //}

  //Async keyword modifier allows us to force methods to wait for asynchronous methods to return a value
  void getLocationData() async {
    //always need to request the permission before requesting the location
    //usually define it in the manifest

    //the await keyword states that the execution must wait for the method to complete
    //and fetch a value

    //////////////////////////CODE COMMENTED FOR THE CHALLENGE//////////////////////////
//    try {
//      Position position = await getCurrentPosition(
//          desiredAccuracy: LocationAccuracy.low); //asynchronous function
//    } catch (e) {
//      print(e);
//    }
    //////////////////////////////////////////////////////////////////////////////////////

    //for a method to be able to be able to use the await future, it must return a Future object
    //Hence we can infer that getCurrentPosition() returns a Future object.

    //for a method to return a Future object, we must also state its async
    //plus use the await keyword in the statement that assigns the actual value to the returning variable

    //Example later

    //We can specify the Future type like this: Future<{DATA_TYPE}>
    //this includes void.

//////////////////////////////////////////////////////////////////////////////
    //an asynchronous function always needs to be explicitly stated

    //async functions allows the method to be executed in the background

    //more accurate location consumes more battery

    WeatherModel model = WeatherModel();
    var weatherData = await model.getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );

      //TO PASS DATA TO A SCREEN, CREATE A VARIABLE IN THE STATEFUL WIDGET CONSTRUCTOR
      //AND DEFINE THE CONSTRUCTOR
    }));
  }

  //NULL CHECKING OPERATOR, EXAMPLE:
  // aValue ?? 30.0
  //The previous line translates to: check if the aValue is null, if not, use the value of aValue
  //else if it is null, use the value 30.0

  @override
  Widget build(BuildContext context) {
    //called when the structure of the widget is built
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
