import 'package:flutter_login_demo/utils/request.dart';

Future login(data) {
  return Http()
      .requets('/Identity/Login', method: 'post', data: data);
}