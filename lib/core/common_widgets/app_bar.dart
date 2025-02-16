import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

import '../../models/user.dart';
import '../routes/pages.dart';


PreferredSizeWidget EMAppBar({required String title, VoidCallback? onTapBack, UserModel? user}) => AppBar(
  backgroundColor: AppTheme.themeColors.base,
  centerTitle: true,
  title: UFUText(
    text: title,
    fontWeight: UFUFontWeight.bold,
    textSize: UFUTextSize.heading2,
  ),
  leading: UFUIconButton(
    onTap: onTapBack ?? () => Get.back(),
    icon: Icons.arrow_back_ios,
    iconSize: 20,
    backgroundColor: AppTheme.themeColors.transparent,
    iconColor: AppTheme.themeColors.text,
  ),
  actions: [
    if(user != null)
      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: InkWell(
          onTap: () => Get.toNamed(Routes.profile),
          child: UFUAvatar(
            size: UFUAvatarSize.medium,
            child: UFUNetworkImage(
              src: user.avatarUrl ?? "",
              boxFit: BoxFit.cover ,
            ),
          ),
        ),
      )
  ],
);
