import 'package:evently_app/utls/App_Styles.dart';
import 'package:evently_app/utls/appcolors.dart';
import 'package:evently_app/utls/appimages.dart';
import 'package:evently_app/utls/approute.dart';
import 'package:evently_app/widgets/customtextfield.dart';
import 'package:flutter/material.dart';

import '../widgets/customelevatedbuttom.dart';
import '../widgets/toggle.dart';
final formkey=GlobalKey<FormState>();
class RegisterScreen extends StatefulWidget {
    RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var emailController=TextEditingController();
  var passwordController=TextEditingController();

  var  nameController=TextEditingController();
  var repassworddController=TextEditingController();
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
            textInputType: TextInputType.emailAddress,

      
            prefixicon:Image.asset(AppAssets.nameicon),hintText: 'Name',),
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
            prefixicon:Image.asset(AppAssets.emailicon),hintText: 'Email',),
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
              prefixicon:Image.asset(AppAssets.passwordicon),hintText: 'Password',),

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
              prefixicon:Image.asset(AppAssets.passwordicon),hintText: 'Re Password',),
            SizedBox(height: height*0.02,),
            Customelevatedbuttom(onPressed:login,
              elevatedchild: Text("Login",style: AppStyles.medium20white,),
              elevatedcolor: AppColors.Primarycolorlight,),
            SizedBox(height: height*0.02,),
      
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text('Already Have Account ?',style: Theme.of(context).textTheme.displayLarge,),
              TextButton(onPressed: (){}, child: Text('Login',style: AppStyles.bold16primary.copyWith(
                decoration:TextDecoration.underline,
              ),))
            ],),
            SizedBox(height: height*0.02,),
      
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
    );
  }

  void login(){
    if(formkey.currentState?.validate()==true){
      Navigator.pushNamed(context, Approuts.homepage  );
    }
  }
}
