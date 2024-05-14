import 'dart:async';

import 'package:mvvm_rxdart/data/repo/IRepoApi/IRepoApi.dart';
import 'package:mvvm_rxdart/data/repo/RepoApi/RepoApi.dart';
import 'package:mvvm_rxdart/model/Meals.dart';
import 'package:rxdart/rxdart.dart';

class FoodViewModel {
  IRepoApi iRepoApi = RepoApi();
  final _foodStream = PublishSubject<ResponseData>();
  final _foodByCharacter = PublishSubject<ResponseData>();

  Stream<ResponseData> get foodStream => _foodStream.stream;

  Sink<ResponseData> get foodSink => _foodStream.sink;

  Stream<ResponseData> get foodByCharacter => _foodByCharacter.stream;

  Sink<ResponseData> get foodByCharacterSink => _foodByCharacter.sink;

  getData() async {
    foodSink.add(await iRepoApi.goodFood());
  }

  getData2() async {
    foodSink.add(await iRepoApi.goodFood());
  }

  getDataByCharacter(String character) async {
    foodByCharacterSink.add(await iRepoApi.mealByCharacter(character));
  }

  dispose() {
    _foodStream.close();
  }
}
