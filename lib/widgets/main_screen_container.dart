import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:grk_001/Provider/product.dart';
import 'package:grk_001/Provider/products.dart';
import 'package:grk_001/widgets/main_screen_product_item.dart';

class MainScreenContainer extends StatefulWidget {
  Color color;
   List<Product> loadedproduct;

  MainScreenContainer({this.color, this.loadedproduct});

  @override
  _MainScreenContainerState createState() => _MainScreenContainerState();
}

class _MainScreenContainerState extends State<MainScreenContainer> {
//  bool _isinit = true;
//  void didChangeDependencies() async {
//    // TODO: implement didChangeDependencies
//    if (_isinit) {}
//    _isinit = false;
//    super.didChangeDependencies();
//  }
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    Future.delayed(Duration.zero).then((_) async {
//      await Provider.of<Products>(context, listen: false)
//          .fetchcategoriesproduct();
//    });
//    super.initState();
//  }

  @override
  Widget build(BuildContext context) {
//    final prod =
//        Provider.of<Products>(context, listen: true).MostpopularProduct;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: AspectRatio(
        aspectRatio: 3 / 3,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: GridView.builder(
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                  value: widget.loadedproduct[index],
                  child: Item(
//                    title: loadedproduct[index].title,
//                    id: loadedproduct[index].id,
//                    imageurl: loadedproduct[index].imageUrl
                      ),
                );
              },
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 1,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: widget.loadedproduct.length,
            ),
          ),
          decoration: BoxDecoration(color: widget.color),
        ),
      ),
    );
  }
}
