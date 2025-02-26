import 'package:flutter/material.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

class TrendingNewsShimmer extends StatelessWidget {
  const TrendingNewsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: 5,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) =>  Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: Material(
            color: AppTheme.themeColors.base,
            borderRadius: BorderRadius.circular(20),
            elevation: 5,
            child: Container(
              width: 210,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(10),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UFUShimmer(height: 110, width: 190,),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: UFUShimmer(height: 14, width: double.maxFinite)
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: UFUShimmer(height: 14, width: double.maxFinite)
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: UFUShimmer(height: 14, width: 100,)
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        UFUShimmer(height: 30, width: 30,),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: UFUShimmer(height: 14, width: 100,),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
