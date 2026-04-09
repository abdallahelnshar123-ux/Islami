import 'package:flutter/material.dart';
import 'package:islami1/home/tabs/radio_tab/widget/player_button.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';
import '../../../../utils/screen_size.dart';

class PlayerWidget extends StatelessWidget {
  final String name;
  final bool isPlaying;
  final bool volumeOn;
  final VoidCallback onPlay;
  final VoidCallback onStop;
  final VoidCallback onVolumePressed;

  const PlayerWidget({
    super.key,
    required this.name,
    required this.isPlaying,
    required this.onPlay,
    required this.volumeOn,
    required this.onStop,
    required this.onVolumePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primaryColor,
        image: DecorationImage(
          image: AssetImage(
            isPlaying ? AppAssets.soundWave : AppAssets.radioDecor,
          ),
          fit: BoxFit.fitWidth,
          alignment: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(name, style: AppStyles.bold20Black),
          ),
          Row(
            spacing: context.width * 0.03,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// hidden button ===========================================
              PlayerButton.hidden(),

              /// play/pause button ===========================================
              PlayerButton(
                onPressed: () {
                  if (isPlaying) {
                    onStop();
                  } else {
                    onPlay();
                  }
                },
                icon: isPlaying ? AppAssets.iconPause : AppAssets.iconPlay,
              ),

              /// volume button ===========================================
              PlayerButton(
                onPressed: onVolumePressed,
                icon: volumeOn
                    ? AppAssets.iconVolumeUnmuted
                    : AppAssets.iconVolumeMuted2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
