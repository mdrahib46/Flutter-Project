import 'package:flutter/material.dart';
import 'package:food/features/screens/auth_screen/widgets/auth_body_container.dart';
import 'package:food/features/screens/auth_screen/widgets/auth_screen_background.dart';
import 'package:food/utils/app_colors.dart';
import 'package:food/utils/app_strings.dart';
import 'package:food/utils/app_text_style.dart';

import 'otp_verify_screen.dart';

class ForgotPassScreen extends StatefulWidget {
  static const String name = '/forgot-pass';
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.authScaffoldBgColor,
      body: AuthBackground(
        child: Column(
          children: [
            Text(
              AppStrings.forgotPassTitle,
              style: AppTextStyles.screenTitle.copyWith(color: AppColors.white),
            ),
            Text(
              AppStrings.forgotPassSubTitle,
              style: AppTextStyles.bodyText.copyWith(color: AppColors.white),
            ),
            const SizedBox(height: 40),
            AuthBodyContainer(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text('EMAIL'),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'example@mail.com'
                ),
              ),
              const SizedBox(height:  20,),
              ElevatedButton(onPressed: _moveToOtpVerifyScreen, child: Text('Send Code'))
            ],))
          ],
        ),
      ),
    );
  }


  void _moveToOtpVerifyScreen(){
    Navigator.pushNamed(context, OtpVerifyScreen.name, );
  }
}
