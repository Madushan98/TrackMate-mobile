import 'dart:convert';

import 'package:covid_safe_app/configuration/app_exceptions.dart';
import 'package:covid_safe_app/models/Errors/errorModel.dart';
import 'package:covid_safe_app/screens/LoadingStatus.dart';
import 'package:flutter/material.dart';

class BaseController {
  void handleError(error,BuildContext context) {
    hideLoading();
    if (error is BadRequestException) {
      var message = error.message;
      var messageJson = json.decode(message);
      print(message);
      var errorModel = ErrorModel.fromJson(messageJson);
      LoadingStatus.showErroDialog(description: errorModel.message!,context: context);
    } else if (error is FetchDataException) {
      var message = error.message;
      var messageJson = json.decode(message);
      var errorModel = ErrorModel.fromJson(messageJson);
      LoadingStatus.showErroDialog(description: errorModel.message!,context: context);
    } else if (error is ApiNotRespondingException) {
      LoadingStatus.showErroDialog(
          description: 'Oops! It took longer to respond.',context: context);
    }
  }




  showLoading(String message) {
    LoadingStatus.showLoading(message);
  }

  hideLoading() {
    LoadingStatus.hideLoading();
  }
}
