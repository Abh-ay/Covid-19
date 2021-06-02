import 'package:covid19/Page/DashBoard.dart';
import 'package:covid19/Page/IndGovt.dart';
import 'package:covid19/Page/News&Media.dart';
import 'package:covid19/Page/Symptoms.dart';
import 'package:covid19/Page/Terms&Cond.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
 
int selected=2;
GlobalKey _bottomnavi=GlobalKey();
   List _widgetOptions=[
     NewsMedia(),
     Symptoms(),
     DashBoard(),
     IndGovt(),
     TermsCond(),
   ];
   
@override
 Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar(title:Text('HomeView')),
       bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemBorderColor: Colors.lime,
          selectedItemBackgroundColor: Colors.indigo[900],
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.indigo[900],
        ),
        selectedIndex: selected,
        onSelectTab: (index) {
          setState(() {
            selected = index;
          });
        },
        items:  [
        FFNavigationBarItem(
            iconData: Icons.list,
            label: 'News',
          ),
          FFNavigationBarItem(
            iconData: Icons.health_and_safety,
            label: 'Symptoms',
          ),
          FFNavigationBarItem(
            iconData: Icons.dashboard_outlined,
            label: 'Cases',
          ),
          FFNavigationBarItem(
            iconData: Icons.rule_sharp,
            label: 'IndGovt.',
          ),
          FFNavigationBarItem(
            iconData: Icons.info_outline,
            label: 'T & C',
          ),
        
        ],    
       
      ),
     body:Center(
       child:_widgetOptions.elementAt(selected)
     )
      
    );
  }
}