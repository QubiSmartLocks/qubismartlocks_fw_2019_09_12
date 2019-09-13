/*
 Proyecto: Qubi Smart Locks
 Version: 0.0.2
 Autor: Abner Hernández
 Unidad: UI TipEdificaciones
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UITipEdificaciones extends StatelessWidget {
  static const String ruta = '/ui_tipedificaciones';

  @override
  Widget build(BuildContext context) => _UITipEdificaciones();
}


class _UITipEdificaciones extends StatefulWidget {

  @override
  __UITipEdificacionesState createState() => __UITipEdificacionesState();
}


class __UITipEdificacionesState extends State<_UITipEdificaciones> {

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


