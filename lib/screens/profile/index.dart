import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

import 'controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileScreenController>(
      global: false,
      init: ProfileScreenController(),
      builder: (controller) => UFUScaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.themeColors.base,
          centerTitle: true,
          title: const UFUText(
            text: "Profile",
            fontWeight: UFUFontWeight.bold,
            textSize: UFUTextSize.heading2,
          ),
          leading: UFUIconButton(
            onTap: () => Get.back(),
            icon: Icons.arrow_back_ios,
            iconSize: 20,
            backgroundColor: AppTheme.themeColors.transparent,
            iconColor: AppTheme.themeColors.text,
          ),
        ),
        body: Obx(() => SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Stack(
                children: [
                  Center(
                    child: Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        border: UFUDashedBorder.fromBorderSide(
                          dashLength: 3,
                          side: BorderSide(
                            color: AppTheme.themeColors.primary,
                            width: 1
                          )
                        ),
                        borderRadius: BorderRadius.circular(70)
                      ),
                      padding: const EdgeInsets.all(1),
                      child: UFUAvatar(
                        size: UFUAvatarSize.extraLarge,
                        isDashedBorder: true,
                        dashLength: 3,
                        borderWidth: 1,
                        child: UFUNetworkImage(
                          src: controller.profileImage.value,
                          boxFit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 135,
                      width: 120,
                      alignment: Alignment.bottomRight,
                      child: UFUIconButton(
                        onTap: controller.selectImage,
                        backgroundColor: AppTheme.themeColors.base,
                        icon: Icons.camera_alt_rounded,
                        borderRadius: 50,
                        iconSize: 30,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 50),
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: UFUInputBox(
                            inputBoxController: controller.firstNameTextController,
                            fillColor: AppTheme.themeColors.base,
                            type: UFUInputBoxType.withoutLabel,
                            disabled: controller.isEdit.isFalse,
                            isRequired: true,
                            hintText: "First Name",
                            validator: (val) => UFUtils.textValidator(val, isRequired: true),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: UFUInputBox(
                            inputBoxController: controller.lastNameTextController,
                            fillColor: AppTheme.themeColors.base,
                            type: UFUInputBoxType.withoutLabel,
                            disabled: controller.isEdit.isFalse,
                            hintText: "Last Name",
                            isRequired: false,
                            validator: (val) => UFUtils.textValidator(val, isRequired: false),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    UFUInputBox(
                      inputBoxController: controller.phoneTextController,
                      fillColor: AppTheme.themeColors.base,
                      type: UFUInputBoxType.withoutLabel,
                      disabled: true,
                      hintText: "Phone Number",
                      keyboardType: TextInputType.phone,
                      validator: (val) => UFUtils.phoneValidator(val, isRequired: true),
                      inputFormatters: [ TextInputMask(mask: 'XXXXX XXXXX', placeholder: 'XXXXX XXXXX')],
                    ),
                    const SizedBox(height: 10),
                    UFUInputBox(
                      inputBoxController: controller.emailTextController,
                      fillColor: AppTheme.themeColors.base,
                      type: UFUInputBoxType.withoutLabel,
                      disabled: controller.isEdit.isFalse,
                      hintText: "E-Mail",
                      isRequired: false,
                      validator: (val) => UFUtils.emailValidator(val, isRequired: false),
                    ),
                    if(controller.isEdit.isTrue) ...[
                      const SizedBox(height: 50),
                      Row(
                        children: [
                          Expanded(flex: 1,
                            child: UFUButton(colorType: UFUButtonColorType.lightGray,
                              text: "Cancel", onPressed: controller.toggleIsEdit
                          )),
                          const SizedBox(width: 10),
                          Expanded(flex: 1,
                            child: UFUButton(text: "Edit", onPressed: controller.validateForm
                          )),
                        ],
                      ),
                    ],
                  ],
                ),
              ),

              SizedBox(height: controller.isEdit.isTrue ? 20 : 50),
              UFUButton(text: "Log Out", onPressed: () {}),
            ],
          ),
        )),
      ),
    );
  }
}
