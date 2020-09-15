import 'package:clima/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';

class LocationScreen extends StatefulWidget {
  //ACTUAL STATEFUL WIDGET OBJECT
  final locationWeather; //JSON DATA
  //NOTE THAT THE TYPE IS DYNAMIC

  LocationScreen({this.locationWeather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  //THIS IS THE STATE OBJECT, NOT THE STATEFULWIDGET (MAIN) OBJECT

  WeatherModel weather = WeatherModel();

  int temperature;
  String weatherIcon;
  String cityName;
  String weatherMessage;
  final String errorMessage = "Unable to get location data";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    updateUI(widget
        .locationWeather); //NOTE HOW WE CAN ACCESS VARIABLES DEFINED IN THE STATEFUL WIDGET
    //every class gets free access to the widget object (STATEFUL WIDGET DENOTED ABOVE)
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherMessage = 'Unable to get location data';
        cityName = '';

        return;
      }

      //GETTING THE TEMPERATURE RELATED DATA
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      weatherMessage = weather.getMessage(temperature);

      //GETTING THE ICON
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);

      //CITY NAME
      cityName = weatherData['name'];
    }); //GOOD PRACTICE TO SET CHANGING DATA THAT CHANGES THE UI INTO A setStateMethod()
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();

                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        (context),
                        MaterialPageRoute(
                          builder: (context) => CityScreen(),
                        ),

                        //NAVIGATOR.PUSH has an optional output: the variable passed by the pop method
                        //output is a Future instance
                      );

                      //safety null check

                      if (typedName != null) {
                        var weatherData =
                            await weather.getCityWeather(typedName);

                        updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  weatherIcon == "Error"
                      ? errorMessage
                      : "$weatherMessage in $cityName",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
