import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../configuration/app_constants.dart';


class RoleService {

   String _UserRole = "User";

   String get UserRole => _UserRole;

  set UserRole(String value) {
    _UserRole = value;
  }

  Future<String> setUserRole() async {
    final storage = new FlutterSecureStorage();
    try{
      String? accessToken ;
      accessToken = await  storage.read(key: Constants.authToken);
      Map<String, dynamic>? tokenData = JwtDecoder.tryDecode(accessToken ?? '');
      print(tokenData);
      String role = tokenData!["UserType"] ;
      _UserRole = role ;
      return _UserRole ;

    }catch (e){
      _UserRole = "User" ;
      return _UserRole ;
    }

  }

}