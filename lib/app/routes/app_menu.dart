import 'package:flutter/material.dart';

import './app_pages.dart';


bool userLog = false;

const List<PopupMenuEntry<String>> popupMenu = [
  PopupMenuItem(
    padding: EdgeInsets.only(left: 6,),
    value: Routes.HOME,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(Icons.home, color: Colors.black,),
      title: Text(
        'Berita',
        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
  PopupMenuItem(
    padding: EdgeInsets.only(left: 6,),
    value: Routes.BISNIS,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(Icons.business, color: Colors.black,),
      title: Text(
        'Bisnis',
        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
  PopupMenuItem(
    padding: EdgeInsets.only(left: 6,),
    value: Routes.SPORT,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(Icons.sports, color: Colors.black,),
      title: Text(
        'Sport',
        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
  PopupMenuItem(
    padding: EdgeInsets.only(left: 6,),
    value: Routes.BOLA,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(Icons.sports_soccer, color: Colors.black,),
      title: Text(
        'Bola',
        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
  PopupMenuItem(
    padding: EdgeInsets.only(left: 6,),
    value: Routes.LIFESTYLE,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(Icons.living, color: Colors.black,),
      title: Text(
        'Lifestyle',
        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
  PopupMenuItem(
    padding: EdgeInsets.only(left: 6,),
    value: Routes.FOTO,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(Icons.photo, color: Colors.black,),
      title: Text(
        'Foto',
        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
  PopupMenuItem(
    padding: EdgeInsets.only(left: 6,),
    value: Routes.VIDEO,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(Icons.video_camera_front, color: Colors.black,),
      title: Text(
        'Video',
        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
  PopupMenuItem(
    padding: EdgeInsets.only(left: 6,),
    value: Routes.INFOGRAFIK,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(Icons.graphic_eq_rounded, color: Colors.black,),
      title: Text(
        'Infografik',
        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
  PopupMenuItem(
    padding: EdgeInsets.only(left: 6,),
    value: Routes.ENGLISH,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(Icons.more, color: Colors.black,),
      title: Text(
        'English',
        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
  PopupMenuItem(
    padding: EdgeInsets.only(left: 6,),
    value: Routes.MORE,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(Icons.more, color: Colors.black,),
      title: Text(
        'More',
        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
  PopupMenuItem(
    padding: EdgeInsets.only(left: 6,),
    value: Routes.LOGIN,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(Icons.login, color: Colors.black,),
      title: Text(
        'Login',
        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
];


const List<PopupMenuEntry<String>> popupMenuLoggedIn = [
  PopupMenuItem(
    padding: EdgeInsets.only(left: 6,),
    // value: Routes.HOME,
    value: Routes.LOGIN,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(Icons.home, color: Colors.black,),
      title: Text(
        'Berita',
        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
  PopupMenuItem(
    padding: EdgeInsets.only(left: 6,),
    value: Routes.BISNIS,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(Icons.business, color: Colors.black,),
      title: Text(
        'Bisnis',
        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
  PopupMenuItem(
    padding: EdgeInsets.only(left: 6,),
    value: Routes.SPORT,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(Icons.sports, color: Colors.black,),
      title: Text(
        'Sport',
        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
  PopupMenuItem(
    padding: EdgeInsets.only(left: 6,),
    value: Routes.BOLA,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(Icons.sports_soccer, color: Colors.black,),
      title: Text(
        'Bola',
        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
  PopupMenuItem(
    padding: EdgeInsets.only(left: 6,),
    value: Routes.LIFESTYLE,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(Icons.living, color: Colors.black,),
      title: Text(
        'Lifestyle',
        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
  PopupMenuItem(
    padding: EdgeInsets.only(left: 6,),
    value: Routes.FOTO,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(Icons.photo, color: Colors.black,),
      title: Text(
        'Foto',
        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
  PopupMenuItem(
    padding: EdgeInsets.only(left: 6,),
    value: Routes.VIDEO,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(Icons.video_camera_front, color: Colors.black,),
      title: Text(
        'Video',
        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
  PopupMenuItem(
    padding: EdgeInsets.only(left: 6,),
    value: Routes.INFOGRAFIK,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(Icons.graphic_eq_rounded, color: Colors.black,),
      title: Text(
        'Infografik',
        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
  PopupMenuItem(
    padding: EdgeInsets.only(left: 6,),
    value: Routes.ENGLISH,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(Icons.more, color: Colors.black,),
      title: Text(
        'English',
        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
  PopupMenuItem(
    padding: EdgeInsets.only(left: 6,),
    value: Routes.MORE,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(Icons.more, color: Colors.black,),
      title: Text(
        'More',
        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
  PopupMenuItem(
    padding: EdgeInsets.only(left: 6,),
    // value: Routes.LOGIN,
    value: Routes.PROFILE,
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      leading: Icon(Icons.person, color: Colors.black,),
      title: Text(
        'Profile',
        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ),
  ),
];
