///*
// Proyecto: Qubi Smart Locks
// Version: 0.0.2
// Autor: Abner Hernández
// Unidad: UI LogsCerraduras
//*/
//
//import 'package:qubismartlocks_fw/qubismartlocks.dart';
//
//
//class UILogsCerraduras extends StatelessWidget {
//  static const String ruta = '/ui_logscerraduras';
//
//  @override
//  Widget build(BuildContext context) => _UILogsCerraduras();
//}
//
//
//class _UILogsCerraduras extends StatefulWidget {
//
//  @override
//  __UILogsCerradurasState createState() => __UILogsCerradurasState();
//}
//
//
//class __UILogsCerradurasState extends State<_UILogsCerraduras> {
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
//                              UIFormularioLogsCerraduras(),
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
