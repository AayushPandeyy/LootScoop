import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 2,
      width: MediaQuery.sizeOf(context).width,
      backgroundColor: Colors.black.withOpacity(0.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DrawerTile(Icons.home, () {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => const ProfileScreen()));
          }, "Home"),
          DrawerTile(Icons.phone, () {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => const ProfileScreen()));
          }, "Platforms"),
          DrawerTile(Icons.close, () {
            Navigator.pop(context);
          }, "Close"),
        ],
      ),
    );
  }

  Widget DrawerTile(IconData icon, VoidCallback onPressed, String title) {
    return Column(
      children: [
        Container(
          height: 60,
          // color: Colors.white,
          child: GestureDetector(
            onTap: () {
              onPressed();
            },
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        fontFamily: "SpaceGrotesk",
                        fontSize: 30,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
