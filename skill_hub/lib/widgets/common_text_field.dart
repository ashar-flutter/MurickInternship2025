import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final bool obscure;
  final String? Function(String?)? validator;
  final bool glass;

  const CommonTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.obscure = false,
    this.validator,
    this.glass = true,
  });

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  bool _ob = false;
  @override
  void initState() {
    super.initState();
    _ob = widget.obscure;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: BackdropFilter(
        filter: widget.glass
            ? ImageFilter.blur(sigmaX: 8, sigmaY: 8)
            : ImageFilter.blur(sigmaX: 0, sigmaY: 0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(18),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.white.withAlpha(30)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(18),
                blurRadius: 8,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: TextFormField(
            controller: widget.controller,
            obscureText: _ob,
            validator: widget.validator,
            style: GoogleFonts.poppins(color: Colors.white),
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: GoogleFonts.poppins(
                color: Colors.white.withAlpha(120),
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              suffixIcon: widget.obscure
                  ? IconButton(
                      icon: Icon(
                        _ob ? Icons.visibility_off : Icons.visibility,
                        color: Colors.white.withAlpha(200),
                      ),
                      onPressed: () => setState(() => _ob = !_ob),
                    )
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
