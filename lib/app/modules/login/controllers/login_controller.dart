import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    super.onClose();
  }
}
