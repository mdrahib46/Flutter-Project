import 'package:flutter/material.dart';
import 'package:food/features/screens/auth_screen/widgets/auth_body_container.dart';
import 'package:food/features/screens/auth_screen/widgets/auth_screen_background.dart';
import 'package:food/provider/auth_provider.dart';
import 'package:food/utils/app_colors.dart';
import 'package:food/utils/app_strings.dart';
import 'package:food/utils/app_text_style.dart';
import 'package:provider/provider.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});
  static const String name = '/change-password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.authScaffoldBgColor,
      body: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          return AuthBackground(
            child: Column(
              children: [
                Text(
                  AppStrings.otpVerifyTitle,
                  style: AppTextStyles.screenTitle.copyWith(
                    color: Colors.white,
                  ),
                ),
                Text(
                  AppStrings.otpVerifySubTitle,
                  style: AppTextStyles.bodyText.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 40),
                AuthBodyContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('PASSWORD'),
                      TextFormField(
                        obscureText: !authProvider.isPassVisible,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          suffixIcon: IconButton(
                            onPressed: authProvider.togglePasswordVisibility,
                            icon: Icon(Icons.visibility),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text('CONFIRM PASSWORD'),
                      TextFormField(
                        obscureText: !authProvider.isConfirmPassVisible,
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          suffixIcon: IconButton(
                            onPressed:
                                authProvider.toggleConfirmPasswordVisibility,
                            icon: Icon(Icons.visibility),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      ElevatedButton(onPressed: () {}, child: Text('Reset')),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
