import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:provider/provider.dart';

import '../../Controllers/Provider.dart';
import '../../utills/Attributes.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    CurrentIndex_Provider currentIndex_ProviderTrue = Provider.of(context);
    CurrentIndex_Provider currentIndex_ProviderFalse =
        Provider.of(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff01203f),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SalomonBottomBar(
            backgroundColor: Color(0xff01203f),
            selectedItemColor: Color(0xff7623dc),
            currentIndex: currentIndex_ProviderTrue.c1.current_index,
            onTap: (i) {
              currentIndex_ProviderFalse.changeCurrentIndex(i);
            },
            unselectedItemColor: Colors.white38,
            items: [
              SalomonBottomBarItem(
                icon: Icon(Icons.favorite_border),
                title: Text("Favorite"),
                selectedColor: Colors.red,
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.home_filled),
                title: Text("Home"),
                selectedColor: Colors.white,
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.settings),
                title: Text("Settings"),
                selectedColor: Colors.yellow,
              ),
            ],
          ),
        ),
        body: Pages[currentIndex_ProviderTrue.c1.current_index],
      ),
    );
  }
}
