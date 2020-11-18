import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grk_001/CustomIcon/my_flutter_app_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grk_001/screen/addressview_screen.dart';
import 'package:grk_001/screen/mycard.dart';
import 'package:grk_001/screen/profile_settings.dart';
import 'package:grk_001/screen/order_screen.dart';
import 'package:grk_001/screen/profile.dart';
import 'package:grk_001/login.dart';
import 'package:grk_001/screen/favourite_screen.dart';
import 'package:grk_001/screen/user_product_screen.dart';
import 'package:provider/provider.dart';
import 'package:grk_001/Provider/Auth.dart';
import 'package:grk_001/screen/ratingus_screen.dart';

class DrawerItem extends StatefulWidget {
  final Size devicesize;
  final BuildContext context;

  DrawerItem(this.devicesize, this.context);
  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<DrawerItem> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser Loggedinuser;
  Auth aboutusBlock;

////  var _isinit = true;
//  void didChangeDependencies() {
//    if (_isinit) {
//      super.didChangeDependencies();
//      final aboutusBlock = Provider.of<Auth>(context);
//      if (this.aboutusBlock != aboutusBlock)
//      {
//        this.aboutusBlock = aboutusBlock;
//        Future.microtask(() {
//          aboutusBlock.getcurrentuser();
//        });
//      }
//    }
//    _isinit = false;
//    super.didChangeDependencies();
//  }

  @override
  Widget build(BuildContext context) {
    Loggedinuser = Provider.of<Auth>(context, listen: true).Loggedinuser;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: widget.devicesize.height * 0.20,
            color: Color(0XFFFF4081),
            child: DrawerHeader(
              margin: EdgeInsets.zero,
              padding: const EdgeInsets.only(left: 20.0),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 40.0,
                    ),
//                    Icon(
//                      Icons.home,
//                      color: Colors.white,
//                      size: 30.0,
//                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      'Name',
                      softWrap: true,
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          TileList(
            onpressed: () {
              Navigator.of(context)
                  .pushNamed(MyProfile.routename, arguments: Loggedinuser);
            },
            icon: Icon(
              FontAwesomeIcons.user,
              color: Colors.black54,
            ),
            texttitle: 'My Profile',
          ),
          TileList(
              onpressed: () {
                Navigator.pushNamed(context, OrderScreen.routename);
              },
              icon: Icon(
                FontAwesomeIcons.shoppingBag,
                color: Colors.black54,
              ),
              texttitle: 'My Order'),
          TileList(
              onpressed: () {
                Navigator.pushNamed(context, UserProduct.routename);
              },
              icon: Icon(
                FontAwesomeIcons.edit,
                color: Colors.black54,
              ),
              texttitle: 'Manage Product'),
          TileList(
              onpressed: () {
                Navigator.pushNamed(context, FavouriteScreen.routename);
              },
              icon: Icon(
                FontAwesomeIcons.heart,
                color: Colors.black54,
              ),
              texttitle: 'My Wish List'),
          TileList(
              onpressed: () {
                Navigator.pushNamed(context, AddressView.routename);
              },
              icon: Icon(
                Icons.location_on,
                color: Colors.black54,
              ),
              texttitle: 'My Addresses'),
          TileList(
            onpressed: () {},
            icon: Icon(
              Icons.notifications,
              color: Colors.black54,
            ),
            texttitle: 'My notifications',
          ),
          TileList(
            onpressed: () {},
            icon: Icon(
              MyFlutterApp.ticket,
              color: Colors.black54,
            ),
            texttitle: 'My Coupons',
          ),
          TileList(
            onpressed: () {
              Navigator.pushNamed(context, MyCard.routename);
            },
            icon: Icon(
              Icons.payment,
              color: Colors.black54,
            ),
            texttitle: 'My Cards',
          ),
          TileList(
            onpressed: () {},
            icon: Icon(
              FontAwesomeIcons.handsHelping,
              color: Colors.black54,
            ),
            texttitle: 'Contact Us',
          ),
          TileList(
            onpressed: () {
              Navigator.of(context).pushNamed(Settings.routename);
            },
            icon: Icon(
              FontAwesomeIcons.cog,
              color: Colors.black54,
            ),
            texttitle: 'Settings',
          ),
          TileList(
            onpressed: () {},
            icon: Icon(
              Icons.help_outline,
              color: Colors.black54,
            ),
            texttitle: 'Helps & FAQs',
          ),
          SizedBox(
            height: 100.0,
          ),
          Divider(
            thickness: 2.0,
          ),
          TileList(
            onpressed: () {},
            icon: Icon(
              Icons.share,
              color: Colors.black54,
            ),
            texttitle: 'Refer & Earn',
          ),
          TileList(
            onpressed: () {
              Navigator.pushNamed(context, RateUs.routename,
                  arguments: Loggedinuser);
            },
            icon: Icon(
              Icons.star_border,
              color: Colors.black54,
            ),
            texttitle: 'Rate us',
          ),
          TileList(
            onpressed: () {
              setState(() {
                _auth.currentUser();
                _auth.signOut();
              });
              Navigator.of(context).pushNamed(LogIn.routename);
            },
            icon: Icon(
              MyFlutterApp.logout,
              color: Colors.black54,
            ),
            texttitle: 'Log out',
          )
        ],
      ),
    );
  }
}

class TileList extends StatelessWidget {
  TileList({this.texttitle, this.icon, this.onpressed});
  final String texttitle;
  final Icon icon;
  final Function onpressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      splashColor: Theme.of(context).primaryColor,
      child: ListTile(
        contentPadding: const EdgeInsets.only(
          left: 20.0,
        ),
        title: Row(
          children: <Widget>[
            icon,
            SizedBox(
              width: 20.0,
            ),
            Text(
              texttitle,
              style: TextStyle(fontSize: 20.0, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
