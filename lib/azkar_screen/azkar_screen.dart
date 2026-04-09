import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami1/azkar_screen/widget/azkar_item.dart';
import 'package:islami1/global_widgets/main_loading_widget.dart';
import 'package:islami1/utils/app_colors.dart';
import 'package:islami1/utils/screen_size.dart';

class AzkarScreen extends StatefulWidget {
  final String azkarName;

  const AzkarScreen({super.key, required this.azkarName});

  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  late List azkarByName;

  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    loadAzkar();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        actionsPadding: EdgeInsetsGeometry.only(right: context.width * 0.05),

        title: Text(isLoaded ? '${azkarByName[0]['category']}' : ''),
      ),
      body: isLoaded
          ? ListView.separated(
              padding: EdgeInsets.all(context.width * 0.04),
              itemBuilder: (context, index) =>
                  AzkarItem(azkar: azkarByName[index]),
              itemCount: azkarByName.length,
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(height: context.width * 0.04),
            )
          : Center(child: MainLoadingWidget()),
    );
  }

  void loadAzkar() async {
    String fileContent = await rootBundle.loadString('assets/azkar/azkar.json');
    var data = json.decode(fileContent);
    azkarByName = data[widget.azkarName];
    isLoaded = true;
    setState(() {});
  }
}
