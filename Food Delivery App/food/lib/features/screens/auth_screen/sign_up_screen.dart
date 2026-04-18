import 'package:flutter/material.dart';
import 'package:food/features/screens/auth_screen/widgets/auth_body_container.dart';
import 'package:food/features/screens/auth_screen/widgets/auth_screen_background.dart';
import 'package:food/provider/auth_provider.dart';
import 'package:food/utils/app_colors.dart';
import 'package:food/utils/app_strings.dart';
import 'package:food/utils/app_text_style.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  static const String name = '/signup';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.authScaffoldBgColor,
      body: AuthBackground(
        child: Column(
          children: [
            Text(
              AppStrings.signUpTitle,
              style: AppTextStyles.screenTitle.copyWith(color: AppColors.white),
            ),
            Text(
              AppStrings.signUpSubTitle,
              style: AppTextStyles.bodyText.copyWith(color: AppColors.white),
            ),

            const SizedBox(height: 40),

            AuthBodyContainer(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text('NAME'),
                TextFormField(
                  decoration: InputDecoration(hintText: 'John Doe'),
                ),
                const SizedBox(height: 20),
                Text('EMAIL'),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'example@mail.com',
                  ),
                ),
                const SizedBox(height: 20),
                Text('PASSWORD'),
                TextFormField(
                  obscureText: !authProvider.isPassVisible,
                  decoration: InputDecoration(
                    hintText: '• • • • • • • •',
                    suffixIcon: IconButton(
                      onPressed: authProvider.togglePasswordVisibility,
                      icon: Icon(
                        authProvider.isPassVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text('RE-TYPE PASSWORD'),
                TextFormField(
                  obscureText: !authProvider.isConfirmPassVisible,
                  decoration: InputDecoration(
                    hintText: '• • • • • • • •',
                    suffixIcon: IconButton(
                      onPressed: authProvider.toggleConfirmPasswordVisibility,
                      icon: Icon(
                        authProvider.isConfirmPassVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(onPressed: () {}, child: Text('SIGN UP')),
              ],
            ) ),
          ],
        ),
      ),
    );
  }
}
