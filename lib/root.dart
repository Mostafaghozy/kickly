import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kickly/core/constants/app_colors.dart';
import 'package:kickly/features/favourite/views/favorite_view.dart';
import 'package:kickly/features/home/views/home_view.dart';
import 'package:kickly/features/profile/views/profile_view.dart';
import 'package:kickly/features/search/views/search_view.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late PageController controller;
  late List<Widget> screens;
  int currentScreen = 0;
  @override
  void initState() {
    controller = PageController(initialPage: currentScreen);
    screens = [HomeView(), SearchView(), FavoriteView(), ProfileView()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        physics: NeverScrollableScrollPhysics(),
        children: screens,
      ),

      bottomNavigationBar: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(color: AppColors.primary),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(size: 25, color: AppColors.primary),

          unselectedIconTheme: const IconThemeData(
            size: 30,
            color: Colors.white70,
          ),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
          currentIndex: currentScreen,
          onTap: (index) {
            setState(() => currentScreen = index);
            controller.jumpToPage(currentScreen);
          },

          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.grey.shade400),
              activeIcon: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.home, color: AppColors.primary),
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search, color: Colors.grey.shade400),
              activeIcon: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(CupertinoIcons.search, color: AppColors.primary),
              ),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border_outlined,
                color: Colors.grey.shade400,
              ),
              activeIcon: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.favorite_border_outlined,
                  color: AppColors.primary,
                ),
              ),
              label: "Favorite",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person, color: Colors.grey.shade400),
              activeIcon: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(CupertinoIcons.person, color: AppColors.primary),
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
