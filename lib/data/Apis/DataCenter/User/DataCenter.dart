import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../models/GetMassge.dart';
import '../../../models/RepotpRes.dart';
import '../../../models/ServiceRes.dart';
import '../../auth/user/auth_login.dart';

Future<ServiceRes> getDataService({required String service}) async {
  Uri url = Uri.https(
      'autorescue.services', '/api/app/v1/user/user/usergetserv/$service');
  http.Response response = await http.get(url);
  var json = jsonDecode(response.body);
  return ServiceRes.fromJson(json);
}

Future<GetMess> GetMessage() async {
  Uri url = Uri.https('autorescue.services',
      '/api/app/v1/user/user/get_mssg/${AuthLoginUser.idUser.toString()}');
  http.Response response = await http.get(url);
  var json = jsonDecode(response.body);
  return GetMess.fromJson(json);
}

Future<ReportRes> addPayment({
  required String num,
  required String date,
  required String cvc,
  required String cunt,
}) async {
  int? id = AuthLoginUser.idUser;

  Uri url = Uri.https('autorescue.services', '/api/app/v1/user/user/Add_money');
  http.Response response = await http.post(url, body: {
    "id": id.toString(),
    "num": num,
    "date": date,
    "cvc": cvc,
    "cunt": cunt,
  });
  var json = jsonDecode(response.body);
  return ReportRes.fromJson(json);
}
