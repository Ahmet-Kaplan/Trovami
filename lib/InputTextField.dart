import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final TextInputType textInputType;
  final Color textFieldColor, iconColor;
  final bool obscureText;
  final double bottomMargin;
  final TextStyle textStyle,hintStyle;
  final Function validateFunction;
  final Function onSaved;
  final Key key;

  //passing props in the Constructor.
  //Java like style
  InputField({
    this.key,
    this.hintText,
    this.obscureText,
    this.textInputType,
    this.textFieldColor,
    this.icon,
    this.iconColor,
    this.bottomMargin,
    this.textStyle,
    this.validateFunction,
    this.onSaved,
    this.hintStyle
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (new Container(
        margin: new EdgeInsets.only(bottom: bottomMargin),
        child: new DecoratedBox(
          decoration: new BoxDecoration(
              borderRadius: new BorderRadius.all(new Radius.circular(30.0)),
              color: textFieldColor),
          child: new TextFormField(
            style: textStyle,
            key: key,
            obscureText: obscureText,
            keyboardType: textInputType,
            validator: validateFunction,
            onSaved: onSaved,
            decoration: new InputDecoration(
                hintText: hintText,
                hintStyle: hintStyle,
                icon: new Icon(
                  icon,
                  color: Colors.brown[150],
                ),
                border: null),
          ),
        )));
  }
}