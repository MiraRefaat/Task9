class WeatherModel{
  final String cityName;
   final String lastData; 
   final double temp; 
   final double maxtemp; 
   final double Mintemp;
    final String Image;
     final String weathercondition;
    
    WeatherModel({required this.weathercondition,
    required this.Image,
    required this.Mintemp,
    required this.cityName,
    required this.lastData,
    required this.maxtemp,
    required this.temp});
    factory WeatherModel.fromJost(json){
return  WeatherModel(
  weathercondition:json["current"]["condition"]["text"] ,
  Image: json["current"]["condition"]["icon"],
  Mintemp:json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
  cityName: json["location"]["name"]
, lastData:json["current"]["last_updated"],
  maxtemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
  temp: json["current"]["temp_c"]);
    }
}