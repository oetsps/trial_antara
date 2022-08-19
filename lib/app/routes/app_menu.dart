import 'package:flutter/material.dart';

import './app_pages.dart';


const List<PopupMenuEntry<String>> popupMenu = [
  PopupMenuItem(
    textStyle: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
    value: Routes.HOME,
    child: Text(' Home', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),),
  ),
  PopupMenuItem(
    textStyle: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
    value: Routes.BISNIS,
    child: Text(' Bisnis', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),),
  ),
  PopupMenuItem(
    textStyle: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
    value: Routes.SPORT,
    child: Text(' Sport', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),),
  ),
  PopupMenuItem(
    textStyle: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
    value: Routes.BOLA,
    child: Text(' Bole', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),),
  ),
  PopupMenuItem(
    textStyle: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
    value: Routes.LIFESTYLE,
    child: Text(' Lifestyle', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),),
  ),
  PopupMenuItem(
    textStyle: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
    value: Routes.FOTO,
    child: Text(' Foto', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),),
  ),
  PopupMenuItem(
    textStyle: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
    value: Routes.VIDEO,
    child: Text(' Video', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),),
  ),
  PopupMenuItem(
    textStyle: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
    value: Routes.INFOGRAFIK,
    child: Text(' Infografik', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),),
  ),
  PopupMenuItem(
    textStyle: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
    value: Routes.MORE,
    child: Text(' More', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),),
  ),
  PopupMenuItem(
    textStyle: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
    value: Routes.LOGIN,
    child: Text(' Daftar/Masuk', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),),
  ),
];

