import 'package:flutter/material.dart';
import 'package:islami1/home/tabs/sebha_tab/widget/sebha_widget.dart';
import 'package:islami1/utils/app_styles.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  List<String> zekrList = ['سبحان الله', 'الحمد لله', 'الله أكبر'];
  int counter = 0;
  int index = 0;

  double angle = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 7),
        Text(
          'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
          textDirection: TextDirection.rtl,
          style: AppStyles.bold32White,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 30),
        SebhaWidget(
          index: index,
          counter: counter,
          angle: angle,
          opTap: rotateImage,
          zekrList: zekrList,
        ),
      ],
    );
  }

  void rotateImage() {
    counter++;
    angle += 20;
    if (counter % 34 == 0) {
      index++;
      counter = 0;
      if (index == zekrList.length) {
        index = 0;
      }
    }
    setState(() {});
  }
}
