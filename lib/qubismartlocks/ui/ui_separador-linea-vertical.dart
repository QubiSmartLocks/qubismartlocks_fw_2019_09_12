import 'package:flutter_web/material.dart';

class UISeparadorLineaVertical extends StatefulWidget {
  @override
  _UISeparadorLineaVerticalState createState() =>
      _UISeparadorLineaVerticalState();
}

class _UISeparadorLineaVerticalState extends State<UISeparadorLineaVertical> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25),
      color: Colors.grey,
      width: 1,
      height: 50,
    );
  }
}
