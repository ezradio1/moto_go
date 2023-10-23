import 'package:flutter/material.dart';
import 'package:moto_go/constants/colors.dart';
import 'package:moto_go/view/home.dart';
import 'package:moto_go/view/profile.dart';
import 'package:moto_go/view/transaction.dart';
import 'package:moto_go/view/wishlist.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _selectedIndex = 0;

  void onNavbarClicked(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final listPage = <Widget>[
      const Home(),
      const Transaction(),
      const Whislist(),
      const Profile()
    ];

    final bottomNavbarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Home'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.assignment), label: 'Transaction'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.favorite), label: 'Wishlist'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.supervised_user_circle), label: 'Profile'),
    ];

    final bottomNavbar = BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      items: bottomNavbarItems,
      currentIndex: _selectedIndex,
      unselectedItemColor: Colors.black26,
      selectedItemColor: ColorConstants.primary,
      onTap: onNavbarClicked,
    );
    return Scaffold(
      body: Center(
        child: listPage[_selectedIndex],
      ),
      bottomNavigationBar: bottomNavbar,
    );
  }
}
