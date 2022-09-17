import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import '../model/an_html.dart';
import '../model/an_response.dart';


Future<GetNews?> getGetNews(String url) async {
  GetNews? result;
  try {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = GetNews.fromJson(item);
    } else {
      print('error');
    }
  } catch (e) {
    log(e.toString());
  }
  return result;
  }

Future<Readnews?> getReadNews(String url) async {
  Readnews? result;
  try {
    final response = await http.get(
      // Uri.parse('https://www.antaranews.com/api/latest?key=eb2b7bce10958893719e9c5906c8c651&app_version=1.102&action=read_news&news_id=3120853'),
      Uri.parse(url),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      // result = DataModel.fromJson(item);
      result = Readnews.fromJson(item);
    } else {
      print('error');
    }
  } catch (e) {
    log(e.toString());
  }
  return result;
}

String formApiGetToHtml(Readnews respData) {

  HtmlElement elements = HtmlElement(respData.data.photo, respData.data.title, respData.data.content, '');
  return elements.getHtmlText();
}














// enum RequestType { get, put, post }

// class AntaraApiService{
//   const AntaraApiService._();

//   static Map<String, String> _getHeaders() => {
//     'Content-Type': 'application/json',
//   };


//   static Future<http.Response>? _createRequest({
//     required RequestType requestType,
//     required Uri uri,
//     Map<String, String>? headers,
//     Map<String, dynamic>? body,
//     }){
//     if(requestType == RequestType.get){
//       return http.get(uri, headers: headers);
//     }
//     return null;
//   }

//   static Future<http.Response?>? sendRequest({
//     required RequestType requestType,
//     required String url,
//     Map<String, dynamic>? body,
//     Map<String, String>? queryParam,
//   }) async {
//     try{
//       final _header = _getHeaders();
//       final _url = NetworkHelper.concatUrlQP(url, queryParam);

//       final response = await _createRequest(
//           requestType: requestType,
//           uri: Uri.parse(_url),
//           headers: _header,
//           body: body
//       );

//       return response;
//     } catch (e){
//       print('Error - $e');
//       return null;
//     }
//   }
// }
