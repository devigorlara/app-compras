import 'package:app_compras/global/constant/decoration.dart';
import 'package:app_compras/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:app_compras/data/models/user.dart';
import 'package:app_compras/modules/login/controllers/login_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  void _saveAndRedirectToHome(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', user.token ?? "0");
    await pref.setInt('userId', user.id ?? 0);
    Get.to(HomeView());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          padding: const EdgeInsets.all(32),
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              enableSuggestions: false,
              autocorrect: false,
              controller: controller.emailController,
              validator: (val) => val!.isEmpty ? 'Invalid email address' : null,
              decoration: kInputDecoration('Email'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: controller.passwordController,
              enableSuggestions: false,
              autocorrect: false,
              obscureText: true,
              validator: (val) =>
                  val!.length < 6 ? 'Invalid password address' : null,
              decoration: kInputDecoration('Password'),
            ),
            const SizedBox(
              height: 10,
            ),
            controller.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                    ),
                  )
                : kTextButton('Login', () {
                    if (controller.formKey.currentState!.validate()) {
                      controller.login();
                      _saveAndRedirectToHome(controller.user.value);
                    }
                  }),
            const SizedBox(
              height: 10,
            ),
            /*kLoginOrRegisterHint("Not registered yet? ", 'Register here',
                      () {
                    navigatorPushNamedAndRemoveUntil(context, registerRoute);
                  }),*/
          ],
        ),
      ),
    );
  }
}
