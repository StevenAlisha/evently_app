import 'package:evently_app/model/eventmodel.dart';
import 'package:evently_app/utls/App_Styles.dart';
import 'package:evently_app/utls/appcolors.dart';
import 'package:evently_app/utls/appimages.dart';
import 'package:evently_app/utls/approute.dart';
import 'package:evently_app/widgets/customtextfield.dart';
import 'package:flutter/material.dart';

import '../widgets/customelevatedbuttom.dart';
import '../widgets/toggle.dart';
final formkey=GlobalKey<FormState>();
class Loginscreen extends StatefulWidget {
    Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
   var height=MediaQuery.of(context).size.height;
   var width=MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
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
              validator: (text){if(text!.length<8){
              return 'Password must be greater than 8 chars';
              }
              },
              controller: passwordController,
              obscuretext: true ,
        textInputType: TextInputType.phone,
              suffixicon: Image.asset(AppAssets.hideicon),
              prefixicon:Image.asset(AppAssets.passwordicon),hintText: 'Password',),
              SizedBox(height: height*0.02,),
            TextButton(onPressed: (){
              //todo navigate to forget password screen
            }
                , child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Forget Password ?',style: AppStyles.bold16primary.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.Primarycolorlight
                    ),
                    ),
                  ],
                )
            ),
              SizedBox(height: height*0.02,),
              Customelevatedbuttom(
               
                onPressed:login,
                elevatedchild: Text("Login",style: AppStyles.medium20white,),
                elevatedcolor: AppColors.Primarycolorlight,),
              SizedBox(height: height*0.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text('Don’t Have Account ?',style: Theme.of(context).textTheme.displayLarge,),
                TextButton(onPressed: (){
                  Navigator.of(context).pushNamed(Approuts.registerScreen);
                }, child: Text('Create Account',style: AppStyles.bold16primary.copyWith(
                  decoration:TextDecoration.underline,
                ),))
              ],),
              SizedBox(height: height*0.02,),
              Row(children: [
                Expanded(
                  child: Divider(
                    thickness: 2,
                    indent: width*0.04,endIndent: width*0.04,color: AppColors.Primarycolorlight,),
                ),
                Text('Or',style:AppStyles.med16primary ,),

                Expanded(
                  child: Divider(
                    thickness: 2,
                    indent: width*0.04,endIndent: width*0.04,color: AppColors.Primarycolorlight,),
                ),
              ],),
              SizedBox(height: height*0.02,),
              Column(
                children: [
                  FlagToggleExample(im1: AppAssets.EG, im2: AppAssets.US,),
                ],
              ),
              SizedBox(height: height*0.02,),
              Customelevatedbuttom(

                onPressed: () {  },elevatedchild:
              Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                Image.asset(AppAssets.googleicon),
                  SizedBox(width: width*0.02,),
                Text('Login With Google',style:AppStyles.med20primary ,)
              ],),),

            ],

          )
          ),


          ],),
        ),
      ),
    );
  }

  void login(){
    if(formkey.currentState?.validate()==true){
       Navigator.pushNamed(context, Approuts.homepage);

    }
  }
}
