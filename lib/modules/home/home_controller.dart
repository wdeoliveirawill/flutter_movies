import 'package:flutter_movies/services/login/login_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static const NAVIGATOR_KEY = 1;
  static const EXIT_PAGE_INDEX = 2;
  final _pageIndex = 0.obs;
  final LoginService _loginService;

  final _pages = ["/movies", "/favorites"];

  HomeController({required LoginService loginService})
      : _loginService = loginService;

  int get pageIndex => _pageIndex.value;

  void goToPage(int page) {
    _pageIndex(page);
    if (page == EXIT_PAGE_INDEX) {
      _loginService.logout();
    } else {
      Get.offNamed(_pages[page], id: NAVIGATOR_KEY);
    }
  }
}
