import 'package:flutter/material.dart';
import 'package:islami1/home/tabs/radio_tab/audio_utils.dart';
import 'package:islami1/home/tabs/radio_tab/widget/players_list.dart';
import 'package:islami1/model/radio_response.dart';
import 'package:islami1/utils/app_colors.dart';
import 'package:islami1/utils/screen_size.dart';

import '../../../api/api_manager.dart';
import '../../../global_widgets/main_error_widget.dart';
import '../../../global_widgets/main_loading_widget.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    AudioUtils.stopRadio();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: context.width * 0.046,
        ),
        child: Column(
          spacing: context.height * 0.019,
          children: [

            /// container for background ===================================
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.black70Color,
              ),
              child: TabBar(
                tabs: [Text('Radio'), Text('Reciters')],
                labelPadding: EdgeInsetsGeometry.symmetric(
                  vertical: context.height * 0.01,
                ),
              ),
            ),

            /// tabs ==========================================================
            Expanded(
              child: TabBarView(
                children: [
                  FutureBuilder<RadioResponse>(
                    future: ApiManager.getRadios(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return MainLoadingWidget();
                      }
                      if (snapshot.hasError) {
                        return MainErrorWidget(
                          onPressed: () {
                            ApiManager.getRadios();
                            setState(() {});
                          },
                          errorMessage: 'Something went Wrong ',
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (
                        snapshot.data?.radios == null) {
                          return MainErrorWidget(
                            onPressed: () {
                              ApiManager.getRadios();
                              setState(() {});
                            },
                            errorMessage: 'Some thing went wrong',
                          );
                        }
                      }
                      var radiosList = snapshot.data!.radios;
                      return PlayersList(radiosList: radiosList !,);
                    },
                  ),
                  FutureBuilder<RadioResponse>(
                    future: ApiManager.getRadios(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return MainLoadingWidget();
                      }
                      if (snapshot.hasError) {
                        return MainErrorWidget(
                          onPressed: () {
                            ApiManager.getRadios();
                            setState(() {});
                          },
                          errorMessage: 'Something went Wrong ',
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (
                        snapshot.data?.radios == null) {
                          return MainErrorWidget(
                            onPressed: () {
                              ApiManager.getRadios();
                              setState(() {});
                            },
                            errorMessage: 'Some thing went wrong',
                          );
                        }
                      }
                      var radiosList = snapshot.data!.radios;
                      return PlayersList(radiosList: radiosList !,);
                    },
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
