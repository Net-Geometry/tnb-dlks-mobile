import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../root/root_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _otpController = List<TextEditingController>.generate(6, (_) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 60.h),
              CircleAvatar(
                radius: 40.r,
                backgroundColor: Colors.blue,
                child: Icon(Icons.flash_on, color: Colors.white, size: 40.sp),
              ),
              SizedBox(height: 16.h),
              Text("DLKS Mobile", style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold)),
              Text("Field Work Management", style: TextStyle(color: Colors.grey, fontSize: 14.sp)),
              SizedBox(height: 40.h),

              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              SizedBox(height: 16.h),

              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  suffixIcon: Icon(Icons.visibility_off),
                ),
              ),
              SizedBox(height: 20.h),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const RootScreen()),
                  );
                },
                child: SizedBox(
                  width: double.infinity,
                  child: Center(child: Text('Login', style: TextStyle(fontSize: 16.sp))),
                ),
              ),
              SizedBox(height: 32.h),

              Text('Two-Factor Authentication', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp)),
              SizedBox(height: 8.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (i) {
                  return SizedBox(
                    width: 40.w,
                    child: TextField(
                      controller: _otpController[i],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      decoration: const InputDecoration(counterText: ''),
                    ),
                  );
                }),
              ),
              SizedBox(height: 12.h),

              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: const BorderSide(color: Colors.red),
                ),
                child: Text('Verify Code', style: TextStyle(fontSize: 14.sp)),
              ),

              SizedBox(height: 16.h),
              TextButton(onPressed: () {}, child: Text('Forgot Password?', style: TextStyle(fontSize: 14.sp))),
              SizedBox(height: 40.h),
              Text('Powered by TNB\nVersion 2.0.0',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
