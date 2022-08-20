const _baseUrl = "baseUrl";
const _authUrl = "user-service";
const _passUrl = "pass-service";
const _covidDataUrl = "covid-service";

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

dynamic get authUrl {
  return _config[_authUrl];
}

dynamic get passUrl {
  return _config[_passUrl];
}
dynamic get covidDataUrl {
  return _config[_covidDataUrl];
}

Map<String, dynamic> devConstants = {
  _baseUrl: "https://localhost:7005/api/v1/",
  _authUrl: "https://5jr99q3aq7.execute-api.us-west-2.amazonaws.com/api/v1/",
  _passUrl: "https://5cij6xabb7.execute-api.us-west-2.amazonaws.com/api/v1/",
  _covidDataUrl: "https://www.hpb.health.gov.lk/api/get-current-statistical",
};

Map<String, dynamic> stageConstants = {
  _baseUrl: "https://localhost:7005/api/v1/",
  _authUrl: "https://5jr99q3aq7.execute-api.us-west-2.amazonaws.com/api/v1/",
  _passUrl: "https://5cij6xabb7.execute-api.us-west-2.amazonaws.com/api/v1/",
  _covidDataUrl: "https://www.hpb.health.gov.lk/api/get-current-statistical"
};

Map<String, dynamic> prodConstants = {
  _baseUrl: "https://localhost:7005/api/v1/",
  _authUrl: "https://5jr99q3aq7.execute-api.us-west-2.amazonaws.com/api/v1/",
  _passUrl: "https://5cij6xabb7.execute-api.us-west-2.amazonaws.com/api/v1/",
  _covidDataUrl: "https://www.hpb.health.gov.lk/api/get-current-statistical",
};
