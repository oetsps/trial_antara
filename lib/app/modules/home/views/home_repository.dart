import 'package:an_app_vone/app/routes/app_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../../model/an_response.dart';
import '../../../../network/an_get_services.dart';
import '../../../../network/an_api_params.dart';


class DataHome extends ChangeNotifier {
  // DataModel? post;
  Readnews? post;
  Readnews? sPost;
  GetNews? iPost;
  bool loading = false;
  bool loadingSingle = false;
  String subTopik = '';
  String resultHtml = '';
  String resultSingleHtml = '';
  RequestAnApi requestAnApi = RequestAnApi();

  getReadNewsData() async {
    loading = true;
    print('loading $subTopik');
    String? iUrl = requestAnApi.requestAnNews(action: 'get_news', category: subTopik);
    if (iUrl == null) {
      print('Error get_news cause of invalid url');
      return;
    }
    iPost = (await getGetNews(iUrl));
    print('OK: $iPost\n$iUrl');
    String? url = requestAnApi.requestAnNews(action: 'read_news', category: subTopik, news_id: iPost!.data[0].id);
    post = (await getReadNews(url!));
    if(post == null) {
      debugPrint("No data");
    }
    resultHtml = formApiGetToHtml(post!);
    loading = false;
    notifyListeners();
    return resultHtml;
  }

getReadSingleNews(int newsId) async {
    loadingSingle = true;

    print('Request news_id = $newsId');
    String? url = requestAnApi.requestAnNews(action: 'read_news', category: subTopik, news_id: newsId);
    sPost = (await getReadNews(url!));
    if(sPost == null) {
      debugPrint("No data");
    }
    resultSingleHtml = formApiGetToHtml(sPost!);
    print('Single HTML: $resultSingleHtml');
    loadingSingle = false;
    notifyListeners();
    return resultSingleHtml;
  }

  @override
  notifyListeners();

  String getSubTopik() {
    return subTopik;
  }

  void setSubTopik(String subTopik) {
    this.subTopik = subTopik;
  }

  composeHtml() {
    if(post == null) {
      debugPrint("No data");
    }
    resultHtml = formApiGetToHtml(post!);
    loading = false;
  }

  String getHtmlView() {
    return resultHtml;
  }
}
