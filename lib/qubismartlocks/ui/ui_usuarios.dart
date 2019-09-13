///*
// Proyecto: Qubi Smart Locks
// Version: 0.0.2
// Autor: Abner Hernández
// Unidad: UI Clientes
//*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';

class UIUsuarios extends StatelessWidget {
  static const String ruta = '/ui_usuarios';

  @override
  Widget build(BuildContext context) => _UIUsuarios();
}

class _UIUsuarios extends StatefulWidget {
  @override
  __UIUsuariosState createState() => __UIUsuariosState();
}

class __UIUsuariosState extends State<_UIUsuarios> {
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
                        // Contenedor izquierdo que hace de separador centrador 1
                        UILaterales(),
                        // Contenedor que muestra la imagen hoteles movil 2
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
                              UIUsuariosLista(),
                            ],
                          ),
                        ),
                        // Contenedor derecho que hace de separador centrador 3
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