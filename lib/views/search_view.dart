import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'Search a city',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              onSubmitted: (value) async {
                 weatherModel =
                    await WeatherServices(dio: Dio()).getCurrentWeather(
                  cityName: value,
                );
                Navigator.pop(context);
                log(weatherModel!.location.cityName);
              },
              decoration: const InputDecoration(
                suffixIcon: Icon(
                  Icons.search,
                ),
                labelText: 'Search',
                hintText: 'Enter name city',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
                isDense: true,
                // Added this
                contentPadding: EdgeInsets.all(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
WeatherModel ? weatherModel ;
