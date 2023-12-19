import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../data/models/weather_base.dart';
import '../data/models/weather_status.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class GetWeatherBloc extends Bloc<GetWeatherEvent, GetWeatherState> {
  GetWeatherBloc()
      : super(GetWeatherState(
          status: LoadingStatus.pure,
          baseModel: [],
        )) {
    on<GetFullWeather>((event, emit) async {
      emit(state.copyWith(status: LoadingStatus.loading));
      try {
        await Future.delayed(const Duration(seconds: 4));
        final dio = Dio();
        final response = await dio.get(
            "https://api.openweathermap.org/data/2.5/weather?q=chust&appid=b0a8ad29b048c9ddd6cbb8f6b8d5a116");
        final weathers = BaseModel.fromJson(response.data);


        emit(
          state.copyWith(
              status: LoadingStatus.loadedWithSuccess, baseModel: [weathers]),
        );
      } catch (e) {

        emit(state.copyWith(status: LoadingStatus.loadedWithFailure));
        event.onFailure('$e');
      }
    });
  }
}
