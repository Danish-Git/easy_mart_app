import 'package:easy_mart_app/models/videos.dart';
import 'package:flutter/material.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

class VideoTile extends StatelessWidget {
  const VideoTile({
    super.key,
    this.video,
    this.onTap
  });

  final VideosModel? video;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: UFUNetworkImage(
            src: video?.coverImage?.finalImageUrl ?? "",
            // height: double.maxFinite,
            // width: double.maxFinite,
            boxFit: BoxFit.cover,
            borderRadius: 10,
          ),
        ),
        Material(
          color: AppTheme.themeColors.text.withAlpha(100),
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  UFUIcon(
                    Icons.play_circle_outline_outlined,
                    size: 50,
                    color: AppTheme.themeColors.base,
                  ),
                  Positioned.fill(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.only(bottom: 10),
                      child: UFUText(
                        text: video?.title ?? "",
                        textColor: AppTheme.themeColors.base,
                        fontWeight: UFUFontWeight.bold,
                        maxLine: 3,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),


      ],
    );
  }
}
