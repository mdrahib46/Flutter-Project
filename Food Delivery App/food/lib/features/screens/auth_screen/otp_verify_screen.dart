import 'package:flutter/material.dart';
import 'package:food/features/screens/auth_screen/widgets/auth_body_container.dart';
import 'package:food/features/screens/auth_screen/widgets/auth_screen_background.dart';
import 'package:food/utils/app_colors.dart';
import 'package:food/utils/app_strings.dart';
import 'package:food/utils/app_text_style.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});
  static const String name = '/otp-verification';

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  PinInputController pinCodeController = PinInputController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.authScaffoldBgColor,
      body: AuthBackground(
        child: Column(
          children: [
            Text(
              AppStrings.otpVerifyTitle,
              style: AppTextStyles.screenTitle.copyWith(color: AppColors.white),
            ),
            Text(
              AppStrings.otpVerifySubTitle,
              style: AppTextStyles.bodyText.copyWith(color: AppColors.white),
            ),
            const SizedBox(height: 40),

            AuthBodyContainer(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('CODE'),
                      const Spacer(),
                      InkWell(
                        child: Text(
                          'Resend',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text('in. 50sec'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  MaterialPinFormField(
                    pinController: pinCodeController,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    length: 4,
                    theme: MaterialPinTheme(
                      cellSize: Size(56, 64),
                      fillColor: AppColors.pinCodeBoxColor,
                      borderColor: Colors.transparent,
                      filledFillColor: AppColors.pinCodeBoxColor,
                      focusedFillColor: AppColors.pinCodeBoxColor,
                      focusedBorderColor: Colors.transparent,
                      cursorColor: AppColors.primaryColor,
                      completeBorderColor: Colors.transparent,
                      filledBorderColor: Colors.transparent,
                      cursorWidth: 2.2,
                      cursorHeight: 24,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      print(pinCodeController.text);
                    },
                    child: Text('VERIFY'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _moveToOtpVerifyScreen() {
    Navigator.pushNamed(context, OtpVerifyScreen.name);
  }
}
