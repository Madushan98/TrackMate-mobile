const _baseUrl = "baseUrl";

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

Map<String, dynamic> devConstants = {
  _baseUrl: "https://devapi.xyz.com/",
};


Map<String, dynamic> stageConstants = {
  _baseUrl: "https://api.stage.com/",
};

Map<String, dynamic> prodConstants = {
  _baseUrl: "https://api.production.com/",
};