import 'dart:io';

class NetworkUtil{
  Future<bool> getConncetionStatue() async {
    final result = await InternetAddress.lookup('google.com');
    bool isInternetAvailable = false;
    try {

      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isInternetAvailable =  true;
      }
    } on SocketException catch (_) {
      isInternetAvailable = false;
    }
    return isInternetAvailable;
  }
}