import 'package:flutter/material.dart';
import 'package:islami1/home/tabs/time_tab/model/pray.dart';
import 'package:islami1/utils/app_colors.dart';
import 'package:islami1/utils/app_styles.dart';

class PrayTimeWidget extends StatelessWidget {
  final Pray pray;

  const PrayTimeWidget({super.key, required this.pray});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [AppColors.brownColor, AppColors.primaryColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          textBuilder(
            pray.name,
            AppStyles.bold14Black.copyWith(color: AppColors.whiteColor),
          ),
          textBuilder(pray.time, AppStyles.bold20White.copyWith(fontSize: 25)),
          textBuilder(pray.timePeriod, AppStyles.bold16White),
        ],
      ),
    );
  }

  Widget textBuilder(String text, TextStyle style) {
    return Expanded(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(text, style: style),
      ),
    );
  }
}
