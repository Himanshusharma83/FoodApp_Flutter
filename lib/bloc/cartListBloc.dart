import 'dart:async';
import 'dart:developer';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:foodapp/Models/fooditems.dart';
import 'package:foodapp/bloc/Provider.dart';
import 'package:rxdart/rxdart.dart';

class CartListBloc extends BlocBase {
  CartListBloc();

  var _listController = BehaviorSubject<List<FoodItem>>.seeded([]);

  CartProvider provider = CartProvider();

  Stream<List<FoodItem>> get listStream => _listController.stream;
  Sink<List<FoodItem>> get listSink => _listController.sink;

  addToList(FoodItem foodItem) {
    listSink.add(provider.addToList(foodItem));
  }

  removeToList(FoodItem foodItem) {
    listSink.add(provider.removeToList(foodItem));
  }

  @override
  void dispose() {
    _listController.close();
    super.dispose();
  }
}
