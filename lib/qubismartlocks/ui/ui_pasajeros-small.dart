//import 'package:qubismartlocks_fw/qubismartlocks.dart';
//
//class UIPasajerosSmall extends StatefulWidget {
//  @override
//  _UIPasajerosSmallState createState() => _UIPasajerosSmallState();
//}
//
//class _UIPasajerosSmallState extends State<UIPasajerosSmall> {
//
//  @override
//  Widget build(BuildContext context) {
//    return Row(
//      mainAxisSize: MainAxisSize.max,
//      mainAxisAlignment: MainAxisAlignment.start,
//      crossAxisAlignment: CrossAxisAlignment.start,
//      children: <Widget>[
//
//        // Contenedor que muestra la imagen hoteles movil
//        UILoginBackgroundImage(
//          ancho: MediaQuery.of(context).size.width * .4,
//        ),
//        // Contenedor que muestra nombre, logo, login y botón
//        Container(
//          width: App.variables.calculeAnchoResponsive(context, .4, .8, .8, .8),
//          height: MediaQuery.of(context).size.height,
//          child: ListView(
//            children: <Widget>[
//              Container(
//                width: App.variables.calculeAnchoResponsive(context, .4, .8, .8, .8),
//                height: 100,
//                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .25, left: App.variables.calculeAnchoResponsive(context, 0, .1, .1, .1)),
//                child: Center(
//                  child: Image.asset(
//                    'images/QUBI-15.png',
//                    fit: BoxFit.fitHeight,
//                    alignment: Alignment.center,
//                  ),
//                ),
//              ),
//              //UIPasajerosList(DEM.listaPasajeros),
//              SizedBox(height: 30,),
//            ],
//          ),
//        ),
//
//      ],
//    );
//  }
//}
