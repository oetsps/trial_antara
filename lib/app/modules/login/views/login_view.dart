import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';
import '../../../routes/app_menu.dart';
import '../../../routes/search_help.dart';


class LoginView extends GetView<LoginController> {
  final String title = ' Daftar / Masuk';

  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: PopupMenuButton(
          color: Colors.grey[300],
          icon: const Icon(Icons.list, color: Colors.black87),
          itemBuilder: (context) => userLog ? popupMenuLoggedIn : popupMenu,
          onSelected: (String newValue) {
            if (newValue != Routes.LOGIN) {
              // Navigator.of(context).pushNamed(newValue);
              Get.offAllNamed(newValue);
            }
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/favicon.ico',
              fit: BoxFit.contain,
              height: 20,
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black87),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 40),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(40.0),
              height: 200,
              // color: Color(0xFF0B5D98),
              child: Image.asset(
                "assets/images/antara-id.png",
                fit: BoxFit.contain,
              )
            ),
            const SizedBox(height: 20),
            const Text(
              'Silahkan masuk dengan nomor ponsel.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Nomor Ponsel',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),

            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: '08xxxxxxxxxx',
              ),
            ),
            Row(
              children: [
                Obx((() => Checkbox(
                  activeColor: const Color.fromARGB(255, 162, 41, 33),
                    value: controller.markCheckBox.value,
                    onChanged: (value) => controller.markCheckBox.toggle(),
                  )),
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: 'Saya menyetujui ',
                      style: const TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // ignore: avoid_print
                              print('klik syarat');
                            },
                          text: 'syarat',
                          style: const TextStyle(color: Color.fromARGB(255, 162, 41, 33)),
                        ),
                        const TextSpan(
                          text: ', ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // ignore: avoid_print
                              print('klik ketentuan');
                            },
                          text: 'ketentuan',
                          style: const TextStyle(color: Color.fromARGB(255, 162, 41, 33)),
                        ),
                        const TextSpan(
                          text: ', ',
                          style: TextStyle(color: Colors.black),
                        ),
                        const TextSpan(
                          text: 'dan ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // ignore: avoid_print
                              print('klik privasi');
                            },
                          text: 'privasi',
                          style: const TextStyle(color: Color.fromARGB(255, 162, 41, 33)),
                        ),
                        const TextSpan(
                          text: ' ANTARA Kantor Berita Indonesia.',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              // onPressed: () => Navigator.of(context).pushNamed(Routes.HOME),
              onPressed: () {
                userLog = true;
                // Navigator.of(context).pushNamed(Routes.HOME);
                Get.offAllNamed(Routes.HOME);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[300],
              ),
              child: const Text(
                'MASUK',
                style: TextStyle(color: Color(0xFF747D80)),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text('Atau masuk menggunakan'),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    print('klik Facebook');
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                      const Size(150, 30)
                      ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)
                      )
                    ),
                    side: MaterialStateProperty.all(
                      const BorderSide(
                        color: Color(0xFF3B5998),
                      )
                    )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/fb.png'),
                      const SizedBox(width: 7,),
                      const Text(
                        'Facebook',
                        style: TextStyle(fontSize: 16, color: Color(0xFF3B5998)),
                      ),
                    ],
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    print('klik Twitter');
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                      const Size(150, 30)
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)
                      )
                    ),
                    side: MaterialStateProperty.all(
                      const BorderSide(
                        color: Color(0xFF1DA1F2),
                      )
                    )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/twitter.png'),
                      const SizedBox(width: 7,),
                      const Text(
                        'Twitter',
                        style: TextStyle(fontSize: 16, color: Color(0xFF1DA1F2)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// 00:40:15