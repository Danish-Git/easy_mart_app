import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

import '../../core/utils/constants/assets.dart';
import 'controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginScreenController>(
      global: false,
      init: LoginScreenController(),
      builder: (controller) => UFUScaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const UFUText(
                  text: "Enter Your Phone Number to Login",
                  textSize: UFUTextSize.size28,
                  fontWeight: UFUFontWeight.bold,
                  textAlign: TextAlign.start,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: UFUText(
                      text: "You’ll receive a 4 digit code to verify next...",
                      textSize: UFUTextSize.heading3,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Form(
                    key: controller.loginFormKey,
                    child: UFUInputBox(
                      inputBoxController: controller.phoneTextController,
                      fillColor: AppTheme.themeColors.base,
                      type: UFUInputBoxType.withoutLabel,
                      label: "phone".tr,
                      hintText: "Enter your mobile number here",
                      keyboardType: TextInputType.phone,
                      validator: (val) => UFUtils.phoneValidator(val, isRequired: true),
                      inputFormatters: [ TextInputMask(mask: 'XXXXX XXXXX', placeholder: 'XXXXX XXXXX')],
                      prefixChild: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: UFUIcon(Icons.phone),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: UFUButton(
                    text:  "Continue",
                    onPressed: controller.validateForm,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: UFUText(
                    text: "- OR Continue with -",
                    textSize: UFUTextSize.heading3,
                    textAlign: TextAlign.center,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(50),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: UFUSvgImage(assetPath: AssetsFiles.google, width: 40),
                    )),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
