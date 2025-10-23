import 'package:evently_app/provider/eventListProvider.dart';
import 'package:evently_app/provider/userProvider.dart';
import 'package:evently_app/widgets/customtextfield.dart';
import 'package:evently_app/widgets/eventItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import '../utls/App_Styles.dart';
import '../utls/appcolors.dart';
import '../utls/appimages.dart';

class LoveTab extends StatefulWidget {
    LoveTab({super.key});

  @override
  State<LoveTab> createState() => _LoveTabState();
}

class _LoveTabState extends State<LoveTab> {
    TextEditingController favoriteController = TextEditingController();

  List<String>images=[
    AppAssets.birthdayim,
    AppAssets.book_clubim,
    AppAssets.eatingim,
    AppAssets.exhibitionim,
    AppAssets.book_clubim,
    AppAssets.gamingim,
    AppAssets.meetingim,
    AppAssets.holidayim,
    AppAssets.workshopim,

  ];
    @override
  void initState(){
      super.initState();
      WidgetsBinding.instance.addPostFrameCallback((timeStop){
        eventListProvider.getFavoriteEvent(userProvider.currentUser!.id);
      });

    }
late EventListProvider eventListProvider;
    late UserProvider userProvider ;
  @override
  Widget build(BuildContext context) {
  eventListProvider=Provider.of<EventListProvider>(context);
userProvider =Provider.of<UserProvider>(context);
    var height=MediaQuery.of(context).size.height;

    return     SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Customtextfield(
              controller: favoriteController,
              prefixiconcolor: AppColors.Primarycolorlight,
             prefixicon: Icon(Icons.search_rounded),
              hintText: 'Search For Event',
              borderSideColor: AppColors.Primarycolorlight,
            hintstyle: AppStyles.bold14primary,
            ),




            Expanded(child: ListView.separated(itemBuilder: (context, index) {
              return  Eventitem(event: eventListProvider.favoriteList[index]);
            }, separatorBuilder: (context, index) {
              return SizedBox(height: height*0.01,);
            },itemCount:eventListProvider.favoriteList.length )),
          ],
        ),
      ),
    )
    ;
  }
}
