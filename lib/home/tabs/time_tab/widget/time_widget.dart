import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:islami1/model/pray_timings_response.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';
import '../../../../utils/screen_size.dart';
import '../model/pray.dart';
import 'Pray_time_widget.dart';

class TimeWidget extends StatelessWidget {
  final Data praysData;

  const TimeWidget({super.key, required this.praysData});

  @override
  Widget build(BuildContext context) {
    late List<Pray> prayList = [
      Pray(
        name: 'Fajr',
        time: formatTo12Hour(praysData.timings!.fajr!),
        timePeriod: getAmPm(praysData.timings!.fajr!),
      ),
      Pray(
        name: 'Sunrise',
        time: formatTo12Hour(praysData.timings!.sunrise!),
        timePeriod: getAmPm(praysData.timings!.sunrise!),
      ),
      Pray(
        name: 'Dhuhr',
        time: formatTo12Hour(praysData.timings!.dhuhr!),
        timePeriod: getAmPm(praysData.timings!.dhuhr!),
      ),
      Pray(
        name: 'Asr',
        time: formatTo12Hour(praysData.timings!.asr!),
        timePeriod: getAmPm(praysData.timings!.asr!),
      ),
      Pray(
        name: 'Sunset',
        time: formatTo12Hour(praysData.timings!.sunset!),
        timePeriod: getAmPm(praysData.timings!.sunset!),
      ),
      Pray(
        name: 'Maghrib',
        time: formatTo12Hour(praysData.timings!.maghrib!),
        timePeriod: getAmPm(praysData.timings!.maghrib!),
      ),
      Pray(
        name: 'Isha',
        time: formatTo12Hour(praysData.timings!.isha!),
        timePeriod: getAmPm(praysData.timings!.isha!),
      ),
      Pray(
        name: 'First third',
        time: formatTo12Hour(praysData.timings!.firstthird!),
        timePeriod: getAmPm(praysData.timings!.firstthird!),
      ),
      Pray(
        name: 'Midnight',
        time: formatTo12Hour(praysData.timings!.midnight!),
        timePeriod: getAmPm(praysData.timings!.midnight!),
      ),
      Pray(
        name: 'Last third',
        time: formatTo12Hour(praysData.timings!.lastthird!),
        timePeriod: getAmPm(praysData.timings!.lastthird!),
      ),
      Pray(
        name: 'Imsak',
        time: formatTo12Hour(praysData.timings!.imsak!),
        timePeriod: getAmPm(praysData.timings!.imsak!),
      ),
    ];

    return SizedBox(
      height: context.height * 0.4,

      /// background ========================================================
      child: Container(
        height: double.infinity,
        width: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(AppAssets.prayBg),
          ),
          borderRadius: BorderRadius.circular(40),
        ),

        /// body ============================================================
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: context.height * 0.011,
                horizontal: context.width * 0.04,
              ),

              /// header ============================================================
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Expanded(
                    child: Text(
                      praysData.date?.readable ?? '',
                      style: AppStyles.bold16White,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Pray Time',
                            style: AppStyles.bold20Black.copyWith(
                              color: AppColors.black70Color,
                            ),
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            praysData.date?.gregorian?.weekday?.en ?? '',
                            style: AppStyles.bold20Black.copyWith(
                              color: AppColors.black90Color,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Text(
                      hijriData(),
                      style: AppStyles.bold16White,
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ),

            /// time slider ====================================================
            Expanded(
              child: CarouselSlider(
                options: CarouselOptions(
                  enlargeStrategy: CenterPageEnlargeStrategy.scale,
                  autoPlay: true,
                  height: context.height * 0.17,
                  viewportFraction: .3,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  enlargeFactor: .30,
                ),
                items: prayList
                    .map((pray) => PrayTimeWidget(pray: pray))
                    .toList(),
              ),
            ),

            /// footer ======================================================
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: context.height * 0.011,
                horizontal: context.width * 0.04,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  iconBuilder(AppColors.transparentColor),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Next Pray',
                        style: AppStyles.bold16Black.copyWith(
                          color: AppColors.black70Color,
                        ),
                      ),
                      Text(' - 02:08', style: AppStyles.bold16Black),
                    ],
                  ),
                  iconBuilder(AppColors.blackColor),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget iconBuilder(Color color) {
    return IconButton(
      splashColor: AppColors.transparentColor,
      highlightColor: AppColors.transparentColor,
      padding: EdgeInsets.all(0),
      onPressed: () {},
      icon: SvgPicture.asset(
        width: 25,
        AppAssets.iconVolumeMuted2,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      ),
    );
  }

  String hijriData() {
    return '${praysData.date?.hijri?.day} ${praysData.date?.hijri?.month?.en?.substring(0, 3)} ${praysData.date?.hijri?.year}';
  }

  String formatTo12Hour(String time24) {
    final inputFormat = DateFormat("HH:mm");
    final outputFormat = DateFormat("hh:mm");

    final dateTime = inputFormat.parse(time24);
    return outputFormat.format(dateTime);
  }

  String getAmPm(String time24) {
    final inputFormat = DateFormat("HH:mm");
    final outputFormat = DateFormat("a");

    final dateTime = inputFormat.parse(time24);
    return outputFormat.format(dateTime);
  }

  // String getNextPray() {
  //   for (var element in prayList) {
  //     final timeParts = element.time.split(':');
  //
  //     final prayDateTime = DateTime(
  //       DateTime.now().year,
  //       DateTime.now().month,
  //       DateTime.now().day,
  //       int.parse(timeParts[0]),
  //       int.parse(timeParts[1]),
  //     );
  //
  //     if (prayDateTime.isAfter(DateTime.now())) {
  //       debugPrint(element.time);
  //       return element.time;
  //     }
  //   }
  //   debugPrint('no time');
  //   return '';
  // }
}
