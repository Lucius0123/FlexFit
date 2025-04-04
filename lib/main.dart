import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pose_detection_realtime/profile_pages/Edit_profile.dart';
import 'package:pose_detection_realtime/profile_pages/Setting_Page/setting_page.dart';
import 'package:pose_detection_realtime/profile_pages/my_profile.dart';
import 'Search Pages/search_screen.dart';
import 'Set Profile/age_selection.dart';
import 'Set Profile/gender_selection.dart';
import 'Set Profile/goal_select.dart';
import 'Set Profile/select_height.dart';
import 'Set Profile/select_weight.dart';
import 'Set Profile/setUp.dart';
import 'SignUp Page/forgotPassword.dart';
import 'SignUp Page/login.dart';
import 'SignUp Page/setPassword.dart';
import 'SignUp Page/signUP.dart';
import 'home_page.dart';
late List<CameraDescription> cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690), // Design resolution size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: _buildThemeData(),
          initialRoute: '/login',
          getPages: [
            GetPage(name: '/login', page: () =>  LoginPage()),
            GetPage(name: '/home_page', page: () =>  HomePage()),
            GetPage(name: '/signup', page: () => const SignUpPage()),
            GetPage(name: '/setting_page', page: () =>  SettingsPage()),
            GetPage(name: '/Search_screen', page: () =>  SearchScreen()),

          ],
        );
      },
    );
  }
  ThemeData _buildThemeData() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: const Color(0xff6E8EEF),
      scaffoldBackgroundColor: const Color(0xff232323),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.poppins(
          fontSize: 32.sp, // Use .sp for responsive font sizes
          fontWeight: FontWeight.w500,
          color: const Color(0xffBADE4F),
        ),
        displayMedium: GoogleFonts.poppins(
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
          color: const Color(0xffBADE4F),
        ),
        displaySmall:GoogleFonts.poppins(
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
          color:  Colors.white,
        ),
        bodyLarge: GoogleFonts.poppins(
          fontSize: 18.sp,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        bodyMedium: GoogleFonts.poppins(
          fontSize: 14.sp,
          color: Colors.white,
        ),
        labelLarge: GoogleFonts.poppins(
          fontSize: 16.sp,
          color: Colors.black,
        ),

      ),
      colorScheme: ColorScheme.dark(
        primary: const Color(0xff6E8EEF),
        secondary: Colors.grey[800]!,
        surface: const Color(0xff232323),
        onPrimary: const Color(0xffBADE4F),
        onSecondary: Colors.white,
        onSurface: const Color(0xff295095),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white.withOpacity(0.20),
          foregroundColor: const Color(0xff295095),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
            side: const BorderSide(
              color: Colors.white,
              width: 1,
            ),
          ),
          minimumSize: Size(100.w, 50.h), // Use .w and .h for responsive sizes
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        labelStyle: const TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xff295095)),
        ),
      ),
    );
  }
}



