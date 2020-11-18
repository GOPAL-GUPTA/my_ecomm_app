import 'package:flutter/material.dart';
import 'package:grk_001/models/state_list.dart';

class DropButton extends StatefulWidget {
 final  Function setselcted;
  DropButton(this.setselcted);
  @override
  _DropButtonState createState() => _DropButtonState();
}

class _DropButtonState extends State<DropButton> {
  String selectedstate;
  List<DropdownMenuItem> getdropdownitems() {
    List<DropdownMenuItem<String>> dropdownitems = [];
    for (String state in statelist) {
      var newitems = DropdownMenuItem(
        child: Text(state),
        value: state,
      );
      dropdownitems.add(newitems);
    }
    return dropdownitems;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Text(
            'Selected state',
            style: TextStyle(color: Colors.black54),
          ),
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18.0,
          ),
          value: selectedstate,
          items: getdropdownitems(),
          onChanged: (value) {
            setState(() {
              selectedstate = value;
              widget.setselcted(selectedstate);
            });
          },
        ),
      ),
    );
  }
}
