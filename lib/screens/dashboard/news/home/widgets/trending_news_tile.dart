import 'package:flutter/material.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

import '../../../../../core/utils/constants/assets.dart';
import '../../../../../models/news.dart';

class TrendingNewsTile extends StatelessWidget {
  const TrendingNewsTile({
    super.key,
    this.news,
    this.onTap
  });

  final NewsPostModel? news;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: AppTheme.themeColors.base,
        borderRadius: BorderRadius.circular(20),
        elevation: 5,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 210,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UFUNetworkImage(
                  src: news?.coverImage?.finalImageUrl,
                  height: 110,
                  width: 190,
                  boxFit: BoxFit.cover,
                  borderRadius: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: UFUText(
                    text: news?.title ?? "",
                    textSize: UFUTextSize.heading4,
                    fontWeight: UFUFontWeight.bold,
                    textAlign: TextAlign.start,
                    maxLine: 3,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      const UFUSvgImage(
                        assetPath: AssetsFiles.miniLogo,
                        height: 30,
                        width: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: UFUText(
                          text: UFUtils.formatDate(news?.createdAt ?? DateTime.now(), format: "MMMM dd, yyyy") ?? "",
                          textSize: UFUTextSize.heading4,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
