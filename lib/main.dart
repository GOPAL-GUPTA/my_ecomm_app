import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grk_001/Provider/Address_data.dart';
import 'package:grk_001/Provider/orders.dart';
import 'package:grk_001/homescreen.dart';
import 'package:grk_001/login.dart';
import 'package:grk_001/screen/addnew_addressscreen.dart';
import 'package:grk_001/screen/addressview_screen.dart';
import 'package:grk_001/screen/cart_screen.dart';
import 'package:grk_001/screen/change_password_screen.dart';
import 'package:grk_001/screen/endrawer_categories_product_screen.dart';
import 'package:grk_001/screen/mycard.dart';
import 'package:grk_001/screen/payment_main_screen.dart';
import 'package:grk_001/screen/payment_screen.dart';
import 'package:grk_001/screen/profile_settings.dart';
import 'package:grk_001/screen/edit_product_screen.dart';
import 'package:grk_001/screen/favourite_screen.dart';
import 'package:grk_001/screen/order_screen.dart';
import 'package:grk_001/screen/product_details_screen.dart';
import 'package:grk_001/screen/product_overview_screen.dart';
import 'package:grk_001/screen/profile.dart';
import 'package:grk_001/screen/ratingus_screen.dart';
import 'package:grk_001/screen/track_order.dart';
import 'package:grk_001/screen/user_product_screen.dart';
import 'package:grk_001/signup_screen.dart';
import 'package:provider/provider.dart';
import 'package:grk_001/Provider/products.dart';
import 'package:grk_001/Provider/cart.dart';
import 'package:grk_001/Provider/Auth.dart';
import 'package:grk_001/screen/mycard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
            create: (_) => Products(null),
            update: (ctx, auth, previousproduct) => Products(auth.userid)
//              previousproduct == null ? [] : previousproduct.items),
            ),
        ChangeNotifierProxyProvider<Auth, AddressData>(
//          create: (context) => AddressData(null,[]),
          update: (Context, auth, previousAddresses) => AddressData(auth.userid,
              previousAddresses == null ? [] : previousAddresses.Addresses),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
//          create: (context) => Orders(null, []),
          update: (ctx, auth, previousorders) => Orders(
              auth.userid, previousorders == null ? [] : previousorders.orders),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          buttonTheme: ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
            splashColor: Color(0XFFFF4081),
            minWidth: 200.0,
            buttonColor: Color(0XFFFF4081),
          ),
          primaryColor: Color(0XFFFF4081),
          scaffoldBackgroundColor: Colors.white,
//          Color(0XFFFFF2E1),
          textTheme: TextTheme(
            bodyText1: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ),
            subtitle1: TextStyle(
              fontSize: 20.0,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.onAuthStateChanged,
          builder: (context, usersnapshot) {
            if (usersnapshot.hasData) {
              return HomeScreen();
            }
            return LogIn();
          },
        ),
        routes: {
          LogIn.routename: (context) => LogIn(),
          SignupScreen.routename: (context) => SignupScreen(),
          HomeScreen.routename: (context) => HomeScreen(),
          MyProfile.routename: (context) => MyProfile(),
          AddNewAddreesScreen.routename: (context) => AddNewAddreesScreen(),
          AddressView.routename: (context) => AddressView(),
          ProductScreen.routename: (context) => ProductScreen(),
          ProductDetails.routename: (context) => ProductDetails(),
          FavouriteScreen.routename: (context) => FavouriteScreen(),
          CartScreen.routename: (context) => CartScreen(),
          OrderScreen.routename: (context) => OrderScreen(),
          UserProduct.routename: (context) => UserProduct(),
          EditProductScreen.routename: (context) => EditProductScreen(),
          RateUs.routename: (context) => RateUs(),
          Settings.routename: (context) => Settings(),
          ChangePassword.routename: (context) => ChangePassword(),
          NewPage.routename: (context) => NewPage(),
          MyCard.routename: (context) => MyCard(),
          PaytmPayment.routename: (context) => PaytmPayment(),
          Trackorder.routename: (context) => Trackorder(),
        },
      ),
    );
  }
}
