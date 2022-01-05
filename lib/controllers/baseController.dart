import 'package:covid_safe_app/configuration/app_exceptions.dart';
import 'package:covid_safe_app/screens/LoadingStatus.dart';


class BaseController {
  void handleError(error) {
    hideLoading();
    if (error is BadRequestException) {
      var message = error.message;
      LoadingStatus.showErroDialog(description: message);
    } else if (error is FetchDataException) {
      var message = error.message;
      LoadingStatus.showErroDialog(description: message);
    } else if (error is ApiNotRespondingException) {
      LoadingStatus.showErroDialog(
          description: 'Oops! It took longer to respond.');
    }
  }

  showLoading([String message]) {
    LoadingStatus.showLoading(message);
  }

  hideLoading() {
    LoadingStatus.hideLoading();
  }
}