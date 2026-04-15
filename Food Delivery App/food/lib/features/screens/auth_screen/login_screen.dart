import 'package:flutter/material.dart';
import 'package:food/features/screens/auth_screen/widgets/auth_screen_background.dart';
import 'package:food/utils/app_colors.dart';
import 'package:food/utils/app_strings.dart';
import 'package:food/utils/app_text_style.dart';

class LoginScreen extends StatefulWidget {
  static const String name = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isChecked = false;
  bool _isPassVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121223),
      body: AuthBackground(
        child: Column(
          children: [
            Text(
              AppStrings.loginTitle,
              style: AppTextStyles.screenTitle.copyWith(color: AppColors.white),
            ),
            Text(
              AppStrings.loginSubTitle,
              style: AppTextStyles.bodyText.copyWith(color: AppColors.white),
            ),

            const SizedBox(height: 32),

            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  topLeft: Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('EMAIL'),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'example@gmail.com',
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text('PASSWORD'),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.visibility),
                        ),
                        hintText: 'Password',
                      ),
                    ),

                    const SizedBox(height: 20),

                    Row(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              visualDensity: VisualDensity.compact,
                              value: _isChecked,
                              onChanged: (value) {
                                setState(() {
                                  _isChecked = value!;
                                });
                              },
                            ),
                            Text(
                              'Remember me',
                              style: TextStyle(
                                color: AppColors.textPrimaryColor,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'Forgotten Password',
                            style: TextStyle(
                              color: AppColors.buttonBackground,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16,),

                    ElevatedButton(
                      onPressed: () {},

                      child: Text('Log In'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
