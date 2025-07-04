import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpInputField extends StatelessWidget {
  final List<TextEditingController> controllers;
  final Function(String)? onCompleted;

  const OtpInputField({
    super.key,
    required this.controllers,
    this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(controllers.length, (index) {
        return SizedBox(
          width: 40.w,
          child: TextField(
            controller: controllers[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            style: TextStyle(fontSize: 16.sp),
            decoration: const InputDecoration(counterText: ''),
            onChanged: (value) {
              if (value.isNotEmpty && index < controllers.length - 1) {
                FocusScope.of(context).nextFocus();
              }
              if (controllers.every((ctrl) => ctrl.text.isNotEmpty)) {
                onCompleted?.call(controllers.map((e) => e.text).join());
              }
            },
          ),
        );
      }),
    );
  }
}
