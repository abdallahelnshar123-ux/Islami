import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:islami1/api/api_manager.dart';
import 'package:islami1/azkar_screen/azkar_screen.dart';
import 'package:islami1/home/tabs/time_tab/widget/azkar_widget.dart';
import 'package:islami1/home/tabs/time_tab/widget/time_widget.dart';
import 'package:islami1/model/pray_timings_response.dart';
import 'package:islami1/utils/app_assets.dart';
import 'package:islami1/utils/app_styles.dart';
import 'package:islami1/utils/screen_size.dart';

import '../../../global_widgets/main_error_widget.dart';
import '../../../global_widgets/main_loading_widget.dart';

class TimeTab extends StatefulWidget {
  const TimeTab({super.key});

  @override
  State<TimeTab> createState() => _TimeTabState();
}

class _TimeTabState extends State<TimeTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsetsGeometry.symmetric(
        horizontal: context.width * 0.035,
        vertical: context.width * 0.035,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureBuilder<PrayTimingsResponse>(
            future: ApiManager.getPraysTimes(getCurrentDate()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return MainLoadingWidget();
              }
              if (snapshot.hasError) {
                return MainErrorWidget(
                  onPressed: () {
                    ApiManager.getPraysTimes(getCurrentDate());
                    setState(() {});
                  },
                  errorMessage: 'Something went Wrong ',
                );
              }
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data?.status != 'OK' ||
                    snapshot.data?.data == null) {
                  return MainErrorWidget(
                    onPressed: () {
                      ApiManager.getPraysTimes(getCurrentDate());
                      setState(() {});
                    },
                    errorMessage: snapshot.data!.data.toString(),
                  );
                }
              }
              var praysData = snapshot.data!.data!;
              return TimeWidget(praysData: praysData);
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: context.height * 0.025),
            child: Text('Azkar', style: AppStyles.bold16White),
          ),
          Column(
            spacing: context.width * 0.048,
            children: [
              Row(
                spacing: context.width * 0.048,
                children: [
                  AzkarWidget(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AzkarScreen(azkarName: 'evening_azkar'),
                        ),
                      );
                    },
                    image: AppAssets.eveningAzkarImg,
                    text: 'Evening Azkar',
                  ),
                  AzkarWidget(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AzkarScreen(azkarName: "morning_azkar"),
                        ),
                      );
                    },
                    image: AppAssets.morningAzkarImg,
                    text: 'Morning Azkar',
                  ),
                ],
              ),
              Row(
                spacing: context.width * 0.048,
                children: [
                  AzkarWidget(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AzkarScreen(azkarName: "waking_azkar"),
                        ),
                      );
                    },
                    image: AppAssets.wakingAzkarImg,
                    text: 'Waking Azkar',
                  ),
                  AzkarWidget(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AzkarScreen(azkarName: "sleeping_azkar"),
                        ),
                      );
                    },
                    image: AppAssets.sleepingAzkarImg,
                    text: 'Sleeping Azkar',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  String getCurrentDate() {
    final now = DateTime.now();
    return DateFormat('dd-MM-yyyy').format(now);
  }
}
