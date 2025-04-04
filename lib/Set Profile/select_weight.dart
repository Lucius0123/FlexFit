import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pose_detection_realtime/Set%20Profile/ruler_picker.dart';
import 'package:pose_detection_realtime/Set%20Profile/select_height.dart';


class WeightSelectionPage extends StatefulWidget {
  const WeightSelectionPage({Key? key}) : super(key: key);

  @override
  _WeightSelectionPageState createState() => _WeightSelectionPageState();
}

class _WeightSelectionPageState extends State<WeightSelectionPage> {
  bool _isKgSelected = true; // Default unit is kilograms
  int _weightKg = 75; // Default weight in kg
  int _weightLb = 165; // Default weight in pounds (approx.)

  // Conversion functions
  int _kgToLb(int kg) => (kg * 2.20462).round();
  int _lbToKg(int lb) => (lb / 2.20462).round();

  // Get the current weight based on the selected unit
  int get _currentWeight => _isKgSelected ? _weightKg : _weightLb;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.navigate_before, color: Color(0xffBADE4F),size: 40,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Back",
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 24.h),
        height: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Text(
                "What is your weight?",
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: Colors.white
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 12.h),
            Center(
              child: Text(
                'Start your journey to a healthier lifestyle by setting up your profile.',
                style:Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 50.h),
            CustomScalePicker(
              minValue: _isKgSelected ? 30 : 66, // Minimum weight
              maxValue: _isKgSelected ? 200 : 440, // Maximum weight
              initialValue: _currentWeight,
              unit: _isKgSelected ? "kg" : "lb", // Unit
              isVertical: false,
              onChanged: (value) {
                setState(() {
                  if (_isKgSelected) {
                    _weightKg = value; // Update kg weight
                    _weightLb = _kgToLb(value); // Convert to lb
                  } else {
                    _weightLb = value; // Update lb weight
                    _weightKg = _lbToKg(value); // Convert to kg
                  }
                });
              },
            ),
            SizedBox(height: 50.h),
            ToggleButtons(
              isSelected: [_isKgSelected, !_isKgSelected],
              onPressed: (index) {
                setState(() {
                  _isKgSelected = index == 0; // Update unit selection
                  // Convert weights when toggling between kg and lb
                  if (_isKgSelected) {
                    _weightKg = _lbToKg(_weightLb); // Convert to kg
                  } else {
                    _weightLb = _kgToLb(_weightKg); // Convert to lb
                  }
                });
              },
              borderRadius: BorderRadius.circular(15),
              selectedColor: Colors.black,
              fillColor: Theme.of(context).colorScheme.onPrimary,
              color: Colors.white,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Text('KG', style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: _isKgSelected ?Colors.black:Colors.white,
                      fontWeight: FontWeight.bold
                  ), ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Text('LB', style:Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: _isKgSelected ?Colors.white:Colors.black,
                      fontWeight: FontWeight.bold,
                    fontSize: 30
                  ),),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const HeightSelectionPage());
              },
              child: Text("Continue", style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
