import 'package:flutter_movies/application/auth/auth_service.dart';
import 'package:flutter_movies/repositories/login/login_repository.dart';
import 'package:flutter_movies/repositories/login/login_repository_impl.dart';
import 'package:flutter_movies/services/login/login_service.dart';
import 'package:flutter_movies/services/login/login_service_impl.dart';
import 'package:get/get.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginRepository>(
      () => LoginRepositoryImpl(),
      fenix: true,
    );
    Get.lazyPut<LoginService>(
        () => LoginServiceImpl(loginRepository: Get.find()),
        fenix: true);
    Get.put(AuthService()).init();
  }
}
