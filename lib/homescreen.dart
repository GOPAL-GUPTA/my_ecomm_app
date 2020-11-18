import 'package:flutter/material.dart';
import 'package:grk_001/screen/main_screen.dart';
import 'package:grk_001/widgets/entry_item.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:grk_001/screen/favourite_screen.dart';
import 'package:grk_001/Provider/Auth.dart';
import 'package:provider/provider.dart';
import 'package:grk_001/Provider/cart.dart';
import 'package:grk_001/widgets/badge.dart';
import 'package:grk_001/screen/cart_screen.dart';
import 'package:grk_001/widgets/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grk_001/widgets/search.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:grk_001/models/main_screen_categories_entry.dart';

class HomeScreen extends StatefulWidget {
  static const String routename = 'homescreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  FirebaseUser Loggedinuser;
  @override
  void initState() {
    // TODO: implement initState
    final fbm = FirebaseMessaging();
    fbm.configure(
      onMessage: (msg) {
        print(msg);
        return;
      },
      onLaunch: (msg) {
        print(msg);
        return;
      },
      onResume: (msg) {
        print(msg);
        return;
      },
    );
    Future.delayed(Duration.zero).then((_) async {
      await Provider.of<Auth>(context, listen: false).getcurrentuser();
    });
    super.initState();
  }

//  @override
//  void didChangeDependencies() {
//    // TODO: implement didChangeDependencies
//
//    super.didChangeDependencies();
//  }
  @override
  Widget build(BuildContext context) {
    final devicesize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldkey,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              _scaffoldkey.currentState.openDrawer();
            },
            icon: Icon(
              Icons.list,
              color: Colors.white,
              size: 35.0,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        showSearch(context: context, delegate: DataSearch());
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _scaffoldkey.currentState.openEndDrawer();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Text(
                          'Categories',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          title: Text('HomeScreen'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                FontAwesomeIcons.heart,
                size: 30.0,
              ),
              tooltip: 'My Wish List',
              onPressed: () {
                Navigator.pushNamed(context, FavouriteScreen.routename);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.notifications,
                size: 30.0,
              ),
              tooltip: 'My Notifications',
              onPressed: () {},
            ),
            Consumer<Cart>(
              builder: (_, cartdata, ch) => Badge(
                child: ch,
                value: cartdata.itemcount.toString(),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, CartScreen.routename);
                },
                icon: Icon(
                  Icons.shopping_cart,
                  size: 40.0,
                ),
              ),
            ),
          ],
        ),
        body: MainScreen(),
//        body: CategoryScreen(),
        endDrawer: Drawer(
          child: Column(
            children: <Widget>[
              Container(
                color: Color(0XFFFF4081),
                height: devicesize.height * 0.10,
                child: DrawerHeader(
                    margin: EdgeInsets.zero,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.apps,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'Categories',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                        ],
                      ),
                    )
//                  child: Text('Categories'),
                    ),
              ),
              Container(
                height: devicesize.height * 0.85,
                child: ListView.builder(
                  itemBuilder: (context, index) => EntryItem(data[index]),
                  itemCount: data.length,
                ),
              )
            ],
          ),
        ),
        drawer: Container(
          width: devicesize.width * 0.65,
          child: DrawerItem(devicesize, context),
        ),
      ),
    );
  }
}
