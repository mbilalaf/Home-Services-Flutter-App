import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/controllers/forgot_password_controller.dart';
import 'package:home_services/utils/styles.dart';
import 'package:home_services/validations/validator.dart';
import 'package:home_services/widgets/button.dart';
import 'package:home_services/widgets/textfield.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  Widget build(BuildContext context) {
    ForgotPasswordController forgotPasswordController =
        Get.put(ForgotPasswordController());
    double size = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recover You password',
          style: MyFontStyle.subtitleText.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: forgotPasswordController.signInFromKey,
                    child: Column(
                      children: [
                        SizedBox(height: size * 0.05),
                        MyTextfield(
                          textEditingController:
                              forgotPasswordController.emailController,
                          hintText: "Email",
                          prefixIcon: Icons.person,
                          onSaved: (value) {
                            forgotPasswordController.email = value!;
                          },
                          validator: (v) {
                            return Validator().validateEmail(v!);
                          },
                        ),
                        SizedBox(height: size * 0.02),
                        MyButton(
                            isUpdated: true,
                            controller:
                                ForgotPasswordController.to.myButtonController,
                            btnText: 'Submit',
                            onTap: () {
                              forgotPasswordController.resetPassword();
                              // signInController.onSignIn(),
                            }),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
