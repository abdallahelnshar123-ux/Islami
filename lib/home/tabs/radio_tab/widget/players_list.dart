import 'package:flutter/material.dart';
import 'package:islami1/home/tabs/radio_tab/widget/player_widget.dart';
import 'package:islami1/utils/screen_size.dart';

import '../../../../model/radio_response.dart';
import '../audio_utils.dart';

class PlayersList extends StatefulWidget {
  final List<Radios>? radiosList;

  const PlayersList({super.key, required this.radiosList,});

  @override
  State<PlayersList> createState() => _PlayersListState();
}

class _PlayersListState extends State<PlayersList> {
  String? currentPlayingUrl;
  bool volumeOn = true;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) =>
          PlayerWidget(
            volumeOn: currentPlayingUrl == widget.radiosList![index].url
                ? volumeOn
                : true,
            onVolumePressed: () {
              if (currentPlayingUrl != widget.radiosList![index].url) return;
              if (volumeOn) {
                AudioUtils.player.setVolume(0.0);
              } else {
                AudioUtils.player.setVolume(1.0);
              }
              volumeOn = !volumeOn;
              setState(() {});
            },
            name: widget.radiosList![index].name ?? '',
            isPlaying: currentPlayingUrl == widget.radiosList![index].url,
            onPlay: () async {
              await AudioUtils.playRadio(widget.radiosList![index].url ?? '');
              setState(() {
                currentPlayingUrl = widget.radiosList![index].url;
              });
            },
            onStop: () async {
              await AudioUtils.stopRadio();
              setState(() {
                currentPlayingUrl = null;
              });
            },
          ),
      separatorBuilder: (context, index) =>
          SizedBox(height: context.height * 0.017),
      itemCount: widget.radiosList!.length,
    );




  }
}
