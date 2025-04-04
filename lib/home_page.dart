import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pose_detection_realtime/profile_pages/my_profile.dart';
import 'Coummunity/community_screen.dart';
import 'Notification/notification_screen.dart';
import 'Progress tracking/workout_log_screen.dart';
import 'Search Pages/search_screen.dart';
import 'Top Menu/Workout/Present_routine_screen.dart';
import 'bottom_bar.dart';
import 'components/Home_page_Cards/ChallengeCard.dart';
import 'components/Home_page_Cards/RecommendationCard.dart';
import 'components/Home_page_Cards/article_card.dart';
import 'components/Home_page_Cards/icons_card.dart';
class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Center(child: Text('Home', style: TextStyle(color: Colors.white))),
    Center(child: Text('Workouts', style: TextStyle(color: Colors.white))),
    Center(child: Text('Challenges', style: TextStyle(color: Colors.white))),
    Center(child: Text('Support', style: TextStyle(color: Colors.white))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hi, Madison",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Theme.of(context).colorScheme.primary,
                          size: 35,
                        ),
                        onPressed: () {
                          Get.to(() => SearchScreen());
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.notifications,
                          color: Theme.of(context).colorScheme.primary,
                          size: 35,
                        ),
                        onPressed: () {
                          Get.to(() => NotificationsPage());
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.person,
                          color: Theme.of(context).colorScheme.primary,
                          size: 35,
                        ),
                        onPressed: () {
                          Get.to(() => MyProfilePage());
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text("It's time to challenge your limits.",
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 12.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                     IconsCard(icon: "workout", title: 'Workout', onTap: () { Get.to(() => PresetRoutinesPage()); },),
                    Container(
                      height: 50,
                      width: 2,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                     IconsCard(icon: "record", title: "Progress\nTracking", onTap: () { Get.to(() => WorkoutLogScreen()); },),
                    Container(
                      height: 50,
                      width: 2,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    IconsCard(icon: "nutrition", title: "Nutrition", onTap: () {  },),
                    Container(
                      height: 50,
                      width: 2,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                     IconsCard(icon: "community", title: "Community", onTap: () { Get.to(() => CommunityScreen()); },),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  Text('Recommendation',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onPrimary)),
                  const Spacer(),
                  Text('See All',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.white)),
                  IconButton(
                    icon: const Icon(
                      Icons.navigate_next,
                      color: Color(0xffBADE4F),
                      size: 25,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const RecommendationCard(
                      calories: '120 Kcal',
                      time: '12 Minutes',
                      image: 'assets/images/women_workout.png',
                      title: 'Squat Exercise',
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    const RecommendationCard(
                      calories: '120 Kcal',
                      time: '12 Minutes',
                      image: 'assets/images/women_sitting.png',
                      title: 'Full Body stretching',
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    const RecommendationCard(
                      calories: '120 Kcal',
                      time: '12 Minutes',
                      image: 'assets/images/women_sitting.png',
                      title: 'Full Body stretching',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 180.h,
              width: double.infinity.w,
              color: Theme.of(context).colorScheme.primary,
              child: Center(
                  child: ChallengeCard(
                      title: 'Plank With Hip Twist',
                      image: 'assets/images/plank.jpg')),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text('Articles & Tips',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onPrimary)),
            ),
            const SizedBox(height: 10),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    ArticleCard(
                        title: "15 Quick & Effective Daily Routines.",
                        image: "assets/images/squats.jpg"),
                    SizedBox(
                      width: 12,
                    ),
                    ArticleCard(
                        title: "15 Quick & Effective Daily Routines.",
                        image: "assets/images/squats.jpg"),
                    SizedBox(
                      width: 12,
                    ),
                    ArticleCard(
                        title: "15 Quick & Effective Daily Routines.",
                        image: "assets/images/squats.jpg"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
