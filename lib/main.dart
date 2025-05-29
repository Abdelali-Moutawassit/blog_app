// import 'package:blog_app/design/home_design.dart';
import 'package:blog_app/features/PostTest/presentation/screens/home_design.dart';
import 'package:blog_app/features/Messagerie/presentation/screens/messages_screen.dart';
import 'package:blog_app/navigation/custom_bottom_nav_bar.dart';
import 'package:blog_app/pagesFake/create_post_page.dart';
import 'package:blog_app/pagesFake/friends_screen.dart';
import 'package:blog_app/pagesFake/setting_page2.dart';
// import 'package:blog_app/features/Auth/presentation/cubit/login_cubit.dart';
// import 'package:blog_app/features/Auth/presentation/screens/login_screen.dart';
// import 'package:blog_app/features/Post/presentation/screens/home_screen.dart';
// import 'package:blog_app/navigation/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
// import 'utils/constants.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   scaffoldBackgroundColor: kBackgroundColor,
      //   textTheme: Theme.of(
      //     context,
      //   ).textTheme.apply(bodyColor: kPrimaryColor, fontFamily: 'Montserrat'),
      // ),
      // home: BlocProvider(
      //   create: (context) => LoginCubit(),
      //   child: const LoginScreen(),
      // ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeDesign(),
    const FriendsScreen(),
    const CreatePostPage(),
    const MessagesScreen(),
    const SettingPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
