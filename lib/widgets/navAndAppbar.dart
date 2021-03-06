import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';

import '../consts.dart';

//////////////////////////////////////////////////////////////////////* bottomNav bar
class MyBottomNavigationBar extends StatelessWidget {
  MyBottomNavigationBar({required this.function, this.oldValue, this.newvalue});
  final Function function;
  final int? oldValue;
  final int? newvalue;
  // @override
  // _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
// }

// class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  // var selectedindex = 0;

  // void _onItemTapped(int index) {
  //   setState(() {
  //     selectedindex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // return Consumer<ProviderModel>(builder: (context, vals, child) {
    return SizedBox(
      height: 70,
      child: BottomNavigationBar(
        // fixedColor: Colors.red,
        selectedLabelStyle: priceFontStyle,
        type: BottomNavigationBarType.fixed,
        currentIndex: newvalue ?? 1,
        selectedItemColor: Colors.blueGrey[900],
        onTap: (e) => function(e),

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.home_outline),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Categories',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.search_5),
            label: 'Search',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.user_outline),
            label: 'Profile',
            backgroundColor: Colors.pink,
          ),
        ],
      ),
    );
    // });
  }
}

////////////////////////////////// *Appbar
