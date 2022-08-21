import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/video_controller.dart';
import '../../../routes/app_menu.dart';
import '../../../routes/search_help.dart';

// Video Screen
class VideoView extends GetView<VideoController> {

  const VideoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 12,
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
                    if (newValue != Routes.VIDEO) {
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
                  'Video',
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
                    Tab(text: "Video"),
                    Tab(text: "Top News"),
                    Tab(text: "Indonesia Terkini"),
                    Tab(text: "Kilas Nusantara"),
                    Tab(text: "Kabar Dunia"),
                    Tab(text: "Podcast"),
                    Tab(text: "Feature"),
                    Tab(text: "Int`l Corner"),
                    Tab(text: "30 Menit"),
                    Tab(text: "Antarakita"),
                    Tab(text: "Lifestyle"),
                    Tab(text: "Sport Antara"),
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
                          'Video Tab',
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
                          'Top News Tab',
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
                          'Indonesia Terkini Tab',
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
                          'Kilas Nusantara Tab',
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
                          'Kabar Dunia Tab',
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
                          'Podcast Tab',
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
                          'Feature Tab',
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
                          'Int`l Corner Tab',
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
                          '30 Menit Tab',
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
                          'Antarkita Tab',
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
                          'Lifestyle Tab',
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
                          'Sport Antara Tab',
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
