import 'package:flutter/material.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_styles.dart';
import '../../../../utils/screen_size.dart';

class SebhaWidget extends StatelessWidget {
  List<String> zekrList;
  VoidCallback opTap;
  double angle;
  int index;
  int counter;

  SebhaWidget({
    super.key,
    required this.counter,
    required this.angle,
    required this.opTap,
    required this.index,
    required this.zekrList

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(AppAssets.sebhaHeadImage),
          GestureDetector(
            onTap: opTap,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Transform.rotate(
                  angle: angle,
                  child: Image.asset(AppAssets.sebhaBodyImage),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: context.height * 0.04,
                  children: [
                    // SizedBox(height: context.height * 0.09),
                    Text(
                      zekrList[index],
                      style: AppStyles.bold32White,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                    ),
                    Text('$counter', style: AppStyles.bold32White),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
