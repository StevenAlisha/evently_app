import 'package:evently_app/utls/App_Styles.dart';
import 'package:evently_app/utls/appcolors.dart';
import 'package:flutter/material.dart';
typedef Onvalidator=String? Function(String?)?;
class Customtextfield extends StatelessWidget {
    Customtextfield({
  super.key,
  this.hintText,
required  this.borderSideColor,
  this.hintstyle,
  this.prefixicon,
  this.prefixiconcolor,
  this.labelstyle,
  this.suffixicon,
  this.labelText,
  this.preficiconstyle,
      this.validator,
      this.textInputType,
        this.obscuretext=false,
      required this.controller,
      this.maxline=1,
    });

    String? hintText;
    String? labelText;
    TextStyle? hintstyle;
    TextStyle? labelstyle;
    Color borderSideColor;
    Color? prefixiconcolor ;
    Widget? prefixicon;
    TextStyle? preficiconstyle;
    Widget? suffixicon;
    Onvalidator?validator;
    TextInputType? textInputType;
    bool obscuretext;
    TextEditingController controller ;
    int maxline;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines:maxline ,
      controller:controller ,
      obscuringCharacter: '*',
      obscureText: obscuretext,
      keyboardType:textInputType ,
     validator: validator,
            decoration: InputDecoration(
              prefixIconColor: prefixiconcolor,
              prefixIcon: prefixicon,
              prefixStyle: preficiconstyle,
              focusedBorder: buildOutlineInputBorder( ),
              enabledBorder: buildOutlineInputBorder( ),
              errorBorder: buildOutlineErrorInputBorder( ),
              focusedErrorBorder: buildOutlineErrorInputBorder(),
              labelText: labelText,
              labelStyle: labelstyle,
              hintText:hintText,
              hintStyle: hintstyle??AppStyles.med16grey,
              suffixIcon: suffixicon,

            ),

    );
  }
    OutlineInputBorder buildOutlineInputBorder(   ){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide:  BorderSide(color:borderSideColor,width: 2 )

    );
    }
    OutlineInputBorder buildOutlineErrorInputBorder(   ){
      return OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide:  BorderSide(color:Colors.red,width: 2 )

      );
    }
}
