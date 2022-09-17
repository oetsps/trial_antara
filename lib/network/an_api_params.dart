import 'an_api_enums.dart';

typedef NetworkCallBack<R> = R Function(dynamic);
typedef NetworkOnFailureCallBackWithMessage<R> = R Function(
    NetworkResponseErrorType, String?);

const String API_URL = 'https://www.antaranews.com/api/latest';
const String API_KEY = 'eb2b7bce10958893719e9c5906c8c651';
const String APP_VERSION = '1.102';

// Actions list
const String ActGetCategory = 'get_category';
const String ActGetNewsType = 'get_news_type';
const String ActGetNews = 'get_news';
const String ActSearchNews = 'search_news';
const String ActGetTopNews = 'get_topnews';
const String ActGetPopularNews = 'get_popular_news';
const String ActGetRelatedNews = 'get_related_news';
const String ActReadNews = 'read_news';
const String ActGetGallery = 'get_gallery';
const String ActGetPhotoGallery = 'get_photo_gallery';
const String ActGetRelatedGallery = 'get_related_gallery';
const String ActGetTopic = 'get_topic';
const String ActGetTopicNews = 'get_topic_news';
const String ActGetSpecialReport = 'get_special_report';
const String ActGetNewsSpecialReport = 'get_news_special_report';
const String ActGetVideo = 'get_video';
const String ActPlayVideo = 'play_video';
const String ActGetRelatedVideo = 'get_related_video';

Map<String, String> HomeCategory = {
  'Berita': '',
  'Top': 'TOP',
  'Politik': 'PLK',
  'Hukum': 'HUK',
  'Metro': 'MET',
  'Humaniora': 'HNA',
  'Nusantara': 'TEK',     /* temporary, wait for design */
  // 'Tenologi': 'TEK',
  'Dunia': 'INT',
};

class ApiPars {
  Map<String, dynamic> pars = {};
  
  ApiPars();

  Map<String, dynamic> apiSetAction({
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
  }) => pars = 
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
  String rqAction = '';
  String rqCategory = '';
  String rqSubCategory = '';


  RequestAnApi();

  String? requestAnNews({required String action, String? category, int? news_id, int? page, int? limit}) {
    ApiPars queryParams = ApiPars();
    String? url = '';
    // Map<String, dynamic> querySubParams = {'action': 'read_news', 'page': '5'};

    rqAction = action;
    rqCategory = (category == null) ? '' : category;
    if (category != null) {
      rqCategory = category;
    }

    // switch (rqAction) {
    switch (action) {
      case 'read_news': {
        if (news_id == null) {
          print('news_id is required for action read_news!');
          url = null;
          break;
        }
        queryParams.apiSetAction(
          valAction: action,
          valCategory: HomeCategory[(category == null) ? 'Berita' : category].toString(),
          // valCategory: rqCategory,
          valNewsId: news_id.toString(),
        );
      }
        break;
      case 'get_news': {
        print('Test: ${HomeCategory[(category == null) ? 'Berita' : category].toString()}');
        queryParams.apiSetAction(
          valAction: action,
          valCategory: HomeCategory[(category == null) ? 'Berita' : category].toString(),
        );
      }
        break;
      default:
        break;
    }

    if (url == null) {
      print('cannot determine valid url!');
      return null;
    }
    url = queryParams.composeApiRequest(queryParams.pars);
    return url;
  }

}