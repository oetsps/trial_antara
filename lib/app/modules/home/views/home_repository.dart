import 'package:flutter/material.dart';
import 'dart:convert';
import '../../../../model/an_response.dart';
import '../../../../network/an_get_services.dart';
import '../../../../network/an_api_helper.dart';
import '../../../../network/an_api_params.dart';


import 'package:flutter/cupertino.dart';
import '../../../../network/an_get_services.dart';
import '../../../../model/an_response.dart';

class DataHome extends ChangeNotifier {
  // DataModel? post;
  Readnews? post;
  bool loading = false;
  String resultHtml = '';

  getPostData() async {
    loading = true;
    print('loading');
    // post = (await getSinglePostData())!;
    post = (await getAnApiAction())!;
    if(post == null) {
      debugPrint("No data");
    }
    resultHtml = formApiGetToHtml(post!);
    loading = false;
    notifyListeners();
    return resultHtml;
  }

  // @override
  // notifyListeners();

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


// class HomeRepository {
//   final String _baseUrl = API_URL;

//   Future<Readnews> getHomeNews() async {
//     final response = await AntaraApiService.sendRequest(
//       requestType: RequestType.get,
//       url: _baseUrl
//     );

//     return NetworkHelper.filterResponse(
//         callBack: (json) => Readnews.fromJson(json),
//         response: response,
//         onFailureCallBackWithMessage: (errorType, msg) =>
//         throw Exception('An Error has happened. $errorType - $msg'));
//   }
// }
