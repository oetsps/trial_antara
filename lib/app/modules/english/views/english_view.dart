import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/english_controller.dart';
import '../../../routes/app_menu.dart';
import '../../../routes/search_help.dart';


// Home Screen
class EnglishView extends GetView<EnglishController> {

  const EnglishView({Key? key}) : super(key: key);

  @override
    Widget build(BuildContext context) {
    return DefaultTabController(
      length: 10,
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
                    if (newValue != Routes.ENGLISH) {
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
                  'English',
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
                    Tab(text: "English"),
                    Tab(text: "Current Issue"),
                    Tab(text: "World"),
                    Tab(text: "Business"),
                    Tab(text: "Indonesia"),
                    Tab(text: "Article"),
                    Tab(text: "Photo"),
                    Tab(text: "Press Release"),
                    Tab(text: "Info Graphic"),
                    Tab(text: "Link Bahasa"),
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
                          'English Tab',
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
                          'Current Issue Tab',
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
                          'World Tab',
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
                          'Business Tab',
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
                          'Indonesia Tab',
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
                          'Article Tab',
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
                          'Photo Tab',
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
                          'Press Release Tab',
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
                          'Info Graphic Tab',
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
                          'Link Bahasa',
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
