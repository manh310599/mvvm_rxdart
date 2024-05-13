import 'dart:async';

import 'package:mvvm_rxdart/data/repo/IRepoApi/IRepoApi.dart';
import 'package:mvvm_rxdart/data/repo/RepoApi/RepoApi.dart';
import 'package:mvvm_rxdart/model/Meals.dart';
import 'package:rxdart/rxdart.dart';

class FoodViewModel {
  IRepoApi iRepoApi = RepoApi();
  final _foodStream = PublishSubject <ResponseData>();


  Stream<ResponseData> get foodStream => _foodStream.stream;

  Sink<ResponseData> get foodSink => _foodStream.sink;

  var compositeSubscription = CompositeSubscription();


  getData() async {
    foodSink.add(await iRepoApi.goodFood());
  }

  getData2() async {
    foodSink.add(await iRepoApi.goodFood());
  }

  dispose() {
    _foodStream.close();
  }
}
