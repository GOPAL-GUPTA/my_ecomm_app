import 'package:flutter/material.dart';
import 'package:grk_001/Provider/products.dart';
import 'package:grk_001/screen/edit_product_screen.dart';
import 'package:grk_001/widgets/drawer.dart';
import 'package:grk_001/widgets/user_Product_Item.dart';
import 'package:provider/provider.dart';

class UserProduct extends StatelessWidget {
  static const String routename = 'ManageProduct';
  Future<void> fetchdata(BuildContext context) async {
    await Provider.of<Products>(context, listen: false).fetchandsetproduct();
  }

  @override
  Widget build(BuildContext context) {
    final devicesize = MediaQuery.of(context).size;
    final productsdata = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Product'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, EditProductScreen.routename);
            },
            icon: Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      drawer: Container(
        width: devicesize.width * 0.65,
        child: DrawerItem(devicesize, context),
      ),
      body: RefreshIndicator(
        onRefresh: () => fetchdata(context),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView.builder(
            itemBuilder: (context, i) => Column(
              children: <Widget>[
                UserProductItem(
                    id: productsdata.items[i].id,
                    title: productsdata.items[i].title,
                    imageUrl: productsdata.items[i].imageUrl),
                Divider(
                  thickness: 1.0,
                ),
              ],
            ),
            itemCount: productsdata.items.length,
          ),
        ),
      ),
    );
  }
}
