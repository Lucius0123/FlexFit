import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:pose_detection_realtime/profile_pages/my_profile.dart';
import 'A part/controllers/app_controller.dart';
import 'A part/controllers/auth_controller.dart';
import 'A part/controllers/daily_challenge_controller.dart';
import 'A part/controllers/leaderboard_controller.dart';
import 'A part/controllers/user_controller.dart';
import 'A part/controllers/workout_controller.dart';
import 'A part/screens/daily_challenge_screen.dart';
import 'A part/screens/leaderboard_screen.dart';
import 'A part/screens/workout_categories_screen.dart';
import 'A part/screens/workout_detail_screen.dart';
import 'A part/widgets/daily_challenge_card.dart';
import 'A part/widgets/leaderboard_card.dart';
import 'A part/widgets/progress_tracker.dart';
import 'Notification/notification_screen.dart';
import 'bottom_bar.dart';
import 'components/Home_page_Cards/ChallengeCard.dart';
import 'components/Home_page_Cards/RecommendationCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    WorkoutCategoriesScreen(),
    LeaderboardScreen(),
    MyProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final appController = Get.find<AppController>();
  final authController = Get.find<AuthController>();
  final userController = Get.find<UserController>();
  final workoutController = Get.find<WorkoutController>();
  final leaderboardController = Get.find<LeaderboardController>();
 final dailyChallengeController = Get.find<DailyChallengeController>();
  final ScrollController _scrollController = ScrollController();
  bool _isRefreshing = false;

  @override
  void initState() {
    super.initState();
    _checkWeeklyReset();
    _scrollController.addListener(_onScroll);

  }

  void _checkWeeklyReset() {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));

    // If today is the first day of the week and we haven't reset yet
    if (now.day == startOfWeek.day && now.month == startOfWeek.month) {
      // Check if we need to reset (e.g., by checking a flag in shared preferences)
      // For now, we'll just reset if the weekly workout days is empty
      if (appController.weeklyWorkoutDays.isEmpty) {
        appController.resetWeeklyProgress();
      }
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 100) {
      if (!_isRefreshing) {
        _isRefreshing = true;
        _refreshData().then((_) {
          _isRefreshing = false;
        });
      }
    }
  }
  Future<void> _refreshData() async {
    final uid = authController.firebaseUser.value?.uid;
    if (uid != null) {
      await authController.fetchUserData(uid);
    }
    await workoutController.fetchWorkouts();
    await leaderboardController.fetchTopUsers();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hour = DateTime.now().hour;
    String greeting;
    if (hour < 12) {
      greeting = 'Good Morning';
    } else if (hour < 17) {
      greeting = 'Good Afternoon';
    } else {
      greeting = 'Good Evening';
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Obx(()=>LiquidPullToRefresh(
        color: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.primary,
        showChildOpacityTransition: false,
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.only(top: 12, left: 16, right: 4),
                child: Obx(() {
                  final user = userController.currentUser.value;
                  if (user == null) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$greeting, ${user.name}!',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: Theme.of(context).colorScheme.primary),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.notifications,
                              color: Theme.of(context).colorScheme.primary,
                              size: 23.sp,
                            ),
                            onPressed: () {
                              Get.to(() => NotificationsPage());
                            },
                          ),
                        ],
                      )
                    ],
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  "It's time to challenge your limits.",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: 20),

              /// Progress Tracker
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ProgressTracker(
                  streak: appController.dailyStreak.value,
                  caloriesBurned: appController.caloriesBurned.value,
                  weeklyGoalProgress: appController.weeklyGoalProgress.value,
                ),
              ),
              const SizedBox(height: 20),

              /// Recommendations
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'Recommendation',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 160.h,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  scrollDirection: Axis.horizontal,
                  itemCount: workoutController.getRecommendedWorkouts().length,
                  itemBuilder: (context, index) {
                    final workout = workoutController.getRecommendedWorkouts()[index];
                    return RecommendationCard(
                      workout: workout,
                      onTap: () {
                        Get.to(() => WorkoutDetailScreen(workout: workout));
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),

              /// Challenge Card
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'Challenges',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.w),
                width: double.infinity.w,
                color: Theme.of(context).colorScheme.primary,
                child: Center(
                  child:GestureDetector(
                    onTap: () {
                      Get.to(() => const DailyChallengeScreen());
                    },
                    child: const DailyChallengeCard(),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              /// Leaderboard
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Leaderboard',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(() => const LeaderboardScreen());
                      },
                      child: Text(
                        'See All',
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),

              /// Leaderboard Preview
              LeaderboardCard(
                users: Get.find<LeaderboardController>().globalUsers.take(3).toList(),
                onTap: () {
                  Get.to(() => const LeaderboardScreen());
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),)
      ,
    );
  }
}

