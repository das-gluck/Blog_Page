import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(32),
      ),
      child: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32 , vertical: 24),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 55,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Icon(Icons.home_filled, color: Color(0xFFFFD810),),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(Icons.bookmark_border_outlined),
                  ),
                ],
              ),

              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 55,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Icon(Icons.favorite_outline),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(Icons.person_outline),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
