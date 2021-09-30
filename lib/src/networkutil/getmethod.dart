// import 'dart:async';
// import 'package:dio/dio.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';
// import 'package:flutter/material.dart';
//
//
// Future fetchProfile(BuildContext context) async {
//   Dio dio = Dio();
//   User user = await fetchUserFromDatabase();
//   // var urldasar = Provider.of<URL>(context,listen: false).getUrl();
//   final rest = Provider.of<RestApi>(context, listen: false);
//   dio.interceptors.add(PrettyDioLogger(
//     requestHeader: true,
//   ));
//   Response response;
//   var data;
//   if (user != null) {
//     try {
//       response = await dio.get(urlallkasir + "api/pelanggan",
//           options: Options(
//             headers: {"token": "${user.apitoken}"},
//             responseType: ResponseType.json,
//           ));
//     } on DioError catch (e) {
//       if (e.response.statusCode == 403) {
//         dbHelper.deleteUser();
//         return Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
//           MaterialPageRoute(builder: (context) => LoginPage()),
//           (Route<dynamic> route) => false,
//         );
//       }
//     }
//     data = await response.data;
//     rest.setProfile(data);
//   }
//   return data;
// }
//
