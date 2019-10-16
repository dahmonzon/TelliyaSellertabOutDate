import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class OrderManager {

  final _activeButton = BehaviorSubject<List<bool>>();

  OrderManager(){
    this._activeButton.sink.add([true,false]);
  }

  Observable<List<bool>> get activeButton => _activeButton;

  onMenuButtonClick(String value){
    if( value == "Ventes"){
      this._activeButton.sink.add([true,false]);
    }
    if( value == "Achats"){
      this._activeButton.sink.add([false,true]);
    }
  }
}