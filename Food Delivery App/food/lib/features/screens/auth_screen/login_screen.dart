import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food/features/screens/auth_screen/sign_up_screen.dart';
import 'package:food/features/screens/auth_screen/widgets/auth_screen_background.dart';
import 'package:food/features/screens/auth_screen/widgets/social_media_icon_button.dart';
import 'package:food/provider/auth_provider.dart';
import 'package:food/utils/app_colors.dart';
import 'package:food/utils/app_strings.dart';
import 'package:food/utils/app_text_style.dart';
import 'package:food/utils/image_path.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String name = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {




  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
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

            const SizedBox(height: 40),

            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20,),
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
                        obscureText: !authProvider.isPassVisible,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: authProvider.togglePasswordVisibility,
                            icon: Icon(authProvider.isPassVisible
                                ? Icons.visibility
                                : Icons.visibility_off,),
                          ),
                          hintText: 'Password',
                        ),
                      ),

                      const SizedBox(height: 32),

                      Row(
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                visualDensity: VisualDensity.compact,
                                value: authProvider.isChecked,
                                onChanged: (v)=> authProvider.toggleRemember(v!) ,
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
                      const SizedBox(height: 32),

                      ElevatedButton(onPressed: () {}, child: Text('Log In')),
                      const SizedBox(height: 32),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(color: AppColors.textPrimaryColor),
                            children: [
                              TextSpan(
                                text: " SING UP ",
                                style: TextStyle(
                                  color: AppColors.buttonBackground,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()..onTap =_onTapSignUp
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(child: Divider(height: 1,)),
                          const SizedBox(width: 16,),
                          Text('Or', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.w500),),
                          const SizedBox(width: 16 ,),
                          Expanded(child: Divider(height: 1.5,)),

                        ],
                      ),
                      const SizedBox(height: 20,),
                      Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SocialMediaIconButton(color: AppColors.fbIconBg, imgPath: AppImages.fbIcon, onTap: () {  },),
                            const SizedBox(width: 24,),
                            SocialMediaIconButton(color: AppColors.xIconBg, imgPath: AppImages.xIcon, onTap: () {  },),
                            const SizedBox(width: 24,),
                            SocialMediaIconButton(color: AppColors.appleIconBg, imgPath: AppImages.appleIcon, onTap: () {  },),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }


  void _onTapSignUp(){
    Navigator.pushNamed(context, SignUpScreen.name);

  }
}


