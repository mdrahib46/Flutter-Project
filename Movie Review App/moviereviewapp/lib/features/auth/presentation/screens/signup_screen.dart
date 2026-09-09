import 'package:flutter/material.dart';
import 'package:moviereviewapp/features/auth/presentation/screens/login_screen.dart';
import '../../../../app/asset_path.dart';
import '../../../../core/app_colors.dart';
import '../widget/GlassContainerBG.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  static const String name = '/signup';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              AssetPath.splashBanner, // Using a different background as per screenshot
              fit: BoxFit.cover,
            ),
          ),
          // Gradient Overlay to darken background
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.2),
                    Colors.black.withOpacity(0.6),
                  ],
                ),
              ),
            ),
          ),
          // Logo and Title at top
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  Image.asset(
                    AssetPath.logoSplashScreen,
                    height: 40,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'CINEPHILER',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Glass Signup Container
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: GlassContainerBG(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Sign up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Create an account to continue.',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 32),
                        // Username Field
                        _buildTextField(
                          controller: _usernameController,
                          hintText: 'Username',
                          icon: Icons.person_outline,
                        ),
                        const SizedBox(height: 16),
                        // Email Field
                        _buildTextField(
                          controller: _emailController,
                          hintText: 'Email',
                          icon: Icons.email_outlined,
                        ),
                        const SizedBox(height: 16),
                        // Password Field
                        _buildTextField(
                          controller: _passwordController,
                          hintText: 'Password',
                          icon: Icons.lock_outline,
                          isPassword: true,
                        ),
                        const SizedBox(height: 32),
                        // Signup Button
                        ElevatedButton(
                          onPressed: () {
                            // Handle signup logic
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.accent,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            minimumSize: const Size(double.infinity, 54),
                          ),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Login Footer
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account? Go to the ",
                              style: TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(context, LoginScreen.name);
                              },
                              child: const Text(
                                'Login Page',
                                style: TextStyle(
                                  color: AppColors.accent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white54),
          prefixIcon: Icon(icon, color: Colors.white54),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColors.accent, width: 1),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        ),
      ),
    );
  }
}
