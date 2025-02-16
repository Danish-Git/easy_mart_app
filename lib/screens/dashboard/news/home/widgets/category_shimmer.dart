import 'package:flutter/material.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: const EdgeInsets.only(bottom: 10),
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        separatorBuilder: (context, index) => const SizedBox(width: 10,),
        itemBuilder: (context, index) => const UFUShimmer(
          height: 30,
          width: 120,
        ),
      ),
    );
  }
}
