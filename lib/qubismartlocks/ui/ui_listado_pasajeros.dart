import 'package:qubismartlocks_fw/qubismartlocks.dart';

class UIListadoPasajeros extends StatelessWidget {
  static const String ruta = '/ui_clientes';

  @override
  Widget build(BuildContext context) => _UIClientes();
}

class  _UIClientes extends StatefulWidget {
  @override
  __UIClientesState createState() => __UIClientesState();
}

class __UIClientesState extends State<_UIClientes> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Scaffold(
            body: Center(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        UILaterales(),
                        Container(
                          color: Colors.white,
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width * 90 / 100,
                          child: Stack(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: 400,
                                  width:
                                  MediaQuery.of(context).size.width * 90 / 100,
                                  child: Image.asset(
                                    AppRes.appResMap[Co.BACKGROUND_SCREEN],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              //UIFormularioClientes(),

                            ],
                          ),
                        ),
                        UILaterales(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}






























//class UIListadoPasajeros extends StatefulWidget {
//  @override
//  _UIListadoPasajerosState createState() => _UIListadoPasajerosState();
//}
//
//class _UIListadoPasajerosState extends State<UIListadoPasajeros> {
//
//  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//  @override
//  Widget build(BuildContext context) {
//    App.variables.calcular(context);
//    DEM.anyScaffoldKey = _scaffoldKey;
//    return Scaffold(
//      key: _scaffoldKey,
//      body: MediaQuery.of(context).size.width >
//          AppRes.appResMap[Co.WEB_BREAK_POINT_2]
//          ? UIPasajerosBig()
//          : UIPasajerosSmall(),
//    );
//  }
//}
