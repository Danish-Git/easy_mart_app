import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

import '../../../../core/common_widgets/app_bar.dart';
import 'controller.dart';

class PostNewsScreen extends StatelessWidget {
  const PostNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostNewsScreenController>(
      global: false,
      init: PostNewsScreenController(),
      builder: (controller) => Obx(() => UFUScaffold(
        appBar: EMAppBar(
          title: "Post news",
          user: controller.user.value
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const UFUText(
                  text: "Please add your news details here",
                  fontWeight: UFUFontWeight.bold,
                  textSize: UFUTextSize.heading2,
                ),
                Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: UFUInputBox(
                          inputBoxController: controller.titleTextController,
                          fillColor: AppTheme.themeColors.base,
                          type: UFUInputBoxType.withoutLabel,
                          hintText: "Enter Title",
                          isRequired: false,
                          validator: (val) => UFUtils.textValidator(val),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: UFUInputBox(
                          inputBoxController: controller.descriptionsTextController,
                          fillColor: AppTheme.themeColors.base,
                          type: UFUInputBoxType.withoutLabel,
                          hintText: "Enter news description here",
                          isRequired: false,
                          maxLines: 5,
                          validator: (val) => UFUtils.textValidator(val),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Material(
                    color: AppTheme.themeColors.base,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: controller.selectImage,
                      borderRadius: BorderRadius.circular(10),
                      child: UFUNetworkImage(
                        src: controller.newsImage.value,
                        height: 200,
                        boxFit: BoxFit.cover,
                        borderRadius: 10,
                        placeHolder: Container(
                          height: 200,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppTheme.themeColors.dimGray
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_a_photo_outlined,
                                color: AppTheme.themeColors.darkGray,
                                size: 40,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: UFUText(
                                  text: "Add image",
                                  textSize: UFUTextSize.heading4,
                                  textColor: AppTheme.themeColors.darkGray,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: UFUText(
                    text: "Your news will be displayed once approved by the Admin.",
                    textSize: UFUTextSize.heading4,
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: UFUButton(text: "Send Request", onPressed: controller.validateForm),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
