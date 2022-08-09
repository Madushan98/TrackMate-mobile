const _baseUrl = "baseUrl";
const _authService = "user-service";

enum Environment { dev, stage, prod }

Map<String, dynamic> _config = {};

void setEnvironment(Environment env) {
  switch (env) {
    case Environment.dev:
      _config = devConstants;
      break;
    case Environment.stage:
      _config = stageConstants;
      break;
    case Environment.prod:
      _config = prodConstants;
      break;
  }
}

dynamic get apiBaseUrl {
  return _config[_baseUrl];
}

dynamic get userService {
  return _config[_authService];
}

Map<String, dynamic> devConstants = {
  _baseUrl: "https://localhost:7005/api/v1/",
  _authService: "https://5jr99q3aq7.execute-api.us-west-2.amazonaws.com/api/v1/"
};

Map<String, dynamic> stageConstants = {
  _baseUrl: "https://localhost:7005/api/v1/",
  _authService: "https://5jr99q3aq7.execute-api.us-west-2.amazonaws.com/api/v1/"
};

Map<String, dynamic> prodConstants = {
  _baseUrl: "https://localhost:7005/api/v1/",
  _authService: "https://5jr99q3aq7.execute-api.us-west-2.amazonaws.com/api/v1/"
};
