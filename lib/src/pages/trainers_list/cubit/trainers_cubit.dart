import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_http_test/src/models/trainer.dart';
import 'package:flutter_http_test/src/service/http_request.dart';


part 'trainers_state.dart';


const String apiAdress = 'sok.tomskneft.ru';
const String apiLogin = 'MobileClient';
const String apiPass = 'gA0do1ry';
const String apiKey = '86476cb1-558e-4684-a621-fujedb269968';
const String userToken = 'ED56169797C2FC0D183356A129F94C31';
const url = 'https://sok.tomskneft.ru/MobService/hs/api/v3';

String logPassBase64 = base64.encode(utf8.encode('$apiLogin:$apiPass'));

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(TrainersInitial());

  Future<void> loadNews() async {
    try {
      //final response = await http.Client().get(Uri.parse(_top7news));
      //final rssFeed = RssFeed.parse(response.body);

      List<Trainer> trainers = <Trainer>[];
      final response = await HttpRequest.getResponse('trainers');
      final tempJson = json.decode(response);
      //final tempJson = json.decode(utf8.decode(response.bodyBytes));
      final finalJson = tempJson['data'];
        for (var trainer in finalJson){
          trainers.add(Trainer.fromJson(trainer));
        }
      //final newTrainer = Trainer.fromJson(finalJson);
      emit(TrainersLoadedState(trainers));
    } catch (e) {
      emit(TrainersErrorState('Ошибка загрузки'));
    }
  }


  Future<void> reloadNews() async {
    emit(TrainersInitial());
  }
/**
    List<Trainer> bodyToListTrainer(String body) {
    List<Trainer> listTrainers;



    return listTrainers;
    }*/
}
