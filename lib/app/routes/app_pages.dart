import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/bisnis/bindings/bisnis_binding.dart';
import '../modules/bisnis/views/bisnis_view.dart';
import '../modules/sport/bindings/sport_binding.dart';
import '../modules/sport/views/sport_view.dart';
import '../modules/bola/bindings/bola_binding.dart';
import '../modules/bola/views/bola_view.dart';
import '../modules/lifestyle/bindings/lifestyle_binding.dart';
import '../modules/lifestyle/views/lifestyle_view.dart';
import '../modules/foto/bindings/foto_binding.dart';
import '../modules/foto/views/foto_view.dart';
import '../modules/video/bindings/video_binding.dart';
import '../modules/video/views/video_view.dart';
import '../modules/infografik/bindings/infografik_binding.dart';
import '../modules/infografik/views/infografik_view.dart';
import '../modules/more/bindings/more_binding.dart';
import '../modules/more/views/more_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';


part 'app_routes.dart';

class AppPages {

  AppPages._();

  // static const INITIAL = Routes.rHOME;
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.BISNIS,
      page: () => const BisnisView(),
      binding: BisnisBinding(),
    ),
    GetPage(
      name: _Paths.SPORT,
      page: () => const SportView(),
      binding: SportBinding(),
    ),
    GetPage(
      name: _Paths.BOLA,
      page: () => const BolaView(),
      binding: BolaBinding(),
    ),
    GetPage(
      name: _Paths.LIFESTYLE,
      page: () => const LifestyleView(),
      binding: LifestyleBinding(),
    ),
    GetPage(
      name: _Paths.FOTO,
      page: () => const FotoView(),
      binding: FotoBinding(),
    ),
    GetPage(
      name: _Paths.VIDEO,
      page: () => const VideoView(),
      binding: VideoBinding(),
    ),
    GetPage(
      name: _Paths.INFOGRAFIK,
      page: () => const InfografikView(),
      binding: InfografikBinding(),
    ),
    GetPage(
      name: _Paths.MORE,
      page: () => const MoreView(),
      binding: MoreBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
