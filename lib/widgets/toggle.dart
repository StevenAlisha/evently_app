import 'package:evently_app/provider/app_theme_provider.dart';
import 'package:evently_app/utls/appimages.dart';
import 'package:flutter/material.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:provider/provider.dart';

import '../provider/app_language_provider.dart';

class FlagToggleExample extends StatefulWidget {
  FlagToggleExample({super.key, required this.im1,required this.im2});

  String im1;
  String im2;
  @override
  State<FlagToggleExample> createState() => _FlagToggleExampleState();
}

class _FlagToggleExampleState extends State<FlagToggleExample> {

  String current = 'ar';

  @override
  Widget build(BuildContext context) {
    var appLanguage=Provider.of<AppLanguageProvider>(context);
    var appTheme=Provider.of<AppThemeProvider>(context);

    return  AnimatedToggleSwitch<String>.dual(
      current: context.watch<AppLanguageProvider>().applanguage,
      // current: current,
      first: 'en',
      second: 'ar',
      indicatorAnimationType: AnimationType.onHover,
      indicatorSize:   Size.fromWidth(20),
      height: 40,
      // <-- هنا SimpleIconBuilder: فقط (value)
      iconBuilder: (value) {
        return Padding(
          padding: const EdgeInsets.all(1.0),
          child: Image.asset(
            value == 'en'
                ?  widget.im1:
            widget.im2,
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
        );
      },
      onChanged: (value) {
        context.read<AppLanguageProvider>().changeLanguage(value );
        setState(() => current = value);
      },
    );
  }
}

