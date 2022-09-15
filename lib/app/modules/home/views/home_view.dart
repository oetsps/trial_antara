import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../routes/app_pages.dart';
import '../../../routes/app_menu.dart';
import '../../../routes/search_help.dart';
import '../views/home_repository.dart';


// Berita Screen
class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  // State<HomeView> createState() => _HomeViewState();
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var topik = PageTopik(AppTopik.Berita);
  String routeTopik = Routes.HOME;
  late WebViewController _controller;
  // late WebViewController _webViewController;

  // _HomeViewState({Key? key}) : super(key: key);

  String textDisplay = '';

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
      final postData = Provider.of<DataHome>(context, listen: false);
      postData.getPostData();
    }

    return ChangeNotifierProvider(
      create: ((context) => DataHome()),
      child: Builder(builder: (context) {
        final postData = Provider.of<DataHome>(context, listen: false);
        postData.getPostData();
        return MaterialApp(
          home: DefaultTabController(
            length: topik.subTopikLength(),
            child: Scaffold(
              body: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
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
                          for (var str in topik.getSubTopik())
                            Tab(text: str.toString())
                        ],
                        isScrollable: true,
                        onTap: (value) {
                          // scroll to selected SubTopik tapbar
                          // update the currentSubTopik status in ap_menu.dart to selected SubTopik
                          // find urlAPI address
                        },
                      ),
                    ),
                  ];
                },
                body: Builder(
                  builder: (context) {
                    final postData = Provider.of<DataHome>(context);
                    return TabBarView(
                      children: [
                        for (String str in topik.getSubTopik())
                          CustomScrollView(
                            slivers: [
                              SliverToBoxAdapter(
                                child: SizedBox(
                                    height: 360,
                                    child: ListView.builder(
                                        padding: const EdgeInsets.all(5.0),
                                        scrollDirection: Axis.vertical,
                                        itemCount: 1,
                                        itemBuilder: (context, index) {
                                          // final postData = Provider.of<DataHome>(context);
                                          return postData.loading
                                              ? Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    border: Border.all(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  height: 1000,
                                                  child: SpinKitThreeBounce(
                                                    itemBuilder: (BuildContext context, int index) {
                                                      return DecoratedBox(
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(15),
                                                          color: index.isEven ? Colors.black : Colors.grey,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                )
                                              : Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    // border: Border.all(
                                                    //   color: Colors.grey,
                                                    // ),
                                                  ),
                                                  height: 1000,
                                                  child: WebView(
                                                    initialUrl: 'about:blank',
                                                    javascriptMode: JavascriptMode.unrestricted,
                                                    onWebViewCreated: (controller) {
                                                      _controller = controller;
                                                      _controller.loadUrl(
                                                        Uri.dataFromString(
                                                          postData.resultHtml,
                                                          mimeType: 'text/html',
                                                          encoding: Encoding.getByName('utf-8')).toString());
                                                    },
                                                  ),
                                                );
                                        })),
                              ),
                              SliverList(
                                delegate: SliverChildListDelegate([
                                  for (int i = 0 ; i < (postData.loading ? 0 : postData.post!.data.related.length) ; i++)
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                      ),
                                      padding: const EdgeInsets.only(
                                          top: 2.0, bottom: 2.0),
                                      margin: const EdgeInsets.only(
                                          top: 2.0, bottom: 2.0),
                                      child: SizedBox(
                                        height: 30,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 50,
                                              height: 30.0,
                                              child: postData.loading ?
                                                Image.asset(
                                                'assets/images/antara.png',
                                                alignment: Alignment.center,
                                              )
                                                : Image.network(
                                                postData.post!.data.related[i].photo_small,
                                                alignment: Alignment.center,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            Expanded(
                                              child: Text(
                                                // postData.post!.data.related[i].title,
                                                postData.post == null ? ('$str - ${i + 1}') : postData.post!.data.related[i].title,
                                                softWrap: true,
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  // fontWeight: FontWeight.bold
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                ]),
                              ),
                            ],
                          ),
                      ],
                    );
                  }
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
