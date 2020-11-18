import 'package:flutter/material.dart';
import 'package:grk_001/screen/change_password_screen.dart';

class Settings extends StatelessWidget {
  static const String routename = 'Settings';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Settings'),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, ChangePassword.routename);
            },
            title: Text('Change Password'),
            trailing: Icon(Icons.arrow_forward_ios),
          )
        ],
      ),
    );
  }
}
