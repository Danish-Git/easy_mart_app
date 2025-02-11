import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

import 'controller.dart';

class ValidateOTPScreen extends StatelessWidget {
  const ValidateOTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ValidateOTPScreenController>(
      global: false,
      init: ValidateOTPScreenController(),
      builder: (controller) => UFUScaffold(
        body: Obx(() =>  SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: UFUText(
                    text: "Verify OTP",
                    textSize: UFUTextSize.size28,
                    fontWeight: UFUFontWeight.bold,
                    textAlign: TextAlign.start,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                      child: UFUText(
                      text: "Code is send to ${controller.phoneNo}",
                      textSize: UFUTextSize.heading3,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: UFUOtpInputBox(
                    onCompleted: controller.validateOtp
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: UFUButton(
                    text:  "Continue",
                    onPressed: controller.validateForm,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const UFUText(
                        text: "Didn’t receive code?",
                        textSize: UFUTextSize.heading3,
                        textAlign: TextAlign.center,
                      ),
                      UFUTextButton(
                        onPressed: () {},
                        text: "Request again",
                        color: AppTheme.themeColors.primary,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ))
      ),
    );
  }
}
