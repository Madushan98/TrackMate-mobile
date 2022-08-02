import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticatedHttpClient extends http.BaseClient {

  AuthenticatedHttpClient();

  // Use a memory cache to avoid local storage access in each call
  String _inMemoryToken = '';
  Future<String> get getUserAccessToken async {
    // use in memory token if available
    if (_inMemoryToken.isNotEmpty) return _inMemoryToken;

    // otherwise load it from local storage
    _inMemoryToken = await _loadTokenFromSharedPreference();

    return _inMemoryToken;
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {


    // intercept each call and add the Authorization header if token is available
    var userAccessToken = await getUserAccessToken;
    if (userAccessToken.isNotEmpty) {
      request.headers.putIfAbsent('Authorization', () => userAccessToken);
    }

    return request.send();
  }

  Future<String> _loadTokenFromSharedPreference() async{


    var accessToken = '';
    final token = "aside";

    // If user is already authenticated, we can load his token from cache
    if (token != null) {
      accessToken = token;
    }
    return accessToken;
  }

  // Don't forget to reset the cache when logging out the user
  void reset() {
    _inMemoryToken = '';
  }
}