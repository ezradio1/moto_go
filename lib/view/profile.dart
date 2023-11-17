import 'package:flutter/material.dart';
import 'package:moto_go/constants/colors.dart';
import 'package:moto_go/constants/storage_key.dart';
import 'package:moto_go/models/menu.dart';
import 'package:moto_go/utils/shared_preference.dart';
import 'package:moto_go/view/login.dart';
import 'package:moto_go/widget/custom_container.dart';
import 'package:moto_go/widget/dialog_coming_soon.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  void showComingSoon(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const DialogComingSoon();
        });
  }

  @override
  Widget build(BuildContext context) {
    List<Menu> menu_1 = [
      Menu(Icons.people, 'Change Profile Information', () {
        showComingSoon(context);
      }),
      Menu(Icons.settings, 'Setting', () {
        showComingSoon(context);
      }),
      Menu(Icons.camera_enhance, 'ID Verification', () {
        showComingSoon(context);
      })
    ];
    List<Menu> menu_2 = [
      Menu(Icons.headset_mic, 'Help Center', () {
        showComingSoon(context);
      }),
      Menu(Icons.lock, 'Privacy Policy', () {
        showComingSoon(context);
      }),
    ];
    List<Menu> menu_3 = [
      Menu(Icons.logout, 'Log Out', () {
        removeData(isLogin);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Login()));
      }),
    ];
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: AppBar(
            backgroundColor: ColorConstants.primary,
            elevation: 0,
          ),
        ),
        body: Column(
          children: [
            Stack(
              children: [
                Positioned(
                    child: Container(
                  height: 128,
                  color: ColorConstants.primary,
                )),
                Positioned(
                    child: Container(
                  height: 180,
                )),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        child: ClipOval(
                            child: Image.asset(
                          'images/photo_profile.jpeg',
                          width: 120,
                        )),
                      ),
                    )),
              ],
            ),
            CustomContainer(
              child: Column(
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "Ezra Audivano Dirfa",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const Text(
                    "ezraaudivano@gmail.com | +623476343748723",
                    style: TextStyle(fontSize: 12, color: Colors.black45),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  MenuContainer(
                    items: menu_1,
                  ),
                  MenuContainer(
                    items: menu_2,
                  ),
                  MenuContainer(
                    items: menu_3,
                    color: Colors.red,
                    isLast: true,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class MenuContainer extends StatelessWidget {
  final List<Menu> items;
  final Color color;
  final bool isLast;
  const MenuContainer(
      {super.key,
      required this.items,
      this.color = Colors.black,
      this.isLast = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border(
              top: const BorderSide(width: 0.5, color: Colors.black26),
              bottom:
                  BorderSide(width: isLast ? 0.5 : 0, color: Colors.black26)),
        ),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) => MenuItem(
                  icon: items[index].icon,
                  label: items[index].title,
                  color: color,
                  onTap: () {
                    items[index].onClick();
                  },
                )));
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final Function onTap;
  const MenuItem(
      {super.key,
      required this.icon,
      required this.label,
      required this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color,
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              label,
              style: TextStyle(color: color, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
