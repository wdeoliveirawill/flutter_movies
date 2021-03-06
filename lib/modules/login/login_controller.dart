import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_movies/application/ui/loader/loader_mixin.dart';
import 'package:flutter_movies/application/ui/messages/messages_mixin.dart';
import 'package:flutter_movies/services/login/login_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final LoginService _loginService;
  final loading = false.obs;
  final message = Rxn<MessageModel>();

  LoginController({
    required LoginService loginService,
  }) : _loginService = loginService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
    if (FirebaseAuth.instance.currentUser != null) {
      Get.offAllNamed("/home");
    }
  }

  Future<void> login() async {
    try {
      loading(true);
      await _loginService.login();
      loading(false);
      message(
        MessageModel.info(
          title: 'Sucesso',
          message: 'Login Realizado com sucesso',
        ),
      );
      Get.offAllNamed("/home");
    } catch (e, s) {
      print(e);
      print(s);
      loading(false);
      message(MessageModel.error(
          title: 'Login Error', message: 'Erro ao realizar Login'));
    }
  }
}
