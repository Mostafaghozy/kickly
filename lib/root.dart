
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class Root extends StatefulWidget {
//   const Root({super.key});

//   @override
//   State<Root> createState() => _RootState();
// }

// class _RootState extends State<Root> {
//   late PageController controller;
//   late List<Widget> screens;
//   int currentScreen = 0;
//   @override
//   void initState() {
//     controller = PageController(initialPage: currentScreen);
//     screens = [HomeView(), CartView(), OrderHistoryView(), ProfileView()];
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: controller,
//         physics: NeverScrollableScrollPhysics(),
//         children: screens,
//       ),

//       bottomNavigationBar: Container(
//         padding: EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           color: AppColors.primary,
//           borderRadius: BorderRadius.only(
//             topRight: Radius.circular(30),
//             topLeft: Radius.circular(30),
//           ),
//         ),
//         child: BottomNavigationBar(
//           elevation: 0,
//           backgroundColor: Colors.transparent,
//           type: BottomNavigationBarType.fixed,
//           selectedItemColor: Colors.white,
//           unselectedItemColor: Colors.grey.shade500.withOpacity(0.7),
//           currentIndex: currentScreen,
//           onTap: (index) {
//             setState(() => currentScreen = index);
//             controller.jumpToPage(currentScreen);
//           },

//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(CupertinoIcons.home),
//               label: "home",
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(CupertinoIcons.cart),
//               label: "Cart",
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.local_restaurant_sharp),
//               label: "Order History",
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(CupertinoIcons.profile_circled),
//               label: "Profile",
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
