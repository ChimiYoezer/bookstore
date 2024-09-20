import 'package:bookstore/page/fifthpage.dart';
import 'package:bookstore/page/homepage.dart';
import 'package:bookstore/page/profile.dart';
import 'package:bookstore/page/secondpage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
class bottomnavbar extends StatefulWidget {
  const bottomnavbar({super.key});

  @override
  State<bottomnavbar> createState() => _bottomnavbarState();
}

class _bottomnavbarState extends State<bottomnavbar> {
  List list = [
    homepage(),
    bookmarkpage(),
    CartPage(),
    profile(),
  ];
  List<Icon> allItems = [
    Icon(Icons.home,size: 30,),
    Icon(Icons.bookmark_added,size: 30,),
    Icon(Icons.shopping_cart_outlined,size: 30),
    Icon(Icons.perm_identity_outlined,size: 30),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFe6ccb2),
      body: list[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Color(0XFFe6ccb2),
          index: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: allItems,
        color:    Color(0XFFd4a276),

         // Add this line
      ),
    );
  }
}
