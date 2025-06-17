import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  final List<TextInputFormatter>? inputFormatter;
  final double topPadding;
  final double bottomPadding;
  final IconData icon;
  final String label;
  final TextInputType keyboard;
  final bool isSecret;
  final String? initialValeu;
  final bool isReadOnly;

  const CustomTextField({
    super.key,
    this.inputFormatter,
    this.topPadding = 0,
    this.bottomPadding = 0,
    required this.icon,
    required this.label,
    this.keyboard = TextInputType.text,
    this.isSecret = false,
    this.initialValeu,
    this.isReadOnly = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;

  @override
  void initState() {
    super.initState();
    isObscure = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        widget.topPadding,
        0,
        widget.bottomPadding,
      ),
      child: TextFormField(
        inputFormatters: widget.inputFormatter,
        obscureText: isObscure,
        readOnly: widget.isReadOnly,
        obscuringCharacter: "•",
        keyboardType: widget.keyboard,
        decoration: InputDecoration(
          isDense: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: Colors.green),
          ),
          prefixIcon: Icon(widget.icon),
          suffixIcon: widget.isSecret
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon: Icon(
                    isObscure ? Icons.visibility : Icons.visibility_off,
                  ),
                )
              : null,
          labelText: widget.label,
          labelStyle: TextStyle(color: Colors.blueGrey),
        ),
        initialValue: widget.initialValeu,
      ),
    );
  }
}
