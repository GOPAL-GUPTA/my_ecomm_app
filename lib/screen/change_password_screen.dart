import 'package:flutter/material.dart';

class ChangePassword extends StatelessWidget {
  static const String routename = 'ChangePasswword';
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _form = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Change password'),
      ),
      body: Form(
        key: _form,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Old Password',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'New Password'
                        '',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('Update'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
