///*
// Proyecto: Qubi Smart Locks
// Version: 0.0.2
// Autor: Abner Hernández
// Unidad: UI Reservaciones
//*/
//
//import 'package:qubismartlocks_fw/qubismartlocks.dart';
//
//
//class UIReservaciones extends StatelessWidget {
//  static const String ruta = '/ui_reservaciones';
//
//  @override
//  Widget build(BuildContext context) => _UIReservaciones();
//}
//
//
//class _UIReservaciones extends StatefulWidget {
//
//  @override
//  __UIReservacionesState createState() => __UIReservacionesState();
//}
//
//
//class __UIReservacionesState extends State<_UIReservaciones> {
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
//                              UIFormularioReservaciones(),
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
