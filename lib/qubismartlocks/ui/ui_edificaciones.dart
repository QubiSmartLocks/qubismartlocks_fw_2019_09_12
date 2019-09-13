/*
 Proyecto: Qubi Smart Locks
 Version: 0.0.2
 Autor: Abner Hernández
 Unidad: UI Edificaciones
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIEdificaciones extends StatelessWidget {
  static const String ruta = '/ui_edificaciones';

  @override
  Widget build(BuildContext context) => _UIEdificaciones();
}


class _UIEdificaciones extends StatefulWidget {

  @override
  __UIEdificacionesState createState() => __UIEdificacionesState();
}


class __UIEdificacionesState extends State<_UIEdificaciones> {

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
                              // UIFormularioCerraduras(),
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


