import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ main_app/home_screen.dart';
import '../../widgets/common_text_field.dart';
import '../../widgets/common_button.dart';
import '../../providers/auth_provider.dart';
import '../../core/utils/validators.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  String? role;
  String? _err;

  Future<void> _signup() async {
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
    if (role == null) {
      setState(() => _err = 'Please select a role');
      return;
    }
    final auth = Provider.of<AuthProvider>(context, listen: false);
    final res = await auth.signup(email, pass, role!);
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
            colors: [Color(0xFF2575FC), Color(0xFF6A11CB)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Create Account',
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
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.06),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.08),
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      dropdownColor: Colors.black87,
                      value: role,
                      hint: Text(
                        'Select Role',
                        style: GoogleFonts.poppins(
                          color: Colors.white.withValues(alpha: 0.9),
                        ),
                      ),
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white.withValues(alpha: 0.9),
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: 'student',
                          child: Text(
                            'Student',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'instructor',
                          child: Text(
                            'Instructor',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                      onChanged: (v) => setState(() => role = v),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                if (_err != null)
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
                auth.loading
                    ? const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      )
                    : CommonButton(onTap: _signup, label: 'Sign Up'),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: GoogleFonts.poppins(
                        color: Colors.white.withValues(alpha: 0.9),
                      ),
                    ),
                    const SizedBox(width: 6),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Login',
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
