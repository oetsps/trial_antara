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
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  PageTopik pageState = PageTopik(AppTopik.Berita);
  String routeTopik = Routes.HOME;

  late final TabController _tabController;
  late WebViewController _controller;
  // late WebViewController _webViewController;

  @override
  void initState() {
    _tabController = TabController(
        length: pageState.subTopik[AppTopik.Berita.index].length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => DataHome()),
      child: Builder(builder: (context) {
        final postData = Provider.of<DataHome>(context, listen: false);
        postData.setSubTopik(pageState.subTopik[AppTopik.Berita.index][0]);
        postData.getReadNewsData();
        final tabList = List.generate(
            pageState.subTopik[AppTopik.Berita.index].length,
            (index) => pageState.subTopik[AppTopik.Berita.index][index]);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: DefaultTabController(
            length: pageState.subTopikLength(),
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
                        pageState.getName(),
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
                        controller: _tabController,
                        indicatorColor: Colors.orangeAccent,
                        indicatorWeight: 4,
                        isScrollable: true,
                        tabs: [
                          ...tabList.map((label) => Tab(
                                child: Text(label),
                              )),
                        ],
                      ),
                    ),
                  ];
                },
                body: Builder(builder: (context) {
                  final postData = Provider.of<DataHome>(context);
                  return TabBarView(
                    controller: _tabController,
                    children: [
                      // for (String str in tabList)
                      ...tabList.map((label) => CustomScrollView(
                            slivers: [
                              SliverToBoxAdapter(
                                child: SizedBox(
                                  height: 360,
                                  child: ListView.builder(
                                    padding: const EdgeInsets.all(5.0),
                                    scrollDirection: Axis.vertical,
                                    itemCount: 1,
                                    itemBuilder: (context, index) {
                                      postData.setSubTopik(label);
                                      print('Topik: ${pageState.topik.name}, SubTopik: ${postData.getSubTopik()}');
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
                                                color: index.isEven
                                                  ? Colors.black : Colors.grey,
                                                ),
                                              );
                                              },
                                            ),
                                          )
                                          : Container(
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                            ),
                                            height: 1000,
                                            child: WebView(
                                              initialUrl: 'about:blank',
                                              javascriptMode: JavascriptMode.unrestricted,
                                              onWebViewCreated: (controller) {
                                                _controller = controller;
                                                postData.getReadNewsData();
                                                _controller.loadUrl(
                                                  Uri.dataFromString(
                                                    postData.resultHtml,
                                                    mimeType: 'text/html',
                                                    encoding: Encoding.getByName('utf-8')
                                                  ).toString()
                                                );
                                              },
                                            ),
                                          );
                                      }
                                    )
                                ),
                              ),
                              SliverList(
                                delegate: SliverChildListDelegate([
                                  for (int i = 0; i < (postData.loading ? 0 : postData.post!.data.related.length); i++)
                                    GestureDetector(
                                      // onTap: () {
                                      //   print(
                                      //       'show news_id = ${postData.post!.data.related[i].id} in new widget');
                                      // },
                                      onTap: (() => Navigator.of(context).push(MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          print('News: id = ${postData.post!.data.related[i].id}\n${postData.post!.data.related[i].title}');
                                          return Scaffold(
                                            appBar: AppBar(
                                              backgroundColor: Color.fromARGB(255, 172, 7, 7),
                                              centerTitle: true,
                                              foregroundColor: Colors.white,
                                              title: const Text('Title')
                                            ),
                                            body: Container(
                                              child: WebView(
                                              initialUrl: 'about:blank',
                                              javascriptMode: JavascriptMode.unrestricted,
                                              onWebViewCreated: (controller) {
                                                _controller = controller;
                                                postData.getReadSingleNews(postData.post!.data.related[i].id);
                                                _controller.loadUrl(
                                                  Uri.dataFromString(
                                                    postData.resultHtml,
                                                    mimeType: 'text/html',
                                                    encoding: Encoding.getByName('utf-8')
                                                  ).toString()
                                                );
                                              },

                                              ),
                                            ),
                                          );
                                        }
                                      ))),
                                      // onTap: () => Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             SingleNewsScreen())),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                        ),
                                        padding: const EdgeInsets.only(
                                          top: 2.0, bottom: 2.0
                                        ),
                                        margin: const EdgeInsets.only(
                                          top: 2.0, bottom: 2.0
                                        ),
                                        child: SizedBox(
                                          height: 30,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 50,
                                                height: 30.0,
                                                child: postData.loading
                                                  ? Image.asset(
                                                    'assets/images/antara.png',
                                                    alignment: Alignment.center,
                                                  )
                                                  : Image.network(
                                                    postData.post!.data.related[i].photo_small,
                                                    alignment:Alignment.center,
                                                  ),
                                              ),
                                              const SizedBox(
                                                width: 3,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  postData.post!.data.related[i].title,
                                                  softWrap: true,
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                ]),
                              ),
                            ],
                          )
                        ),
                    ],
                  );
                }),
              ),
            ),
          ),
        );
      }),
    );
  }
}
