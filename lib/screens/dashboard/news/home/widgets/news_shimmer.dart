import 'package:flutter/material.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

class NewsShimmer extends StatelessWidget {
  const NewsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    
    return ListView.separated(
      itemCount: 5,
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 10),
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) => shimmerTile(),
    );
  }
  
  Widget shimmerTile() => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const UFUShimmer(height: 120, width: 120,),
      Expanded(
        child: Container(
          height: 115,
          padding: const EdgeInsets.only(left: 10),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UFUShimmer(height: 14, width: 250,),
              UFUShimmer(height: 14, width: 350,),
              UFUShimmer(height: 14, width: 100,),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    UFUShimmer(height: 30, width: 30,),

                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: UFUShimmer(height: 14, width: 200,),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    ],
  );
}
