import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kwik_mart/home.dart';
import 'package:kwik_mart/login/constants/controllers.dart';

import 'package:velocity_x/velocity_x.dart';



class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const imageUrl ="https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
    return Drawer(
      child: Container(
        color: const Color.fromARGB(255, 67, 91, 104),
        child: ListView(
          padding:const  EdgeInsets.only(top: 10.0),
          children: [
            const DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 67, 91, 104)),
                margin: EdgeInsets.zero,
                accountName:  Text("NeelJung"),
                accountEmail:  Text("Njungbashnet@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                  backgroundColor: Colors.white,
                ),
              ),
            ).p8(),
            Expanded(
              child: VxArc(
                  height: 18.0,
                  edge: VxEdge.TOP,
                  arcType: VxArcType.CONVEY,
                  child: Container(
                    decoration:const  BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 255, 139, 6),
                          Color.fromARGB(255, 132, 146, 9),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    // color: Colors.orange,
                    height: context.screenHeight,
                    child: Column(
                      children: [
                       const  Padding(padding: EdgeInsets.only(top: 25)),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                            );
                          },
                          child: const ListTile(
                            leading: Icon(
                              CupertinoIcons.house,
                              color: Colors.black87,
                              size: 30,
                            ),
                            title: Text("Home",
                                textScaleFactor: 1.3,
                                style: TextStyle(
                                  color: Colors.black,
                                )),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const ListTile(
                            leading: Icon(
                              CupertinoIcons.person,
                              color: Color.fromARGB(166, 88, 17, 12),
                              size: 30,
                            ),
                            title: Text(
                              "Profile",
                              textScaleFactor: 1.3,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                       
                        const  ListTile(
                          leading: Icon(
                            Icons.shopping_bag_outlined,
                            color: Color.fromARGB(221, 31, 24, 24),
                            size: 30,
                          ),
                          title: Text(
                            "Order History",
                            textScaleFactor: 1.3,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const ListTile(
                          leading: Icon(
                            CupertinoIcons.question_circle,
                            color: Color.fromARGB(255, 45, 14, 85),
                            size: 30,
                          ),
                          title: Text(
                            "FAQ",
                            textScaleFactor: 1.3,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                             userController.signOut();

                          },
                          child: const ListTile(
                            leading: Icon(
                              CupertinoIcons.lock,
                              color: Color.fromARGB(255, 47, 158, 25),
                              size: 30,
                            ),
                            title: Text(
                              "Logout",
                              textScaleFactor: 1.3,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}