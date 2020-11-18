import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserimagePicker extends StatefulWidget {
  final String imageUrl;
  final BuildContext ctx;
  final FirebaseUser id;
  UserimagePicker(this.ctx, this.id, this.imageUrl);
  @override
  _UserimagePickerState createState() => _UserimagePickerState();
}

class _UserimagePickerState extends State<UserimagePicker> {
  File _image;
  Future<void> getimage() async {
    showDialog(
      context: widget.ctx,
      builder: (context) {
        return SimpleDialog(
          title: Text('SELECT PHOTO'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () async {
                final pickedfile = await ImagePicker()
                    .getImage(imageQuality: 30, source: ImageSource.camera);
                Navigator.of(context).pop();

                setState(() {
                  _image = File(pickedfile.path);
                });
                final ref = FirebaseStorage.instance
                    .ref()
                    .child('userImage')
                    .child(widget.id.uid + '.jpg');
                await ref.putFile(_image).onComplete;
                final url = await ref.getDownloadURL();
                await Firestore.instance
                    .collection('user/${widget.id.uid}/profile')
                    .document('${widget.id.uid}')
                    .updateData({'imageUrl': url});
              },
              child: Row(
                children: <Widget>[
                  Icon(Icons.camera),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text('Camera')
                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: () async {
                final pickedfile =
                    await ImagePicker().getImage(source: ImageSource.gallery);
                Navigator.of(context).pop();
                setState(() {
                  _image = File(pickedfile.path);
                });
                final ref = FirebaseStorage.instance
                    .ref()
                    .child('userImage')
                    .child(widget.id.uid + '.jpg');
                await ref.putFile(_image).onComplete;
                final url = await ref.getDownloadURL();
                await Firestore.instance
                    .collection('user/${widget.id.uid}/profile')
                    .document('${widget.id.uid}').updateData({'imageUrl': url});
              },
              child: Row(
                children: <Widget>[
                  Icon(Icons.folder),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text('Gallery'),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: 40.0,
          backgroundColor: Colors.white,
          backgroundImage: widget.imageUrl != null
              ? NetworkImage(widget.imageUrl)
              : null, //FileImage(_image) is also used but not get value from firebase database
        ),
        FlatButton.icon(
          onPressed: getimage,
          color: Theme.of(context).primaryColor,
          icon: Icon(Icons.image),
          label: Text('Add Image'),
        )
      ],
    );
  }
}
