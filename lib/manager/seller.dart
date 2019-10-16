import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class SellerManager {
  // final BuildContext context;
  final GlobalKey<ScaffoldState> key ;
  final _featureBar = BehaviorSubject<Map<String, dynamic>>();
  final _content = BehaviorSubject<String>();
  int numberOfNewOrder = 0;

  SellerManager({this.key}) {
    _featureBar.add({
      "newOrder": numberOfNewOrder,
      "currentFeature": [true, false, false, false]
    });
    _content.add("order");
  }

  Observable<Map<String, dynamic>> get featureBar => _featureBar;
  Observable<String> get content => _content;

  onFeatureItemClicked(String name){
    switch(name){
      case "menu":{
        print("menu");
        this.key.currentState.openDrawer();
        break;
      }
      case "order":{
        print("Giovani");
        _content.sink.add("order");
        _featureBar.sink.add({"newOrder": numberOfNewOrder,"currentFeature": [true, false, false,false]});
        break;
      }
      case "product":{
        
        _content.sink.add("product");
        _featureBar.sink.add({"newOrder": numberOfNewOrder,"currentFeature": [false, true, false,false]});
        break;
      }
      case "customer":{
        _content.sink.add("customer");
        _featureBar.sink.add({"newOrder": numberOfNewOrder,"currentFeature": [false, false, true,false]});
        break;
      }
      case "provider":{
        _content.sink.add("provider");
        _featureBar.sink.add({"newOrder": numberOfNewOrder,"currentFeature": [false, false, false,true]});
        break;
      }
      

    }
  }
}
