import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Controllers/Provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return Container(
      height: h,
      width: w,
      decoration: BoxDecoration(
        image: (Provider.of<ThemeProvider>(context).isdark)
            ? DecorationImage(
                image: AssetImage("assets/images/bgGalaxy.png"),
                fit: BoxFit.cover,
              )
            : DecorationImage(
                image: AssetImage("assets/images/bgWhite.jpg"),
                fit: BoxFit.cover,
              ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Setting",
                  style: TextStyle(
                    fontSize: h * 0.035,
                    fontWeight: FontWeight.bold,
                    color: (Provider.of<ThemeProvider>(context).isdark)
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h * 0.025,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0xff464646),
                child: Icon(Icons.dark_mode),
              ),
              title: Text(
                "Dark Mode",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: (Provider.of<ThemeProvider>(context).isdark)
                      ? Colors.white
                      : Colors.black,
                ),
              ),
              trailing: Switch(
                value: Provider.of<ThemeProvider>(context).isdark,
                onChanged: (val) {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .Themechanger();
                },
              ),
            ),
            SizedBox(
              height: h * 0.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Created by J.B.",
                  style: TextStyle(
                    color: (Provider.of<ThemeProvider>(context).isdark)
                        ? Colors.white
                        : Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
