import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/bola_controller.dart';
import '../../../routes/app_menu.dart';
import '../../../routes/search_help.dart';


// Bola Screen
class BolaView extends GetView<BolaController> {
  var topik = PageTopik(AppTopik.Bola);
  String routeTopik = Routes.BOLA;

  BolaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: topik.subTopikLength(),
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                leading: PopupMenuButton(
                  color: const Color.fromARGB(255, 241, 220, 218),
                  icon: const Icon(Icons.list),
                  itemBuilder: (context) =>
                      userLog ? popupMenuLoggedIn : popupMenu,
                  onSelected: (String newValue) {
                    if (newValue != routeTopik) {
                      // Navigator.of(context).pushNamed(newValue);
                      Get.offAllNamed(newValue);
                    }
                  },
                ),
                expandedHeight: 200.0,
                floating: true,
                pinned: true,
                snap: true,
                actionsIconTheme: const IconThemeData(opacity: 0.7),
                title: Text(
                  topik.getName(),
                  // topikTitle,
                  style: const TextStyle(color: Colors.orangeAccent),
                ),
                actions: [
                  IconButton(
                    color: Colors.white,
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      showSearch(
                        context: context,
                        delegate: CustomSearchDelegate(),
                      );
                    },
                  ),
                ],
                flexibleSpace: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/antara_bg.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                bottom: TabBar(
                  indicatorColor: Colors.orangeAccent,
                  indicatorWeight: 4,
                  tabs: [
                    for(var str in topik.getSubTopik())
                      Tab(text: str.toString())
                  ],
                  isScrollable: true,
                ),
              ),
            ];
          },
          body: TabBarView(children: [
            for(String str in topik.getSubTopik())
              CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate([
                      SizedBox(
                        height: 400,
                        child: Center(
                          child: Text(
                            str,
                            style: const TextStyle(fontSize: 40),
                          ),
                        ),
                      ),
                      Container(
                        height: 1500,
                        color: Colors.grey,
                      ),
                    ]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
