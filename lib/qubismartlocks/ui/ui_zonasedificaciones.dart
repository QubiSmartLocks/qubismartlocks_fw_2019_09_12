///*
// Proyecto: Qubi Smart Locks
// Version: 0.0.2
// Autor: Abner Hernández
// Unidad: UI ZonasEdificaciones
//*/
//
//import 'package:qubismartlocks_fw/qubismartlocks.dart';
//
//
//class UIZonasEdificaciones extends StatelessWidget {
//  static const String ruta = '/ui_zonasedificaciones';
//
//  @override
//  Widget build(BuildContext context) => _UIZonasEdificaciones();
//}
//
//
//class _UIZonasEdificaciones extends StatefulWidget {
//
//  @override
//  __UIZonasEdificacionesState createState() => __UIZonasEdificacionesState();
//}
//
//
//class __UIZonasEdificacionesState extends State<_UIZonasEdificaciones> {
//
//  @override
//  Widget build(BuildContext context) {
//    return LayoutBuilder(
//        builder: (BuildContext context, BoxConstraints constraints) {
//          return Scaffold(
//            body: Center(
//              child: Container(
//                child: Column(
//                  children: <Widget>[
//                    Row(
//                      children: <Widget>[
//                        // Contenedor izquierdo que hace de separador centrador 1
//                        UILaterales(),
//                        // Contenedor que muestra la imagen hoteles movil 2
//                        Container(
//                          color: Colors.white,
//                          height: MediaQuery.of(context).size.height,
//                          width: MediaQuery.of(context).size.width * 90 / 100,
//                          child: Stack(
//                            children: <Widget>[
//                              Align(
//                                alignment: Alignment.bottomCenter,
//                                child: Container(
//                                  height: 400,
//                                  width:
//                                  MediaQuery.of(context).size.width * 90 / 100,
//                                  child: Image.asset(
//                                    AppRes.appResMap[Co.BACKGROUND_SCREEN],
//                                    fit: BoxFit.cover,
//                                  ),
//                                ),
//                              ),
//                              UIFormularioZonasEdificaciones(),
//                            ],
//                          ),
//                        ),
//                        // Contenedor derecho que hace de separador centrador 3
//                        UILaterales(),
//                      ],
//                    ),
//                  ],
//                ),
//              ),
//            ),
//          );
//        });
//  }
//}
//
//
