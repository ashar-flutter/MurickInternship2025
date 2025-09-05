import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ main_app/home_screen.dart';
import '../../widgets/common_text_field.dart';
import '../../widgets/common_button.dart';
import '../../providers/auth_provider.dart';
import '../../core/utils/validators.dart';
import 'signup_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  String? _err;

  Future<void> _login() async {
    setState(() => _err = null);
    final email = emailCtrl.text.trim();
    final pass = passCtrl.text;
    if (email.isEmpty) {
      setState(() => _err = 'Email is required');
      return;
    }
    final ve = Validators.email(email);
    if (ve != null) {
      setState(() => _err = ve);
      return;
    }
    if (pass.isEmpty) {
      setState(() => _err = 'Password is required');
      return;
    }
    final vp = Validators.password(pass);
    if (vp != null) {
      setState(() => _err = vp);
      return;
    }
    final auth = Provider.of<AuthProvider>(context, listen: false);
    final res = await auth.login(email, pass);
    if (!mounted) return;
    if (res == null) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
        (_) => false,
      );
    } else {
      setState(() => _err = res);
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Welcome Back',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 20),
                CommonTextField(
                  controller: emailCtrl,
                  hint: 'Email',
                  glass: true,
                ),
                const SizedBox(height: 12),
                CommonTextField(
                  controller: passCtrl,
                  hint: 'Password',
                  obscure: true,
                  glass: true,
                ),
                const SizedBox(height: 14),
                if (_err != null) ...[
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.redAccent.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      _err!,
                      style: GoogleFonts.poppins(color: Colors.red.shade900),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
                auth.loading
                    ? const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      )
                    : CommonButton(onTap: _login, label: 'Login'),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: GoogleFonts.poppins(
                        color: Colors.white.withValues(alpha: 0.9),
                      ),
                    ),
                    const SizedBox(width: 6),
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SignupScreen()),
                      ),
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
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
    );
  }
}
