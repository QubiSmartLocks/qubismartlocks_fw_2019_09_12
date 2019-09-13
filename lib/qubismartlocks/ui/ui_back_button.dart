import 'package:qubismartlocks_fw/qubismartlocks.dart';

class UIBackButton extends StatefulWidget {
  @override
  _UIBackButtonState createState() => _UIBackButtonState();
}

class _UIBackButtonState extends State<UIBackButton> {
  @override
  Widget build(BuildContext context) {
    return CD.ancho < AppRes.appResMap[Co.WEB_BREAK_POINT_4]
        ? Container()
        : Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 50,
              margin: EdgeInsets.only(left: 20),
              child: FlatButton(
                color: AppRes.appResMap[Co.COLOR_2],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child:
                    Icon(Icons.arrow_back, color: AppRes.appResMap[Co.COLOR_3]),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          );
  }
}
