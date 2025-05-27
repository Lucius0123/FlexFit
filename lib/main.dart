import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'A part/controllers/app_controller.dart';
import 'A part/controllers/auth_controller.dart';
import 'A part/controllers/challenge_controller.dart';
import 'A part/controllers/daily_challenge_controller.dart';
import 'A part/controllers/leaderboard_controller.dart';
import 'A part/controllers/user_controller.dart';
import 'A part/controllers/workout_controller.dart';
import 'A part/screens/splash_screen.dart';
import 'A part/services/firebase_service.dart';
import 'firebase_options.dart';
late List<CameraDescription> cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Get.putAsync(() => FirebaseService().init());

  // Initialize controllers
  Get.put(AuthController());
  Get.put(AppController());
  Get.put(UserController());
  Get.put(WorkoutController());
  Get.put(ChallengeController());
  Get.put(LeaderboardController());
  Get.put(DailyChallengeController()); // Add this line


  runApp( MyApp());
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
          home: SplashScreen(),
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
        labelMedium: GoogleFonts.poppins(
          fontSize: 12.sp,
          color: Colors.black,
        ),
        labelSmall: GoogleFonts.poppins(
          fontSize: 10.sp,
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



