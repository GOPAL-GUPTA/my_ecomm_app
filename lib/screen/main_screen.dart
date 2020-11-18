import 'package:flutter/material.dart';
import 'package:grk_001/widgets/main_screen_container.dart';
import 'package:grk_001/Provider/products.dart';
import 'package:grk_001/widgets/main_screen_container_item.dart';

import 'package:provider/provider.dart';

import 'package:grk_001/Provider/Auth.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:firebase_storage/firebase_storage.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Products aboutusBlock;
  Auth loader;
  @override
  void didChangeDependencies() {
    final aboutusBlock = Provider.of<Products>(context);
//    final loader = Provider.of<Auth>(context);
    if (this.aboutusBlock != aboutusBlock || this.loader != loader) {
      this.aboutusBlock = aboutusBlock;
      this.loader = loader;
      Future.microtask(() async {
        {
          await aboutusBlock.fetchandsetproduct();
          await aboutusBlock.fetchcategoriesproduct();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget image_carousel = Container(
      height: 200.0,
      child: Carousel(
        images: [
          Image.network(
              'https://5.imimg.com/data5/PQ/KY/MY-37987079/cello-butterflow-pen-pack-of-5-700x700-500x500.jpg'),
          Image.network(
              'https://www.bing.com/th/id/OIP.EpRncXLkrMe8oURqzDfEtwAAAA?pid=Api&rs=1'),
          Image.network(
              'https://www.offimart.com/8271-large_default/linc-pentonic-ball-pen-blue-pack-of-10.jpg'),
          Image.network(
              'https://www.bing.com/th/id/OIP.9I36Bkwd_nTiBj7iija8_wHaHa?pid=Api&rs=1'),
          Image.network(
              'https://th.bing.com/th/id/OIP.1CsGeffEyVCOby7eDnJsxAAAAA?pid=Api&rs=1'),
        ],
        dotIncreasedColor: Colors.black,
        dotColor: Colors.black,
        autoplay: true,
        indicatorBgPadding: 5.0,
        dotSize: 5.0,
        dotSpacing: 30.0,
        dotBgColor: Colors.transparent,
        borderRadius: true,
        noRadiusForIndicator: false,
      ),
    );
    final paa = Provider.of<Products>(context, listen: true).MostpopularProduct;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(children: <Widget>[
        image_carousel,
        SizedBox(
          height: 10.0,
        ),
        Titletext('Most Popular In India'),
        SizedBox(
          height: 10.0,
        ),
        MainScreendivider(),
        MainScreenContainer(
          loadedproduct: paa,
          color: Colors.yellow.withOpacity(0.5),
        ),
        Titletext('Top Trending In India'),
        SizedBox(
          height: 10.0,
        ),
        MainScreendivider(),
        MainScreenContainer(
          loadedproduct: paa,
          color: Colors.pink.withOpacity(0.5),
        ),
        SizedBox(
          height: 10.0,
        ),
        Titletext('Newest'),
        SizedBox(
          height: 10.0,
        ),
        MainScreendivider(),
        MainScreenHoerizontalItem(),
        Titletext('Sale'),
        SizedBox(
          height: 10.0,
        ),
        MainScreendivider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: AspectRatio(
            aspectRatio: 3 / 3,
            child: Container(
              color: Colors.green,
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 5.0, right: 5.0),
                child: Container(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Titletext('Essential'),
        MainScreenHoerizontalItem(),
        Titletext('Ofiice Stationary'),
        SizedBox(
          height: 10.0,
        ),
        MainScreendivider(),
        Boxibox(),
        Titletext('Office Accessories'),
        SizedBox(
          height: 10.0,
        ),
        MainScreendivider(),
        MainScreenHoerizontalItem(),
        Titletext("kid's Zone"),
        MainScreendivider(),
        MainScreenContainer(
          loadedproduct: paa,
          color: Colors.deepOrange.withOpacity(0.5),
        ),
        Titletext("Student's Zone"),
        MainScreendivider(),
        MainScreenContainer(
          color: Colors.yellow.withOpacity(0.5),
          loadedproduct: paa,
        ),
        Titletext('Scientific Calculator'),
        MainScreendivider(),
        MainScreenHoerizontalItem(),
        Titletext('Engineering Instruments'),
        SizedBox(
          height: 10.0,
        ),
        MainScreendivider(),
        Boxibox(),
      ]),
    );
  }
}

class Boxibox extends StatelessWidget {
  const Boxibox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: AspectRatio(
        aspectRatio: 3 / 4,
        child: Container(
          color: Colors.green.withOpacity(0.5),
          child: Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) => HomescreenItems(),
              itemCount: 5,
            ),
          ),
        ),
      ),
    );
  }
}

class MainScreenHoerizontalItem extends StatelessWidget {
  const MainScreenHoerizontalItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: AspectRatio(
        aspectRatio: 3 / 2,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) => HomescreenItems(),
          itemCount: 5,
        ),
      ),
    );
  }
}

class MainScreendivider extends StatelessWidget {
  const MainScreendivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Divider(
            color: Colors.orange,
            thickness: 5,
          ),
        ),
        SizedBox(
          width: 50.0,
        ),
        Expanded(
          child: Divider(
            color: Colors.green,
            thickness: 5,
          ),
        ),
      ],
    );
  }
}

class Titletext extends StatelessWidget {
  final String title;

  Titletext(this.title);
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 25.0, fontFamily: 'Raleway', fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }
}
