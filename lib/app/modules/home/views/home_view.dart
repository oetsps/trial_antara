import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import '../../../routes/app_menu.dart';
import '../../../routes/search_help.dart';

// Home Screen
class HomeView extends GetView<HomeController> {
  final String title = ' Home';

  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B5D98),
        leading: PopupMenuButton(
          // color: Colors.grey[800],
          color: Color.fromARGB(255, 154, 172, 193),
          icon: const Icon(Icons.list),
          itemBuilder: (context) => popupMenu,
          onSelected: (String newValue) {
            if (newValue != Routes.HOME) {
              Navigator.of(context).pushNamed(newValue);
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
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
          )
        ],
      ),
      body: Center(
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFF0B5D98))),
            child: const Text(
              'Home page',
            ),
            onPressed: () {
            }),
      ),
    );
  }
}
