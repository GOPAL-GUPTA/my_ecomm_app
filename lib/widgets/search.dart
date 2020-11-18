import 'package:flutter/material.dart';
import 'package:grk_001/Provider/product.dart';
import 'package:grk_001/Provider/products.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:grk_001/widgets/product_items.dart';

class DataSearch extends SearchDelegate<String> {
  List<Product> displayproduct = [];
//  final statelist = [
//    'Andaman and Nicobar Islands',
//    '   Andhra Pradesh',
//    'Arunachal Pradesh',
//    'Assam',
//    'Bihar',
//    'Chandigarh ',
//    'Chhattisgarh',
//    'Dadra and Nagar Havel',
//    'Daman and Diu',
//    'Delhi',
//    'Goa',
//    'Gujrat',
//    'Haryana',
//    'Himachal Pradesh',
//    'Uttar Pradesh',
//    'Uttarakhand',
//    'West Bengal',
//    'Sikkim',
//    'Meghalya',
//    'Mizoram',
//  ];
//  final recentlist = ['Modingar', 'Ghaziabad', 'Merrut', 'Hapur', 'Delhi'];

  @override
  List<Widget> buildActions(BuildContext context) {
    // action for app bar
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the app bar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestion = Provider.of<Products>(context).items;
    displayproduct = suggestion
        .where((element) => element.title
            .toLowerCase()
            .trim()
            .contains(query.toLowerCase().trim()))
        .toList();

    // TODO: implement buildResults
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, i) {
          return ChangeNotifierProvider.value(
            value: displayproduct[i],
            child: ProductItems(),
          );
        },
        itemCount: displayproduct.length,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final suggestion = Provider.of<Products>(context).items;
    suggestion.retainWhere(
        (element) => element.title.toLowerCase().contains(query.toLowerCase()));

//    List<Product> displayproductitems = suggestion.where((product) {
//      return product.title.contains(query);
//    });
//    final suggestion = data;

//    List<Searchproduct> a = [];
//    suggestion
//        .map((e) => e.children.map((e) {
//              a.add(Searchproduct(id: e.id, Title: e.title));
//            }))
//        .toList();

//    final suggestionList = Provider.of<Products>(context,listen: true).getsuggestions(query);
//    query.isEmpty
//        ? recentlist
//        : statelist.where((element) => element.startsWith(query)).toList();
//    return Consumer<Products>(builder: (context, prod, child) {
//      final suggestionList = prod.getsuggestions(query);
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            query = suggestion[index].title;
            showResults(context);
          },
          title: RichText(
            text: TextSpan(
                text: suggestion[index].title.substring(0, query.length),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                      text: suggestion[index].title.substring(query.length),
                      style: TextStyle(color: Colors.grey))
                ]),
          ),
        );
      },
      itemCount: suggestion.length,
    );
//    },);
  }
}
