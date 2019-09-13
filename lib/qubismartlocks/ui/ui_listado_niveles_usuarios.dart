import 'package:qubismartlocks_fw/qubismartlocks.dart';

//class UIListadoNivelesUsuarios extends StatelessWidget {
//  //static const String ruta = '/ui_clientes';
//
//  @override
//  Widget build(BuildContext context) => _UIListadoNivelesUsuarios();
//}

class UIListadoNivelesUsuarios extends StatefulWidget {
  @override
  _UIListadoNivelesUsuariosState createState() => _UIListadoNivelesUsuariosState();
}

class _UIListadoNivelesUsuariosState extends State<UIListadoNivelesUsuarios> {
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