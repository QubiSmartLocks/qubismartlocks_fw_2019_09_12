///*
// Proyecto: Qubi Smart Locks
// Version: 0.0.2
// Autor: Abner Hernández
// Unidad: UI TipUnidadesFuncionales
//*/
//
//import 'package:qubismartlocks_fw/qubismartlocks.dart';
//
//
//class UITipUnidadesFuncionales extends StatelessWidget {
//  static const String ruta = '/ui_tipunidadesfuncionales';
//
//  @override
//  Widget build(BuildContext context) => _UITipUnidadesFuncionales();
//}
//
//
//class _UITipUnidadesFuncionales extends StatefulWidget {
//
//  @override
//  __UITipUnidadesFuncionalesState createState() => __UITipUnidadesFuncionalesState();
//}
//
//
//class __UITipUnidadesFuncionalesState extends State<_UITipUnidadesFuncionales> {
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
//                               UIFormularioTiposUnidadesFuncionales(),
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
