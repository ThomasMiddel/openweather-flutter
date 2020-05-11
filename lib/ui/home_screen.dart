import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:openweather/app/resource.dart';
import 'package:openweather/app/service_locator.dart';
import 'package:openweather/data/weather/weather.dart';

import 'home_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.builder(
      creator: (_, __) => HomeBloc(sl.get()),
      builder: (context, HomeBloc bloc) {
        return Scaffold(
          body: Center(
            child: StreamBuilder<Resource<Weather>>(
              stream: bloc.weather,
              builder: (context, snapshot) {
                final status = snapshot?.data?.status;

                // Loader
                if (status == Status.LOADING) {
                  return CircularProgressIndicator();
                }

                // Error
                if (status == Status.ERROR) {
                  return Text('Oops, something went wrong!');
                }

                // Default UI
                final weather = snapshot?.data?.data;
                return Text('Current temperature is: ${weather.currentTempterature}');
              },
            ),
          ),
        );
      },
    );
  }
}
