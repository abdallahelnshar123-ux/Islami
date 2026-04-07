import 'package:flutter/material.dart';
import 'package:islami1/utils/app_colors.dart';

import '../utils/app_styles.dart';
import '../utils/screen_size.dart';

class MainErrorWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onPressed;

  const MainErrorWidget({
    super.key,
    required this.errorMessage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      padding: EdgeInsets.only(top: context.height * 0.35),
      child: Column(
        spacing: context.height * 0.01,
        children: [
          Text(errorMessage, style: AppStyles.bold20White),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
            ),
            onPressed: onPressed,
            child: Text('try again', style: AppStyles.bold14Black),
          ),
        ],
      ),
    );
  }
}
