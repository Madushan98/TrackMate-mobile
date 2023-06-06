const _baseUrl = "baseUrl";
const _authUrl = "auth-service";
const _passUrl = "pass-service";
const _covidDataUrl = "covid-service";
const _organizationUrl = "organization-service";
const _userUrl = "user-service";

enum Environment { dev, stage, prod }

Map<String, dynamic> _config = {};

//setting environments for the application

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

dynamic get organizationUrl {
  return _config[_organizationUrl];
}

dynamic get userUrl {
  return _config[_userUrl];
}

// Development Environment Endpoint Urls
Map<String, dynamic> devConstants = {
  _baseUrl: "https://localhost:7005/api/v1/",
  _authUrl: "https://20spkdv425.execute-api.us-east-1.amazonaws.com/api/v1/",
  _passUrl: "https://d3681tmgoa.execute-api.us-east-1.amazonaws.com/api/v1/",
  _covidDataUrl: "https://www.hpb.health.gov.lk/api/get-current-statistical",
  _organizationUrl:
      "https://96nqb0zl4l.execute-api.us-east-1.amazonaws.com/api/v1/",
  _userUrl: "https://lp4hqtxqyj.execute-api.us-east-1.amazonaws.com/api/v1/",
};

// Sage Environment Endpoint Urls
Map<String, dynamic> stageConstants = {
  _baseUrl: "https://localhost:7005/api/v1/",
  _authUrl: "https://20spkdv425.execute-api.us-east-1.amazonaws.com/api/v1/",
  _passUrl: "https://d3681tmgoa.execute-api.us-east-1.amazonaws.com/api/v1/",
  _covidDataUrl: "https://www.hpb.health.gov.lk/api/get-current-statistical",
  _organizationUrl:
      "https://96nqb0zl4l.execute-api.us-east-1.amazonaws.com/api/v1/",
  _userUrl: "https://lp4hqtxqyj.execute-api.us-east-1.amazonaws.com/api/v1/",
};

// Production Environment Endpoint Urls
Map<String, dynamic> prodConstants = {
  _baseUrl: "https://localhost:7005/api/v1/",
  _authUrl: "https://20spkdv425.execute-api.us-east-1.amazonaws.com/api/v1/",
  _passUrl: "https://d3681tmgoa.execute-api.us-east-1.amazonaws.com/api/v1/",
  _covidDataUrl: "https://www.hpb.health.gov.lk/api/get-current-statistical",
  _organizationUrl:
      "https://96nqb0zl4l.execute-api.us-east-1.amazonaws.com/api/v1/",
  _userUrl: "https://lp4hqtxqyj.execute-api.us-east-1.amazonaws.com/api/v1/",
};
