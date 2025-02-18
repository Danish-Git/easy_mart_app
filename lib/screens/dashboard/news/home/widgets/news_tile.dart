import 'package:easy_mart_app/models/news.dart';
import 'package:flutter/material.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

import '../../../../../core/utils/constants/assets.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({
    super.key,
    this.news,
    this.onTap
  });

  final NewsPostModel? news;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UFUNetworkImage(
            src: news?.coverImage?.finalImageUrl ?? "",
            height: 120,
            width: 120,
            boxFit: BoxFit.cover,
            borderRadius: 10,
          ),
          Expanded(
            child: Container(
              height: 115,
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UFUText(
                    text: news?.title ?? "",
                    textSize: UFUTextSize.heading4,
                    fontWeight: UFUFontWeight.bold,
                    textAlign: TextAlign.start,
                    maxLine: 3,
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: UFUText(
                              text: UFUtils.formatDate(news?.createdAt ?? DateTime.now(), format: "MMMM dd, yyyy") ?? "",
                              textSize: UFUTextSize.heading4,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
