import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/model/eventmodel.dart';
import 'package:evently_app/model/usersModel.dart';
import 'package:evently_app/provider/eventListProvider.dart';
import 'package:evently_app/provider/userProvider.dart';
import 'package:evently_app/utls/App_Styles.dart';
import 'package:evently_app/utls/appcolors.dart';
import 'package:evently_app/utls/appimages.dart';
import 'package:evently_app/utls/approute.dart';
import 'package:evently_app/utls/frebase_utls.dart';
import 'package:evently_app/widgets/alertdialog.dart';
import 'package:evently_app/widgets/customtextfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../widgets/customelevatedbuttom.dart';
import '../widgets/toggle.dart';
final formkey=GlobalKey<FormState>();
class Loginscreen extends StatefulWidget {
    Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset(AppAssets.eventlogo),
              SizedBox(height: height * 0.03,),
              Form(
                  key: formkey,
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Customtextfield(
                        borderSideColor: AppColors.grey,
                        controller: emailController,
                        textInputType: TextInputType.emailAddress,
                        validator: (text) {
                          if (text == null || text
                              .trim()
                              .isEmpty) {
                            return 'Please Enter Email';
                          }
                          final bool emailValid =
                          RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(text);
                          if (!emailValid) {
                            return 'Please enter valid,email ';
                          }
                        },

                        prefixicon: Image.asset(AppAssets.emailicon),
                        hintText: AppLocalizations.of(context)!.email,),
                      SizedBox(height: height * 0.02,),
                      Customtextfield(
                        borderSideColor: AppColors.grey,
                        validator: (text) {
                          if (text!.length < 6) {
                            return 'Password must be greater than 8 chars';
                          }
                        },
                        controller: passwordController,
                        obscuretext: true,
                        textInputType: TextInputType.phone,
                        suffixicon: Image.asset(AppAssets.hideicon),
                        prefixicon: Image.asset(AppAssets.passwordicon),
                        hintText: AppLocalizations.of(context)!.password,),
                      SizedBox(height: height * 0.02,),
                      TextButton(onPressed: () {
                        //todo navigate to forget password screen
                      }
                          , child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(AppLocalizations.of(context)!
                                  .forget_password, style: AppStyles
                                  .bold16primary.copyWith(
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.Primarycolorlight
                              ),
                              ),
                            ],
                          )
                      ),
                      SizedBox(height: height * 0.02,),
                      Customelevatedbuttom(

                        onPressed: login,
                        elevatedchild: Text(AppLocalizations.of(context)!.login,
                          style: AppStyles.medium20white,),
                        elevatedcolor: AppColors.Primarycolorlight,),
                      SizedBox(height: height * 0.02,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(AppLocalizations.of(context)!.dont_ha_account,
                            style: Theme
                                .of(context)
                                .textTheme
                                .displayLarge,),
                          TextButton(onPressed: () {
                            Navigator.of(context).pushNamed(
                                Approuts.registerScreen);
                          }, child: Text(AppLocalizations.of(context)!
                              .create_account, style: AppStyles.bold16primary
                              .copyWith(
                            decoration: TextDecoration.underline,
                          ),))
                        ],),
                      SizedBox(height: height * 0.02,),
                      Row(children: [
                        Expanded(
                          child: Divider(
                            thickness: 2,
                            indent: width * 0.04,
                            endIndent: width * 0.04,
                            color: AppColors.Primarycolorlight,),
                        ),
                        Text(AppLocalizations.of(context)!.or,
                          style: AppStyles.med16primary,),

                        Expanded(
                          child: Divider(
                            thickness: 2,
                            indent: width * 0.04,
                            endIndent: width * 0.04,
                            color: AppColors.Primarycolorlight,),
                        ),
                      ],),
                      SizedBox(height: height * 0.02,),
                      Column(
                        children: [
                          FlagToggleExample(
                            im1: AppAssets.EG, im2: AppAssets.US,),
                        ],
                      ),
                      SizedBox(height: height * 0.02,),
                      Customelevatedbuttom(

                        onPressed: signInWithGoogle, elevatedchild:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppAssets.googleicon),
                          SizedBox(width: width * 0.02,),
                          Text(AppLocalizations.of(context)!.login_w_google,
                            style: AppStyles.med20primary,)
                        ],),),

                    ],

                  )
              ),


            ],),
        ),
      ),
    );
  }

  void login() async {
    if (formkey.currentState?.validate() == true) {
      DialogWidget.showLoading(context: context, message: 'Loading');
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        var user = await FirebaseUtls.readUserFromFirebase(
            credential.user?.uid ?? ' ');
        if (user == null) {
          return;
        }
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.updateUser(user);
        var evenListProvider = Provider.of<EventListProvider>(
            context, listen: false);
        evenListProvider.changeSelectedIndex(0, userProvider.currentUser!.id);
        evenListProvider.getFavoriteEvent(userProvider.currentUser!.id);
        DialogWidget.hideLoading(context: context);
        DialogWidget.showMessage(context: context,
            message: 'Login Successfully',
            confirmMessage: 'Ok',
            cancelMessage: 'Cancel',
            titleMessage: 'Success');
      }

      catch (e) {
        print(e.toString());
      }
      //Navigator.pushNamed(context, Approuts.homepage);

    }
  }


  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser
          ?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print(e.toString());
    }
    return null;

  }


}
