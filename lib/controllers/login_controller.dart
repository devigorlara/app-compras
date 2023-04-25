import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_compras/models/user.dart';
import 'package:app_compras/data/repository/user_repo.dart';
import 'package:app_compras/constant/api_constant.dart';

class LoginController extends GetxController {
  final UserRepo userRepo = Get.find<UserRepo>();
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var isLoading = false.obs;
  var isError = false.obs;
  var errorMessage = ''.obs;
  var user = User().obs;

  Future<void> login() async {
    final auth =
        await userRepo.loginUser(emailController.text, passwordController.text);
    User user = auth.data as User;
    box.write('token', user.token);
    box.write('user_id', user.id);
    print(user.token);
  }
}
