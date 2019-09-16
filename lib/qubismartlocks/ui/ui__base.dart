///*
// Proyecto: Qubi Smart Locks
// Version: 0.0.2
// Autor: Abner Hernández
// Unidad: UI Base para todas las demás pantallas
// [Qubi Smart Locks/Qubi Smart Locks]
//*/
//
//import 'package:qubismartlocks_fw/qubismartlocks.dart';
//
//class UI_Base extends StatefulWidget {
//  UI_Base({
//    this.factorAlto,
//    this.factorAncho,
//    this.icono,
//    this.titulo,
//    this.child,
//    this.onTapAdd,
//  });
//
//  final double factorAncho;
//  final double factorAlto;
//  final String icono;
//  final String titulo;
//  final Widget child;
//  final VoidCallback onTapAdd;
//
//  @override
//  State createState() => _EstadoUI_Base();
//}
//
//class _EstadoUI_Base extends State<UI_Base> {
//  @override
//  Widget build(BuildContext context) {
//    CD.iniciar(context);
//    var anchoContenedor = CD.ancho * widget.factorAncho;
//    var altoContenedor = CD.alto * widget.factorAlto;
//
//    return Scaffold(
//      appBar: CD.ancho < 800
//          ? AppBar(
//              title: Text(widget.titulo, style: AppRes.appResMap[Co.ESTILO_TITULO]),
//              actions: <Widget>[
//                IconButton(
//                  icon: Icon(Icons.add),
//                  onPressed: widget.onTapAdd,
//                ),
//              ],
//            )
//          : null,
//      body: Row(
//        children: <Widget>[
//          CD.ancho < 800 ? Container() : UILaterales(),
//          Container(
//            color: Colors.white,
//            height: CD.alto,
//            width: CD.ancho < 800 ? CD.ancho : CD.ancho * .9,
//            child: Stack(
//              children: <Widget>[
//                Align(
//                  alignment: Alignment.bottomCenter,
//                  child: Container(
//                    width: CD.ancho < 800 ? CD.ancho : CD.ancho * .9,
//                    child: Image.asset(
//                      AppRes.appResMap[Co.BACKGROUND_SCREEN],
//                      fit: BoxFit.cover,
//                    ),
//                  ),
//                ),
//                Container(
//                  margin: EdgeInsets.only(
//                      top: ((CD.alto - altoContenedor) / 2) / 2,
//                      left: (CD.ancho - anchoContenedor) / 2,
//                      right: (CD.ancho - anchoContenedor) / 2
//                  ),
//                  child: Card(
//                    color: Colors.transparent, //AppRes.appResMap[Co.FONDO_1],
//                    elevation: 3,
//                    child:
////                    Container(
////                      width: anchoContenedor,
////                      height: altoContenedor,
////                      decoration: BoxDecoration(
////                        borderRadius: BorderRadius.all(Radius.circular(18)),
////                      ),
////                      child:
//                      Column(
//                        children: <Widget>[
//                          CD.ancho < 800 || CD.alto < 600
//                              ? Container()
//                              : Container(
//                                  margin: EdgeInsets.only(top: 20, bottom: 5),
//                                  width: 80,
//                                  height: 80,
//                                  child: Image.asset(widget.icono),
//                                ),
//                          CD.ancho < 800 || CD.alto < 340
//                              ? Container()
//                              : Container(
//                                  alignment: Alignment.center,
//                                  height: 45,
//                                  child: Text(
//                                    widget.titulo,
//                                    style: AppRes.appResMap[Co.ESTILO_TITULO],
//                                  ),
//                                ),
//                          CD.alto < 260 ? Container() : widget.child,
//                        ],
//                      ),
//                    ),
//                  //), ----------------------------------------------------------------------------------------------------
//                )
//              ],
//            ),
//          ),
//          CD.ancho < 800 ? Container() : UILaterales(),
//        ],
//      ),
//    );
//  }
//}
