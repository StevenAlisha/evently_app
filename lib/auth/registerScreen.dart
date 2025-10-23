import 'package:evently_app/model/usersModel.dart';
import 'package:evently_app/utls/App_Styles.dart';
import 'package:evently_app/utls/appcolors.dart';
import 'package:evently_app/utls/appimages.dart';
import 'package:evently_app/utls/approute.dart';
import 'package:evently_app/utls/frebase_utls.dart';
import 'package:evently_app/widgets/customtextfield.dart';
import 'package:evently_app/widgets/toastWidgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../provider/userProvider.dart';
import '../widgets/alertdialog.dart';
import '../widgets/customelevatedbuttom.dart';
import '../widgets/toggle.dart';
final formkey=GlobalKey<FormState>();
class RegisterScreen extends StatefulWidget {
    RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var emailController=TextEditingController(text: 'steven@gmail.com');
  var passwordController=TextEditingController(text: '123456');

  var  nameController=TextEditingController(text: 'Steven');
  var repassworddController=TextEditingController(text: '123456');
  @override
  Widget build(BuildContext context) {
   var height=MediaQuery.of(context).size.height;
   var width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme:IconThemeData(color: AppColors.Primarycolorlight) ,
        backgroundColor: AppColors.transparent,title: Text('Register',style: AppStyles.med20primary,),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
           Image.asset(AppAssets.eventlogo),
            SizedBox(height: height*0.03,),
          Form(
              key:formkey ,
              child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            Customtextfield(
              borderSideColor: AppColors.grey,
              controller: nameController,
              textInputType: TextInputType.name,

                
              prefixicon:Image.asset(AppAssets.nameicon),hintText: AppLocalizations.of(context)!.name,),
            SizedBox(height: height*0.02,),
            Customtextfield(
              borderSideColor: AppColors.grey,
              controller: emailController,
          
                textInputType: TextInputType.emailAddress,
              validator: (text){
                if(text==null ||text.trim() .isEmpty){
                  return 'Please Enter Email';
                }
                final bool emailValid =
                RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(text);
                if(!emailValid){
                  return 'Please enter valid,email ';
                }
              },
              prefixicon:Image.asset(AppAssets.emailicon),hintText: AppLocalizations.of(context)!.email,),
              SizedBox(height: height*0.02,),
              Customtextfield(
                borderSideColor: AppColors.grey,
                validator: (text){
                  if(text!.length<6){
                    return 'Password must be greater than 6 chars';
                  }
                },
                controller: passwordController,
                obscuretext: true ,
                textInputType: TextInputType.phone,
                suffixicon: Image.asset(AppAssets.hideicon),
                prefixicon:Image.asset(AppAssets.passwordicon),hintText: AppLocalizations.of(context)!.password,),
          
              SizedBox(height: height*0.02,),
              Customtextfield(
          
                borderSideColor: AppColors.grey,
                validator: (text){
                  if(text == passwordController)
                    {
                      return 'password';
          
                    }
                  return null;
                },
          
                controller: repassworddController,
                obscuretext: true ,
                textInputType: TextInputType.phone,
                suffixicon: Image.asset(AppAssets.hideicon),
                prefixicon:Image.asset(AppAssets.passwordicon),hintText:AppLocalizations.of(context)!.password,),
              SizedBox(height: height*0.02,),
              Customelevatedbuttom(onPressed:register,
                elevatedchild: Text(AppLocalizations.of(context)!.login,style: AppStyles.medium20white,),
                elevatedcolor: AppColors.Primarycolorlight,),
              SizedBox(height: height*0.02,),
                
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(AppLocalizations.of(context)!.already_have_account,style: Theme.of(context).textTheme.displayLarge,),
                TextButton(onPressed: (){}, child: Text(AppLocalizations.of(context)!.login,style: AppStyles.bold16primary.copyWith(
                  decoration:TextDecoration.underline,
                ),))
              ],),

              SizedBox(height: height*0.02,),
              Column(
                children: [
                  FlagToggleExample(im1: AppAssets.EG, im2: AppAssets.US,),
                ],
              ),
              SizedBox(height: height*0.02,),
                
                
            ],
                
          )
          ),
                
                
          ],),
        ),
      ),
    );
  }

  void register()async{

    if(formkey.currentState?.validate()==true){
      DialogWidget.showLoading(context: context, message: "Loading");
      try {
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        DialogWidget.hideLoading(context: context);
        DialogWidget.showMessage(context: context, message: 'Register Successfully',titleMessage: "Success",confirmMessage: 'Ok');

        MyUser myUser=MyUser(
            id:credential.user?.uid ??'' ,
            name: nameController.text,
            email: emailController.text);
      await FirebaseUtls.addUserToFireStore(myUser);
        var userProvider=Provider.of<UserProvider>(context,listen: false);
        userProvider.updateUser(myUser);
      // } on FirebaseAuthException catch (e) {
      //   if (e.code == 'weak-password') {
      //     print('The password provided is too weak.');
      //   } else if (e.code == 'email-already-in-use') {
      //     print('The account already exists for that email.');
      //   }
       }
      catch (e) {
        print(e.toString());
      }

      // Navigator.pushNamed(context, Approuts.homepage);
    }
  }
}
