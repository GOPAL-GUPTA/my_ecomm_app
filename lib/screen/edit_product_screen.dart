import 'package:flutter/material.dart';
import 'package:grk_001/Provider/product.dart';
import 'package:provider/provider.dart';
import 'package:grk_001/Provider/products.dart';

class EditProductScreen extends StatefulWidget {
  static const String routename = 'EditProductScreen';
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  var isloading = false;
  final imageurlController = TextEditingController();
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final imageurlfocusnode = FocusNode();
  final _form = GlobalKey<FormState>();
  var isinit = true;
  var initvalue = {
    'categories': '',
//    'id': '',
    'title': '',
    'price': '',
    'description': '',
    'imageUrl': '',
  };
  var editproduct = Product(
    categories: "",
    id: null,
    title: "",
    price: 0.0,
    description: "",
    imageUrl: "",
  );
  @override
  void dispose() {
    // TODO: implement dispose
    imageurlfocusnode.removeListener(updateimageurl);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    imageurlController.dispose();
    imageurlfocusnode.dispose();

    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (isinit) {
      final productid = ModalRoute.of(context).settings.arguments as String;
      if (productid != null)
        editproduct =
            Provider.of<Products>(context, listen: false).findByid(productid);
      initvalue = {
        'id': editproduct.id,
        'categories': editproduct.categories,
        'title': editproduct.title,
        'price': editproduct.price.toString(),
        'description': editproduct.description,
        ''
//        'imageUrl': editproduct.imageUrl,
            'imageUrl': '',
      };
      imageurlController.text = editproduct.imageUrl;
    }
    isinit = false;
    super.didChangeDependencies();
  }

  @override
  void initState() {
    // TODO: implement initState
    imageurlfocusnode.addListener(updateimageurl);
    super.initState();
  }

  void updateimageurl() {
    if (!imageurlfocusnode.hasFocus) {
      if (!imageurlController.text.startsWith('http')) {
        return;
      }
      setState(() {});
    }
  }

  Future<void> _saveform() async {
    final isvalid = _form.currentState.validate();
    if (!isvalid) {
      return;
    }

    _form.currentState.save();
    setState(() {
      isloading = true;
    });
    if (editproduct.id != null) {
      Provider.of<Products>(context, listen: false)
          .updateProduct(editproduct.id, editproduct);
    } else {
      try {
        await Provider.of<Products>(context, listen: false)
            .addproduct(editproduct);
      } catch (error) {
        await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('An error Occured'),
                content: Text('Something Went Wrong'),
                actions: <Widget>[
                  FlatButton(
                    child: Text('okay'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            });
      }
//      finally {
//        setState(() {
//          isloading = false;
//        });
//        Navigator.of(context).pop();
//      }
    }
    setState(() {
      isloading = false;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: _saveform,
              icon: Icon(
                Icons.save,
                size: 35.0,
              ),
            ),
          )
        ],
      ),
      body: isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _form,
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                      initialValue: initvalue['categories'],
                      decoration: InputDecoration(labelText: 'categories'),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).nextFocus();
                      },
                      onSaved: (value) {
                        editproduct = Product(
                          categories: value,
                          id: editproduct.id,
                          title: editproduct.title,
                          price: editproduct.price,
                          description: editproduct.description,
                          imageUrl: editproduct.imageUrl,
                        );
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'please enter Categoriesid';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      initialValue: initvalue['title'],
                      decoration: InputDecoration(labelText: 'Title'),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_priceFocusNode);
                      },
                      onSaved: (value) {
                        editproduct = Product(
                          categories: editproduct.categories,
                          id: editproduct.id,
                          isFavourite: editproduct.isFavourite,
                          title: value,
                          price: editproduct.price,
                          description: editproduct.description,
                          imageUrl: editproduct.imageUrl,
                        );
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'please enter title';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      focusNode: _priceFocusNode,
                      initialValue: initvalue['price'],
                      decoration: InputDecoration(labelText: 'Price'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(_descriptionFocusNode);
                      },
                      onSaved: (value) {
                        editproduct = Product(
                          categories: editproduct.categories,
                          isFavourite: editproduct.isFavourite,
                          id: editproduct.id,
                          title: editproduct.title,
                          price: double.parse(value),
                          description: editproduct.description,
                          imageUrl: editproduct.imageUrl,
                        );
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'please enter price';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter valid no';
                        }
                        if (double.parse(value) <= 0) {
                          return 'please enter no. greater than zero';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      focusNode: _descriptionFocusNode,
                      initialValue: initvalue['description'],
                      decoration: InputDecoration(labelText: 'Description'),
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      onSaved: (value) {
                        editproduct = Product(
                          categories: editproduct.categories,
                          isFavourite: editproduct.isFavourite,
                          id: editproduct.id,
                          title: editproduct.title,
                          price: editproduct.price,
                          description: value,
                          imageUrl: editproduct.imageUrl,
                        );
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'please enter description';
                        }
                        return null;
                      },
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.only(top: 8, right: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                          child: imageurlController.text.isEmpty
                              ? Text('Enter a url')
                              : FittedBox(
                                  child: Image.network(
                                    imageurlController.text,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'ImageUrl',
                            ),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.url,
                            controller: imageurlController,
                            focusNode: imageurlfocusnode,
                            onFieldSubmitted: (_) {
                              _saveform();
                            },
                            onSaved: (value) {
                              editproduct = Product(
                                categories: editproduct.categories,
                                isFavourite: editproduct.isFavourite,
                                id: editproduct.id,
                                title: editproduct.title,
                                price: editproduct.price,
                                description: editproduct.description,
                                imageUrl: value,
                              );
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'please enter Image url';
                              }
                              if (!value.startsWith('http') &&
                                  !value.startsWith('https')) {
                                return 'please enter valid image url';
                              }
                              return null;
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
