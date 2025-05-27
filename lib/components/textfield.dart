import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class GeneralTextField extends StatelessWidget {
  const GeneralTextField(
      {super.key,
        required this.hintText,
        required this.filledName,
        this.type,
        required this.controller, this.feildColor});
  final String hintText;
  final String filledName;
  final TextInputType? type;
  final Color? feildColor ;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(filledName,style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: feildColor
        ),),
        const SizedBox(height: 8,),
        TextField(
          keyboardType: type,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Colors.grey
            )
          ),
          style:Theme.of(context).textTheme.labelLarge,
        ),
      ],
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField(
      {super.key, required this.text, required this.controller, required this.passFilledName,this.feildColor});
  final String text;
  final String passFilledName;
  final TextEditingController controller;
  final Color? feildColor ;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}
class _PasswordTextFieldState extends State<PasswordTextField> {
  bool pressed = true;
  IconData icon = CupertinoIcons.eye_slash;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.passFilledName,style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: widget.feildColor
        ),),
        const SizedBox(height: 8,),
        TextField(
          obscureText: pressed,
          style:Theme.of(context).textTheme.labelLarge!.copyWith(
            color: Colors.black
          ),
          controller: widget.controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFF9FAFB),
            suffixIcon: IconButton(
              onPressed: () {
                setState(
                      () {
                    pressed = !pressed;
                    if (pressed) {
                      icon = CupertinoIcons.eye_slash;
                    } else {
                      icon = CupertinoIcons.eye;
                    }
                  },
                );
              },
              icon: Icon(icon,color: Colors.black,),
            ),
            hintText: widget.text,
            hintStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Colors.grey
    ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Color(0xff295095)),
            ),
          ),
        ),
      ],
    );
  }
}
