import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:grk_001/Provider/orders.dart' show Orders;
import 'package:grk_001/widgets/order_item.dart';

class OrderScreen extends StatelessWidget {
  static const String routename = 'orderScreen';

////  var _isloading = false;
//  @override
//  void initState() {
//    // TODO: implement initState
//    Future.delayed(Duration.zero).then((_) async {
//      setState(() {
//        _isloading = true;
//      });
//      await Provider.of<Orders>(context, listen: false).fetandsetdata();
//      setState(() {
//        _isloading = false;
//      });
//    });
//    super.initState();
//  }

  Future<void> getOrderproduct(BuildContext context) async {
    await Provider.of<Orders>(context, listen: false).fetandsetdata();
  }

  @override
  Widget build(BuildContext context) {
//    final OrdersData = Provider.of<Orders>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('My ORDER'),
        ),
        body: FutureBuilder(
            future: Provider.of<Orders>(context, listen: false).fetandsetdata(),
            builder: (context, datasnapshot) {
              if (datasnapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (datasnapshot.error != null) {
                return Center(
                  child: Text('An error occurred!'),
                );
              } else {
                return Consumer<Orders>(builder: (context, OrdersData, child) {
                  return ListView.builder(
                    itemBuilder: (context, i) =>
                        OrderItem(OrdersData.orders[i]),
                    itemCount: OrdersData.orders.length,
                  );
                });
              }
            }));
  }
}
