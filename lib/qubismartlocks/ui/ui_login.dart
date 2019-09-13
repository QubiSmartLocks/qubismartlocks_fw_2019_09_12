import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UILogin extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    App.variables.calcular(context);
    DEM.anyScaffoldKey = _scaffoldKey;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.transparent,

      body: MediaQuery.of(context).size.width >
              AppRes.appResMap[Co.WEB_BREAK_POINT_2]
          ? UILoginBig()
          : UILoginSmall(),
    );
  }
}
