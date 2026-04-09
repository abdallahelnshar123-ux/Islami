import 'package:flutter/material.dart';
import 'package:islami1/utils/app_colors.dart';
import 'package:islami1/utils/app_styles.dart';
import 'package:islami1/utils/screen_size.dart';

class AzkarItem extends StatelessWidget {
  final Map<String, dynamic> azkar;

  const AzkarItem({super.key, required this.azkar});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.primaryColor,
        border: BoxBorder.all(color: AppColors.primaryColor),
      ),
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),

        border: BoxBorder.all(color: AppColors.primaryColor),
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              'العدد \n ${azkar['count']} ',
              style: AppStyles.bold20Black,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(context.width * 0.03),
              color: AppColors.blackColor,
              child: Column(
                spacing: context.height * 0.04,
                children: [
                  Text(
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    azkar['content'] ?? '',

                    style: AppStyles.bold20Primary,
                  ),
                  Text(
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    azkar['description'] != ''
                        ? '• ${azkar['description']}'
                        : '',
                    style: AppStyles.bold15Primary,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
