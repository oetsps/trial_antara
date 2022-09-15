import 'package:flutter/material.dart';
import 'dart:convert';

import 'an_api_enums.dart';

typedef NetworkCallBack<R> = R Function(dynamic);
typedef NetworkOnFailureCallBackWithMessage<R> = R Function(
    NetworkResponseErrorType, String?);

const String API_URL = 'https://www.antaranews.com/api/latest?';
const String API_KEY = 'eb2b7bce10958893719e9c5906c8c651';
const String APP_VERSION = '1.102';

// Actions list
const String GetCategory = 'get_category';
const String GetNewsType = 'get_news_type';
const String GetNews = 'get_news';
const String SearchNews = 'search_news';
const String GetTopNews = 'get_topnews';
const String GetPopularNews = 'get_popular_news';
const String GetRelatedNews = 'get_related_news';
const String ReadNews = 'read_news';
const String GetGallery = 'get_gallery';
const String GetPhotoGallery = 'get_photo_gallery';
const String GetRelatedGallery = 'get_related_gallery';
const String GetTopic = 'get_topic';
const String GetTopicNews = 'get_topic_news';
const String GetSpecialReport = 'get_special_report';
const String GetNewsSpecialReport = 'get_news_special_report';
const String GetVideo = 'get_video';
const String PlayVideo = 'play_video';
const String GetRelatedVideo = 'get_related_video';

class ApiPars {
  const ApiPars();

  Map<String, dynamic> apiSetAction({
//       required String valKey,
//       required String valVer,
    required String valAction,
    String valNewsId = '',
    String valCategory = '',
    String valSubCategory = '',
    String valPage = '',
    String valLimit = '',
    String valBrief = '',
    String valGalleryId = '',
    String valQuote = '',
    String valGet = '',
    String valKeyWord = '',
    String valDay = '',
    String valDateStart = '',
    String valDateEnd = '',
    String valTotalResult = '',
  }) =>
      {
        'key': API_KEY,
        'app_version': APP_VERSION,
        'action': valAction,
        'news_id': valNewsId,
        'category': valCategory,
        'subcategory': valSubCategory,
        'page': valPage,
        'limit': valLimit,
        'brief': valBrief,
        'gallery_id': valGalleryId,
        'quote': valQuote,
        'get': valGet,
        'keyword': valKeyWord,
        'day': valDay,
        'total_result': valTotalResult,
      };

  // String composeApiRequest(String url, Map<String, dynamic>? queryParameters) {
  String composeApiRequest(Map<String, dynamic>? queryParameters) {
    String url = API_URL;
    // if (url.isEmpty) return url;
    if (queryParameters == null || queryParameters.isEmpty) {
      return url;
    }
    final StringBuffer stringBuffer = StringBuffer("$url?");
    queryParameters.forEach((key, value) {
      if (value.trim() == '') return;
      if (value.contains(' ')) throw Exception('Invalid Input Exception');
      stringBuffer.write('$key=$value&');
    });
    final result = stringBuffer.toString();
    return result.substring(0, result.length - 1);
  }
}


class RequestAnApi {
  final String rqAction;
  final String rqCategory;

  RequestAnApi(this.rqAction, this.rqCategory);

  String requestAnNews(int page, int limit) {
    ApiPars queryParams = const ApiPars();
    String url;
    Map<String, dynamic> querySubParams = {'action': 'read_news', 'page': '5'};

    switch (rqAction) {
      case 'read_news': {
        // queryParam = {'action': 'read_news', 'page': '5'};
      }
        break;
    }

    url = queryParams.composeApiRequest(querySubParams);
    return url;
  }

}