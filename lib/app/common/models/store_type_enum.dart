import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum StoreTypeEnum {
  RESTAURANT,
  HOME,
  EDUCATION,
  TRANSPORT,
  ELETRONICS,
  OTHERS,
}

const Map<String, StoreTypeEnum> MapStoreTypeEnum = {
  'Restaurante': StoreTypeEnum.RESTAURANT,
  'Casa': StoreTypeEnum.HOME,
  'Educação': StoreTypeEnum.EDUCATION,
  'Transporte': StoreTypeEnum.TRANSPORT,
  'Eletrônicos': StoreTypeEnum.ELETRONICS,
  'Outros': StoreTypeEnum.OTHERS,
};

IconData getStoreTypeIcon(StoreTypeEnum storeType) {
  switch (storeType) {
    case StoreTypeEnum.RESTAURANT:
      return FontAwesomeIcons.utensils;
    case StoreTypeEnum.HOME:
      return FontAwesomeIcons.home;
    case StoreTypeEnum.EDUCATION:
      return FontAwesomeIcons.book;
    case StoreTypeEnum.TRANSPORT:
      return FontAwesomeIcons.bus;
    case StoreTypeEnum.ELETRONICS:
      return FontAwesomeIcons.usb;
    case StoreTypeEnum.OTHERS:
    default:
      return FontAwesomeIcons.otter;
  }
}