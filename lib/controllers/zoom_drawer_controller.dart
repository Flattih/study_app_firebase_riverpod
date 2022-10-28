import 'package:flutter_zoom_drawer/config.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MyZoomDrawerController {
  final zoomDrawerController = ZoomDrawerController();
  void toogleDrawer() {
    zoomDrawerController.toggle?.call();
  }

  void signOut() {}
  void signIn() {}
  void website() {
    _launch("https://twitter.com/130301fy");
  }

  void github() {}
  void email() {
    final Uri emailLaunchUri = Uri(scheme: 'mailto', path: "saddas@gmail.com");

    _launch(emailLaunchUri.toString());
  }
}

_launch(String url) async {
  if (!await launchUrlString(url)) {
    throw 'could not launch $url';
  }
}
