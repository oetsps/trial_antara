import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/bisnis_controller.dart';
import '../../../routes/app_menu.dart';
import '../../../routes/search_help.dart';


// Home Screen
// ignore: must_be_immutable
class BisnisView extends GetView<BisnisController> {

  const BisnisView({Key? key}) : super(key: key);

  @override
    Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                leading: PopupMenuButton(
                  // color: const Color.fromARGB(255, 154, 172, 193),
                  color: const Color.fromARGB(255, 241, 220, 218),
                  icon: const Icon(Icons.list),
                  itemBuilder: (context) =>
                      userLog ? popupMenuLoggedIn : popupMenu,
                  onSelected: (String newValue) {
                    if (newValue != Routes.BISNIS) {
                      // Navigator.of(context).pushNamed(newValue);
                      Get.offAllNamed(newValue);
                    }
                  },
                ),
                expandedHeight: 200.0,
                floating: true,
                pinned: true,
                snap: true,
                actionsIconTheme: const IconThemeData(opacity: 0.0),
                title: const Text(
                  'Bisnis',
                  style: TextStyle(color: Colors.orangeAccent),
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
                bottom: const TabBar(
                  indicatorColor: Colors.orangeAccent,
                  indicatorWeight: 4,
                  tabs: [
                    Tab(text: "Bisnis"),
                    Tab(text: "Property"),
                    Tab(text: "Infrastruktur"),
                    Tab(text: "Syariah"),
                    Tab(text: "Industry"),
                    Tab(text: "Bursa"),
                    Tab(text: "UMKM"),
                    Tab(text: "Financial"),
                    Tab(text: "BUMN"),
                  ],
                  isScrollable: true,
                ),
              ),
            ];
          },
          body: TabBarView(children: [
            CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    const SizedBox(
                      height: 400,
                      child: Center(
                        child: Text(
                          'Bisnis Tab',
                          style: TextStyle(fontSize: 40),
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
            CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    const SizedBox(
                      height: 400,
                      child: Center(
                        child: Text(
                          'Property Tab',
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                    Container(
                      height: 1200,
                      color: Colors.grey,
                    ),
                  ]),
                ),
              ],
            ),
            CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    const SizedBox(
                      height: 400,
                      child: Center(
                        child: Text(
                          'Infrastruktur Tab',
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                    Container(
                      height: 1200,
                      color: Colors.grey,
                    ),
                  ]),
                ),
              ],
            ),
            CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    const SizedBox(
                      height: 400,
                      child: Center(
                        child: Text(
                          'Syariah Tab',
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                    Container(
                      height: 1200,
                      color: Colors.grey,
                    ),
                  ]),
                ),
              ],
            ),
            CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    const SizedBox(
                      height: 400,
                      child: Center(
                        child: Text(
                          'Industry Tab',
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                    Container(
                      height: 1200,
                      color: Colors.grey,
                    ),
                  ]),
                ),
              ],
            ),
            CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    const SizedBox(
                      height: 400,
                      child: Center(
                        child: Text(
                          'Bursa Tab',
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                    Container(
                      height: 1200,
                      color: Colors.grey,
                    ),
                  ]),
                ),
              ],
            ),
            CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    const SizedBox(
                      height: 400,
                      child: Center(
                        child: Text(
                          'UMKM Tab',
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                    Container(
                      height: 1200,
                      color: Colors.grey,
                    ),
                  ]),
                ),
              ],
            ),
            CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    const SizedBox(
                      height: 400,
                      child: Center(
                        child: Text(
                          'Financial Tab',
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                    Container(
                      height: 1200,
                      color: Colors.grey,
                    ),
                  ]),
                ),
              ],
            ),
            CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    const SizedBox(
                      height: 400,
                      child: Center(
                        child: Text(
                          'BUMN Tab',
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                    Container(
                      height: 1200,
                      color: Colors.grey,
                    ),
                  ]),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
