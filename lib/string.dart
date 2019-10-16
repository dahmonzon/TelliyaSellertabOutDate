import 'package:flutter/material.dart';

enum Langue { FR, EN }

abstract class AString {
  String menu;
  String order;
  String customer;
  String provider;
  String product;
}

class EnString implements AString {
  @override
  String customer = "customer";

  @override
  String menu = "menu";

  @override
  String order = "order";

  @override
  String product = "product";

  @override
  String provider = "provider";
}

class FrString implements AString {
  @override
  String customer = "client";

  @override
  String menu = "menu";

  @override
  String order = "commande";

  @override
  String product = "produit";

  @override
  String provider = "fournisseur";
}

abstract class TString {
  static AString langue;

  static init(Langue lang) {
    switch (lang) {
      case Langue.EN:
        {
          langue = EnString();
          break;
        }
      case Langue.FR:
        {
          langue = FrString();
          break;
        }
    }
  }

  String get menu => langue.menu;
  String get customer => langue.customer;
  String get order => langue.order;
  String get product => langue.product;
  String get provider => langue.provider;
}
