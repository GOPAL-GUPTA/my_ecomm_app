import 'package:flutter/material.dart';
import 'package:grk_001/Provider/Address_data.dart';
import 'package:provider/provider.dart';

class AddressList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final devicesize = MediaQuery.of(context).size;
    return Consumer<AddressData>(
      builder: (context, data, child) {
        return Container(
          height: devicesize.height * 0.77,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
                child: Dismissible(
                  confirmDismiss: (direction) {
                    return showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Are you sure?'),
                        content: Text('Do You want to remove this address?'),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Yes'),
                            onPressed: () {
                              data.deleteaddresses(data.Addresses[index]);
                              Navigator.pop(context);
                            },
                          ),
                          FlatButton(
                            child: Text('NO'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    );
                  },
                  onDismissed: (direction) {
                    data.deleteaddresses(data.Addresses[index]);
                  },
                  direction: DismissDirection.endToStart,
                  key: ValueKey(data.Addresses[index]),
                  background: Container(
                    color: Theme.of(context).errorColor,
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 40.0,
                    ),
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20),
                  ),
                  child: Card(
                    color: Colors.white,
                    elevation: 5.0,
                    child: ListTile(
                      onLongPress: () {},
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          data.deleteaddresses(data.Addresses[index]);
                        },
                      ),
                      title: Row(
                        children: <Widget>[
                          Text(
                            data.Addresses[index].name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                                fontSize: 20.0),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Container(
                            padding: EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                border: Border.all(
                                  color: Colors.black54,
                                )),
                            child: Text(
                              data.Addresses[index].radiovalue,
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 10.0),
                            ),
                          )
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            '${data.Addresses[index].address1}' +
                                ',' +
                                '${data.Addresses[index].address2}' +
                                ',' +
                                '${data.Addresses[index].landmark}' +
                                ',' +
                                '${data.Addresses[index].city}' +
                                ',' +
                                '${data.Addresses[index].state}' +
                                ',' +
                                '${data.Addresses[index].pincode}',
                            style: TextStyle(
                                color: Colors.black54, fontSize: 15.0),
                          ),
                          SizedBox(
                            height: 5.0,
                          ), //(Provider.of<Data>(context).Addresses[index].name = data.Addresses[index].name)

                          Text(
                            data.Addresses[index].phoneno,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                                fontSize: 20.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: data.Addresseslength,
          ),
        );
      },
    );
  }
}
