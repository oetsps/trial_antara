part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const BISNIS = _Paths.BISNIS;
  static const SPORT = _Paths.SPORT;
  static const BOLA = _Paths.BOLA;
  static const LIFESTYLE = _Paths.LIFESTYLE;
  static const FOTO = _Paths.FOTO;
  static const VIDEO = _Paths.VIDEO;
  static const INFOGRAFIK = _Paths.INFOGRAFIK;
  static const MORE = _Paths.MORE;
  static const LOGIN = _Paths.LOGIN;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const BISNIS = '/bisnis';
  static const SPORT = '/sport';
  static const BOLA = '/bola';
  static const LIFESTYLE = '/lifestyle';
  static const FOTO = '/foto';
  static const VIDEO = '/video';
  static const INFOGRAFIK = '/infografik';
  static const MORE = '/more';
  static const LOGIN = '/login';
}
