import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:task_9/Model/classWeather.dart';



class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late WeatherModel weatherModle1;
  Dio dio = Dio();
  String baseurl = "http://api.weatherapi.com/v1";
  String Apikey = "ebde3f6ba6e94f52bf2104645232009";
  String city = "Cairo";


  bool isLoading = true;
  void initState() {
    super.initState();
    getWatherdata();
  }

  Future<void> getWatherdata() async {
    final response = await dio.get(
        '$baseurl/forecast.json?key=$Apikey &q=$city&days=1&aqi=no&alerts=no');
    weatherModle1 = WeatherModel.fromJost(response.data);
    setState(() {});

    isLoading = false;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Weather App"),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${weatherModle1.cityName}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  Text(
                    'updated at ${weatherModle1.lastData}',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network(
                        "https:${weatherModle1.Image}",
                        height: 100,
                      ),
                      Text(
                        '${weatherModle1.temp}°C',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            'Maxtemp:${weatherModle1.maxtemp}°C',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Mintemp:${weatherModle1.Mintemp}°C',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    '${weatherModle1.weathercondition}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}