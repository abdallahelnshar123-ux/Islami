import 'package:flutter/material.dart';
import 'package:islami1/home/tabs/radio_tab/widget/player_widget.dart';
import 'package:islami1/utils/screen_size.dart';

import '../../../../model/radio_response.dart';

class PlayersList extends StatelessWidget {
  final List<Radios> radiosList;

  const PlayersList({super.key, required this.radiosList});
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => PlayerWidget(radio: radiosList[index],),
      separatorBuilder: (context, index) =>
          SizedBox(height: context.height * 0.017),
      itemCount: radiosList.length,
    );
  }
}
