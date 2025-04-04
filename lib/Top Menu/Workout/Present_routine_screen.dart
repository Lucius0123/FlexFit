import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pose_detection_realtime/Model/exercise_model.dart';
import 'package:pose_detection_realtime/Pose%20Detector/pose_detector.dart';
import 'package:pose_detection_realtime/Top%20Menu/Workout/routine_card.dart';

class PresetRoutinesPage extends StatefulWidget {
  @override
  State<PresetRoutinesPage> createState() => _PresetRoutinesPageState();
}

class _PresetRoutinesPageState extends State<PresetRoutinesPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        leading: IconButton(
          icon:  Icon(
            Icons.navigate_before,
            color: Theme.of(context).colorScheme.onPrimary,
            size: 40,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Workouts',
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: Theme.of(context).colorScheme.primary,),
        ),
      ),
      body: Column(
        children: [
          // List of routines
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 12.sp,vertical: 8.sp),
              itemCount: exerciseList.length,
              itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    Get.to(() => PoseDetection(exerciseDataModel: exerciseList[index],));
                  },
                    child: RoutineCard(title: exerciseList[index].title, image: exerciseList[index].image));
              },
            ),
          ),
        ],
      ),
    );
  }
}
