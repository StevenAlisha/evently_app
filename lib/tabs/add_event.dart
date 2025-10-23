
import 'package:evently_app/provider/eventListProvider.dart';
import 'package:evently_app/provider/userProvider.dart';
import 'package:evently_app/utls/App_Styles.dart';
import 'package:evently_app/utls/appcolors.dart';
import 'package:evently_app/utls/appimages.dart';
import 'package:evently_app/utls/approute.dart';
import 'package:evently_app/utls/frebase_utls.dart';
import 'package:evently_app/widgets/customelevatedbuttom.dart';
import 'package:evently_app/widgets/customtextfield.dart';
import 'package:evently_app/widgets/event%20data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../model/eventmodel.dart';
import '../widgets/toastWidgets.dart';
import 'event_tab_icon.dart';

class AddEvent extends StatefulWidget {
    AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}


class _AddEventState extends State<AddEvent> {
 late EventListProvider eventListProvider;
 late UserProvider userProvider;
  int selectedIndex = 0;
  DateTime ? selectedDate;
  TimeOfDay ? selectedTime;
String selectedImage='';
  String selectedName='';
  List<String>images = [
    AppAssets.birthdayim,
    AppAssets.meetingim,
    AppAssets.gamingim,
    AppAssets.workshopim,
    AppAssets.book_clubim,
    AppAssets.exhibitionim,
    AppAssets.holidayim,
    AppAssets.eatingim,
    AppAssets.book_clubim,


  ];
  TextEditingController titleControoler = TextEditingController();

  TextEditingController discribtionControoler = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    void initState(){
      super.initState();
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        eventListProvider.getAllEvents(userProvider.currentUser!.id);
      },);
    }
    eventListProvider = Provider.of<EventListProvider>(context);
    userProvider = Provider.of<UserProvider>(context);
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    List<String>images = [
      AppAssets.birthdayim,
      AppAssets.meetingim,
      AppAssets.gamingim,
      AppAssets.workshopim,
      AppAssets.book_clubim,
      AppAssets.exhibitionim,
      AppAssets.holidayim,
      AppAssets.eatingim,
      AppAssets.book_clubim,


    ];
      selectedImage = images[selectedIndex];
    List<String>eventsNameList = [

      AppLocalizations.of(context )!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.workshop,
      AppLocalizations.of(context)!.boolclub,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.eating,
      AppLocalizations.of(context)!.sport,

    ];
      selectedName = eventsNameList[selectedIndex];
      return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        iconTheme: IconThemeData(color: AppColors.Primarycolorlight),
        centerTitle: true,
        title: Text('Create Event', style: AppStyles.med20primary,),),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: height * 0.01,
            horizontal: width * 0.02),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  height: height * 0.25,

                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(images[selectedIndex]),

                        fit: BoxFit.fill),
                    borderRadius: BorderRadiusGeometry.circular(16),
                  )),
              SizedBox(height: height * 0.02,),
              SizedBox(
                height: height * 0.04,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          selectedIndex = index;
                          setState(() {

                          });
                        },
                        child: EventTabIcon(
                            bordercolor: AppColors.Primarycolorlight,
                            hasIcon: true,
                            image: AppAssets.googleicon,
                            unSelectedbg: AppColors.transparent,
                            unSelectedtextStyle: AppStyles.bold16primary,
                            textStyle: Theme
                                .of(context)
                                .textTheme
                                .bodyMedium!,
                            selectedbg: AppColors.Primarycolorlight,
                            isSelected: selectedIndex == index ? true : false,
                            eventName: eventsNameList[index]),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(width: width * 0.01,);
                    },
                    itemCount: eventsNameList.length),
              ),
              SizedBox(height: height * 0.02,),
              Text(' Title', style: Theme
                  .of(context)
                  .textTheme
                  .bodyLarge,),
            Form(
                key: formKey,
                child: Column(children: [
              Customtextfield(
               validator: (text){
                 if(text==null || text.isEmpty)
                   {
                     return 'Please Enter Title';
                   }
               },

                  hintText: 'Event Title',
                hintstyle: Theme
                    .of(context)
                    .textTheme
                    .bodyLarge,
                prefixicon: Image.asset(AppAssets.nameicon),
                borderSideColor: Theme
                    .of(context)
                    .hintColor,
                controller: titleControoler),
              SizedBox(height: height*0.01,),
              Customtextfield(
                  validator: (text) {
                    if (text == null||text.isEmpty) {
                      return 'Please Enter Description';
                    }
                    return null;
                  },
                  maxline: 4,
                  hintText: 'Event Description',
                  hintstyle: Theme
                      .of(context)
                      .textTheme
                      .bodyLarge,

                  borderSideColor: Theme
                      .of(context)
                      .hintColor,
                  controller: discribtionControoler),],)),


              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.02,),
                    FormField<DateTime>(
                      validator: (value) {
                        if (selectedDate == null) {
                          return "Please Enter Date";
                        }
                        return null;
                      },
                      builder: (state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            EventData(
                              onTap: () async {
                                var chooseDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.now().add(
                                      const Duration(days: 365)),
                                );

                                if (chooseDate != null) {
                                  setState(() {
                                    selectedDate = chooseDate;
                                    state.didChange(chooseDate);
                                  });
                                }
                              },
                              image: AppAssets.dateicon,
                              text1: 'Event Date',
                              text2: selectedDate == null
                                  ? 'Choose Date'
                                  : '${selectedDate!.day}/${selectedDate!
                                  .month}/${selectedDate!.year}',
                            ),
                            if (state.hasError)
                              Padding(
                                padding: const EdgeInsets.only(top: 4, left: 8),
                                child: Text(
                                  state.errorText!,
                                  style: const TextStyle(
                                      color: Colors.red, fontSize: 12),
                                ),
                              )
                          ],
                        );
                      },
                    ),
                    SizedBox(height: height * 0.02),
                    FormField<TimeOfDay>(
                      validator: (value) {
                        if (selectedTime == null) {
                          return "Please Enter Time";
                        }
                        return null;
                      },
                      builder: (state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            EventData(
                              onTap: () async {
                                var chooseTime = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                );

                                if (chooseTime != null) {
                                  setState(() {
                                    selectedTime = chooseTime;
                                    state.didChange(chooseTime);
                                  });
                                }
                              },
                              image: AppAssets.timeicon,
                              text1: 'Event Time',
                              text2: selectedTime == null
                                  ? 'Choose Time'
                                  : '${selectedTime?.hour}',
                            ),
                            if (state.hasError)
                              Padding(
                                padding: const EdgeInsets.only(top: 4, left: 8),
                                child: Text(
                                  state.errorText!,
                                  style: const TextStyle(
                                      color: Colors.red, fontSize: 12),
                                ),
                              )
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              Text('Location', style: Theme
                  .of(context)
                  .textTheme
                  .bodyLarge,),
              Customelevatedbuttom(
                onPressed: () {},
                elevatedcolor: AppColors.transparent,
                borderSideColor: AppColors.Primarycolorlight,
                elevatedchild: Row(children: [
                  Image.asset(AppAssets.locationicon),
                  SizedBox(width: width * 0.02,),
                  Text('Choose Event Location', style: AppStyles.med16primary,),
                  Spacer(),
                  Icon(Icons.keyboard_arrow_right_outlined, size: 30,
                    color: AppColors.Primarycolorlight,)
                ],),),
              SizedBox(height: height * 0.02,),
              Customelevatedbuttom(
                onPressed:addEvent,
                  // if (_formKey.currentState?.validate()==true) {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //       const SnackBar(content: Text('Done')));
                  // }
                  //  if(formKey.currentState?.validate()==true){
                  //      return null;
                  // }


                borderSideColor: AppColors.Primarycolorlight,
                elevatedcolor: AppColors.Primarycolorlight,
                elevatedchild: Text(
                  'Add Event', style: AppStyles.medium20white,),)
            ],

          ),
        ),
      ),
    );
  }

  chooseDate() async {
    var chooseDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365))
    );
    selectedDate = chooseDate;
    setState(() {

    });
  }

  void chooseTime() async {
    var chooseTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now()

    );
    chooseTime?.format(context);
    selectedTime = chooseTime;
    setState(() {

    });
  }

  void addEvent() {
    if (formKey.currentState?.validate()==true&&_formKey.currentState?.validate()==true ) {
      Event event = Event(
          eventName: selectedName,
          title: titleControoler.text,
          description: discribtionControoler.text,
          eventDate: selectedDate!,
          eventImage: selectedImage,
          eventTime: selectedTime.toString()
      );
      FirebaseUtls.addEventCollection(event,userProvider.currentUser!.id).then((value){
        ToastWidget.shoeToastMsg(message: 'Event Added Successfully');
        // eventListProvider.getAllEvents();
        Navigator.pop(context);
      });

    }
  }
 void dispose(){
    super.dispose();

    eventListProvider.getAllEvents(userProvider.currentUser!.id);
 }
}
