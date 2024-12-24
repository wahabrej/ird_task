// import 'package:flutter/material.dart';
// import 'package:ird_task/features/home/presentation/screen/home_screen.dart';
// import 'package:kf_drawer/kf_drawer.dart';

// class MainPage extends StatefulWidget {
//   MainPage({Key? key}) : super(key: key);

//   @override
//   _MainPageState createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
//   late KFDrawerController _drawerController;

//   @override
//   void initState() {
//     super.initState();
//     _drawerController = KFDrawerController(
//       initialPage: HomeScreen(),
//       items: [
//         KFDrawerItem.initWithPage(
//           text: Text('Home', style: TextStyle(color: Colors.white)),
//           icon: Icon(Icons.home, color: Colors.white),
//           page: HomeScreen(),
//         ),
//         KFDrawerItem.initWithPage(
//           text: Text('Profile', style: TextStyle(color: Colors.white)),
//           icon: Icon(Icons.person, color: Colors.white),
//           page: HomeScreen(),
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: KFDrawer(
//           borderRadius: 30.0,
//           shadowBorderRadius: 30.0,
//           menuPadding: EdgeInsets.all(5.0),
//           scrollable: true,
//           controller: _drawerController,
//           header: Align(
//             alignment: Alignment.centerLeft,
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 16.0),
//               width: MediaQuery.of(context).size.width * 0.6,
//               child: Image.asset(
//                 'assets/gfg.png',
//                 alignment: Alignment.centerLeft,
//               ),
//             ),
//           ),
//           footer: KFDrawerItem(
//             text: Text(
//               'SIGN IN',
//               style: TextStyle(color: Colors.white),
//             ),
//             icon: Icon(
//               Icons.input,
//               color: Colors.white,
//             ),
//             onPressed: () {
//               // Example: Navigate to sign-in page
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => HomeScreen()),
//               );
//             },
//           ),
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [
//                 Color.fromARGB(255, 114, 234, 106),
//                 Color.fromRGBO(44, 72, 171, 1.0)
//               ],
//               tileMode: TileMode.repeated,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
