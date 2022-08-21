import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/lifestyle_controller.dart';
import '../../../routes/app_menu.dart';
import '../../../routes/search_help.dart';


// Lifestyle Screen
class LifestyleView extends GetView<LifestyleController> {

  const LifestyleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 11,
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
                    if (newValue != Routes.LIFESTYLE) {
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
                  'Lifestyle',
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
                    Tab(text: "Lifestyle"),
                    Tab(text: "Hiburan"),
                    Tab(text: "Otomotif"),
                    Tab(text: "Travel"),
                    Tab(text: "Health"),
                    Tab(text: "Parenting"),
                    Tab(text: "Fashion"),
                    Tab(text: "Kuliner"),
                    Tab(text: "Beauty"),
                    Tab(text: "Spiritualism"),
                    Tab(text: "Tekno"),
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
                          'Lifestyle Tab',
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
                          'Hiburan Tab',
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
                          'Otomotif Tab',
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
                          'Travel Tab',
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
                          'Health Tab',
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
                          'Parenting Tab',
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
                          'Fashion Tab',
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
                          'Kuliner Tab',
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
                          'Beauty Tab',
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
                          'Spiritualism Tab',
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
                          'Tekno Tab',
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
