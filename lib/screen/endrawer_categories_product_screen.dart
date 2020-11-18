import 'package:flutter/material.dart';
import 'package:grk_001/Provider/products.dart';
import 'package:provider/provider.dart';
import 'package:grk_001/Provider/product.dart';
import 'package:grk_001/widgets/product_items.dart';

class NewPage extends StatefulWidget {
  static const String routename = 'newpage';

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  List<Product> displayproductitems;
  List<String> p;
  String title;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final routeargs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categporieid = routeargs['id'];
    title = routeargs['title'];
    final displayproduct = Provider.of<Products>(context).items;

    displayproductitems = displayproduct.where((product) {
      return product.categories.contains(categporieid);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, i) {
          return ChangeNotifierProvider.value(
            value: displayproductitems[i],
            child: ProductItems(),
          );
        },
        itemCount: displayproductitems.length,
      ),
    );
  }
}
