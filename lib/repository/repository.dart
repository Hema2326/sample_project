import 'package:dio/dio.dart';

Future<Map<String, dynamic>> getImage() async {
  var dio = Dio();
  try {
    Response response = await dio.get(
      'https://dog.ceo/api/breeds/image/random',
    );
    if (response.statusCode == 200) {
      print(response.data);
      return response.data;
    }
    return response.data;
  } on DioError catch (e) {
    return {"success": false, "data": e.toString()};
  }
}

Future<Map<String, dynamic>> getListPage(int pageNum) async {
  var dio = Dio();
  try {
    Response response = await dio.get('https://www.cryptingup.com/api/markets',
        queryParameters: {"size": 10, "start": pageNum});
    if (response.statusCode == 200) {
      print(response.data);
      return response.data;
    }
    return response.data;
  } on DioError catch (e) {
    return {"success": false, "data": e.toString()};
  }
}
