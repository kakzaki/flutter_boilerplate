// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// import '../homescreen.dart';
// import '../model/user.dart';
// import '../provider/url.dart';
// import '../dbhelper/dbhelper.dart';
// import '../util/dialog.dart';
// import '../verifikasisms.dart';
//
// var dbhelper = DBHelper();
//
// Future postLogin(BuildContext context,
//     {int tipe = 0,
//     String email,
//     String password,
//     String phone,
//     String phonecode,
//     String token,
//     bool resendcode = false}) async {
//   HeadUpLoading.show(context);
//   var dbhelper = DBHelper();
//   // var urldasar = Provider.of<URL>(context,listen: false).getUrl();
//   // var status = await OneSignal.shared.getPermissionSubscriptionState();
//   // String onesignalUserId = status.subscriptionStatus.userId;
//   // String device_id =  await PlatformDeviceId.getDeviceId;
//   String urlterusan = "api/login";
//   Dio dio = new Dio();
//   Map<String, dynamic> maps = Map();
//   switch (tipe) {
//     case 0: //phone
//       String signature = await SmsAutoFill().getAppSignature;
//       maps["phone"] = phone;
//       maps["phonecode"] = phonecode;
//       maps["signature"] = signature;
//       break;
//     case 1: //email
//       maps["username"] = email;
//       maps["password"] = password;
//       break;
//     case 2: //google
//       maps["token"] = token;
//       urlterusan = "api/login/google";
//       break;
//     case 3: //facebook
//       maps["token"] = token;
//       urlterusan = "api/login/facebook";
//       break;
//   }
//   // if(tipe!=0) {
//   //   if (onesignalUserId != null) {
//   //     maps["player_id"] = onesignalUserId;
//   //   }
//   //   if (device_id != null) {
//   //     maps["device_id"] = device_id;
//   //   }
//   // }
//   FormData formdata = new FormData.fromMap(maps);
//   dio.interceptors.add(PrettyDioLogger(requestHeader: true, requestBody: true));
//   try {
//     final Response response = await dio.post(urlallkasir + urlterusan,
//         data: formdata,
//         options: Options(
//           responseType: ResponseType.json,
//         ));
//     var data;
//     data = response.data;
//     if (data['status'] == true ||
//         data['result'] == true ||
//         data['success'] == true ||
//         data['code'] == 200) {
//       var profile = data['data']['pelanggan'];
//       if (resendcode == true) {
//         HeadUpLoading.hide();
//         return data;
//       } else {
//         HeadUpLoading.hide();
//         switch (tipe) {
//           case 0: //phone
//             Navigator.pushReplacement(
//                 context,
//                 PageTransition(
//                     type: PageTransitionType.leftToRight,
//                     child: VerifikasiSMS(
//                       kodenomor: phonecode,
//                       nomorhp: phone,
//                       result: data,
//                     )));
//             break;
//           default: //selain phone
//             dbhelper.saveUser(User(
//                 "${profile['id']}",
//                 "${profile['name'] ?? ""}",
//                 "$password",
//                 "${profile['email'] ?? ""}",
//                 "${profile['phone'] ?? ""}",
//                 "${profile['api_token']}"));
//             // _googleSignIn.signOut();
//             Navigator.pushReplacement(
//                 context,
//                 PageTransition(
//                     type: PageTransitionType.leftToRight, child: HomeScreen()));
//             break;
//         }
//       }
//     } else {
//       HeadUpLoading.hide();
//       dialogwarning(context, data);
//     }
//   } catch (e) {
//     HeadUpLoading.hide();
//     dialogwarning(context, {"result": false, "message": "$e"});
//   }
// }
//
// // GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>['email', ],);
// // Future loginGmail(BuildContext context) async {
// //   _googleSignIn.signIn().then((result){
// //     result.authentication.then((googleKey){
// //       print("token "+"${googleKey.accessToken}");
// //       postLogin(context,tipe: 2,token: "${googleKey.accessToken}");
// //     }).catchError((err){
// //       print('inner error');
// //     });
// //   }).catchError((err){
// //     print('error occured');
// //   });
// // }
// //
// // final FacebookLogin facebookSignIn = new FacebookLogin();
// // Future loginFacebook(BuildContext context) async {
// //   final FacebookLoginResult result = await facebookSignIn.logIn(['email']);
// //   switch (result.status) {
// //     case FacebookLoginStatus.loggedIn:
// //       final FacebookAccessToken accessToken = result.accessToken;
// //       print("token "+"${accessToken.token}");
// //       postLogin(context,tipe: 3,token: "${accessToken.token}");
// //       break;
// //     case FacebookLoginStatus.cancelledByUser:
// //       print('Login cancelled by the user.');
// //       break;
// //     case FacebookLoginStatus.error:
// //       print('Something went wrong with the login process.\n'
// //           'Here\'s the error Facebook gave us: ${result.errorMessage}');
// //       break;
// //   }
// // }
//
// Future postRegister(BuildContext context,
//     {int tipe = 0,
//     String email,
//     String password,
//     String passwordkonfirm,
//     String phone,
//     String phonecode,
//     String token,
//     bool resendcode = false}) async {
//   HeadUpLoading.show(context);
//   // var dbhelper = DBHelper();
//   // final rest =Provider.of<RestApi>(context,listen: false);
//   //var urldasar = Provider.of<URL>(context,listen: false).getUrl();
//   // var status = await OneSignal.shared.getPermissionSubscriptionState();
//   // String onesignalUserId = status.subscriptionStatus.userId;
//   // String device_id =  await PlatformDeviceId.getDeviceId;
//   String urlterusan = "api/register";
//   Dio dio = new Dio();
//   Map<String, dynamic> maps = Map();
//   switch (tipe) {
//     case 0: //phone
//       String signature = await SmsAutoFill().getAppSignature;
//       maps["phone"] = phone;
//       maps["phonecode"] = phonecode;
//       maps["signature"] = signature;
//       break;
//     case 1: //email
//       String username = email.substring(0, email.indexOf('@'));
//       maps["username"] = username;
//       maps["password"] = password;
//       maps["email"] = email;
//       break;
//     case 2: //google
//       maps["token"] = token;
//       urlterusan = "api/register/google?X-API-KEY=doran_data";
//       break;
//     case 3: //facebook
//       maps["token"] = token;
//       urlterusan = "api/register/facebook?X-API-KEY=doran_data";
//       break;
//   }
//   // if(tipe!=0) {
//   //   if (onesignalUserId != null) {
//   //     maps["player_id"] = onesignalUserId;
//   //   }
//   //   if (device_id != null) {
//   //     maps["device_id"] = device_id;
//   //   }
//   // }
// //  FormData formdata = new FormData.fromMap(maps);
//   dio.interceptors
//       .add(PrettyDioLogger(requestHeader: false, requestBody: true));
//   try {
//     final Response response = await dio.post(urlallkasir + urlterusan,
//         data: maps,
//         options: Options(
//           responseType: ResponseType.json,
//           // contentType:Headers.jsonContentType ,
//           // method: "POST"
//         ));
//     var data = response.data;
//     if (data['status'] == true ||
//         data['result'] == true ||
//         data['success'] == true ||
//         data['code'] == 200) {
//       // var profile = data['data'];
//       if (resendcode == true) {
//         HeadUpLoading.hide();
//         return data;
//       } else {
//         switch (tipe) {
//           case 0: //phone
//             HeadUpLoading.hide();
//             Navigator.pushReplacement(
//                 context,
//                 PageTransition(
//                     type: PageTransitionType.leftToRight,
//                     child: VerifikasiSMS(
//                       kodenomor: phonecode,
//                       nomorhp: phone,
//                       result: data,
//                       register: true,
//                     )));
//             break;
//           case 1: //email
//             HeadUpLoading.hide();
//             dialogwarning(context, data, tutup: true).then((value) {
//               if (value == true) {
//                 Navigator.pop(context);
//               }
//             });
//             break;
//           default: //selain phone
//             HeadUpLoading.hide();
//             // dbhelper.saveUser(User(
//             //     "${profile['id']}", "${profile['displayName'] ?? ""}", "$password",
//             //     "${profile['email'] ?? ""}", "",
//             //     "${profile['token']}"));
//             // // _googleSignIn.signOut();
//             // Navigator.pushReplacement(context, PageTransition(
//             //     type: PageTransitionType.leftToRight, child: HomeScreen()));
//             break;
//         }
//       }
//     } else {
//       HeadUpLoading.hide();
//       dialogwarning(context, data);
//     }
//   } on DioError catch (e) {
//     HeadUpLoading.hide();
//     dialogwarning(context, e.response.data);
//   }
// }
//
// Future postAktivationOTP(BuildContext context,
//     {String phone, String phonecode, String kodeotp}) async {
//   HeadUpLoading.show(context);
//   // var urldasar = Provider.of<URL>(context,listen: false).getUrl();
//   String urlterusan = "api/activation/otp";
//   Dio dio = new Dio();
//   Map<String, dynamic> maps = Map();
//   maps["phone"] = phone;
//   maps["phonecode"] = phonecode;
//   maps["otp_code"] = kodeotp;
//   FormData formdata = new FormData.fromMap(maps);
//   dio.interceptors
//       .add(PrettyDioLogger(requestHeader: false, requestBody: true));
//   Response response = await dio.post(urlallkasir + urlterusan,
//       data: formdata,
//       options: Options(
//         responseType: ResponseType.json,
//       ));
//   return response.data;
// }
//
// // Future registerGmail(BuildContext context) async {
// //   _googleSignIn.signIn().then((result){
// //     result.authentication.then((googleKey){
// //       print("token "+"${googleKey.accessToken}");
// //       postRegister(context,tipe: 2,token: "${googleKey.accessToken}");
// //     }).catchError((err){
// //       print('inner error');
// //     });
// //   }).catchError((err){
// //     print('error occured');
// //   });
// // }
// //
// // Future registerFacebook(BuildContext context) async {
// //   final FacebookLoginResult result = await facebookSignIn.logIn(['email']);
// //   switch (result.status) {
// //     case FacebookLoginStatus.loggedIn:
// //       final FacebookAccessToken accessToken = result.accessToken;
// //       print("token "+"${accessToken.token}");
// //       postRegister(context,tipe: 3,token: "${accessToken.token}");
// //       break;
// //     case FacebookLoginStatus.cancelledByUser:
// //       print('Register cancelled by the user.');
// //       break;
// //     case FacebookLoginStatus.error:
// //       print('Something went wrong with the login process.\n'
// //           'Here\'s the error Facebook gave us: ${result.errorMessage}');
// //       break;
// //   }
// // }
//
// Future postEditProfil(BuildContext context,
//     {String email,
//     String nama,
//     String telepon,
//     String alamat,
//     String idcountry,
//     String idprovinsi,
//     String idkabupaten,
//     String idkecamatan,
//     String kodepos,
//     File image}) async {
//   var urldasar = Provider.of<URL>(context, listen: false).getUrl();
//   HeadUpLoading.show(context);
//   User user = await fetchUserFromDatabase();
//   final rest = Provider.of<RestApi>(context, listen: false);
//   Map datauser;
//   Dio dio = new Dio();
//   Map<String, dynamic> maps = Map();
//   if (email != "" && email != null) {
//     maps["email"] = "$email".trim();
//   }
//   if (nama != "" && nama != null) {
//     maps["first_name"] = nama;
//   }
//   Map<String, dynamic> mapsbiling = Map();
//   if (email != "" && email != null) {
//     mapsbiling["email"] = "$email".trim();
//   }
//   if (nama != "" && nama != null) {
//     mapsbiling["first_name"] = nama;
//   }
//   if (telepon != "" && telepon != null) {
//     mapsbiling["phone"] = telepon;
//   }
//   if (alamat != "" && alamat != null) {
//     mapsbiling["address_1"] = alamat;
//   }
//   if (idcountry != null && idcountry != "") {
//     mapsbiling["country"] = idcountry;
//   }
//   if (idprovinsi != null && idprovinsi != "") {
//     mapsbiling["state"] = idprovinsi;
//   }
//   if (idkabupaten != null && idkabupaten != "") {
//     mapsbiling["city"] = idkabupaten;
//   }
//   if (idkecamatan != null && idkecamatan != "") {
//     mapsbiling["address_2"] = idkecamatan;
//   }
//   if (kodepos != "" && kodepos != null) {
//     mapsbiling["postcode"] = kodepos;
//   }
//
//   Map<String, dynamic> mapsshipping = Map();
//   if (nama != "" && nama != null) {
//     mapsshipping["first_name"] = nama;
//   }
//   if (alamat != "" && alamat != null) {
//     mapsshipping["address_1"] = alamat;
//   }
//   if (idcountry != null && idcountry != "") {
//     mapsshipping["country"] = idcountry;
//   }
//   if (idprovinsi != null && idprovinsi != "") {
//     mapsshipping["state"] = idprovinsi;
//   }
//   if (idkabupaten != null && idkabupaten != "") {
//     mapsshipping["city"] = idkabupaten;
//   }
//   if (idkecamatan != null && idkecamatan != "") {
//     mapsshipping["address_2"] = idkecamatan;
//   }
//   if (kodepos != "" && kodepos != null) {
//     mapsshipping["postcode"] = kodepos;
//   }
//
//   if (mapsbiling.isNotEmpty) {
//     maps["billing"] = mapsbiling;
//   }
//   if (mapsshipping.isNotEmpty) {
//     maps["shipping"] = mapsshipping;
//   }
//   // if(image!=null) {
//   //   maps["image"] = await MultipartFile.fromFile(image.path,filename: "profile_${RandomString.create(10)}.png",);
//   // }
//   //FormData formdata = new FormData.fromMap(maps);
//   dio.interceptors.add(PrettyDioLogger(requestHeader: true, requestBody: true));
//   try {
//     Response response = await dio.post(urldasar + "wc/customers",
//         data: maps,
//         options: Options(
//           headers: {"Authorization": "Bearer ${user.apitoken}"},
//           //  method: 'PUT',
//           responseType: ResponseType.json,
//         ));
//     datauser = await response.data;
//     if (datauser['result'] == false || datauser['status'] == true) {
//       HeadUpLoading.hide();
//       dialogwarning(context, datauser);
//     } else {
//       rest.setProfile(datauser);
//       HeadUpLoading.hide();
//       dialogwarning(context, {"result": true, "message": "Berhasil Simpan"},
//               tutup: true)
//           .then((value) {
//         if (value == true) {
//           Navigator.of(context).pop(true);
//         }
//       });
//     }
//   } on DioError catch (e) {
//     HeadUpLoading.hide();
//     dialogwarning(context, e.response.data);
//   }
//   return datauser;
// }
