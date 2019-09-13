//import 'package:qubismartlocks_fw/qubismartlocks.dart';
//
//class UIPasajerosCard extends StatefulWidget {
//  UIPasajerosCard({this.pasajero});
//
//  final Pasajero pasajero;
//
//  _UIPasajerosCardState createState() => _UIPasajerosCardState();
//}
//
//class _UIPasajerosCardState extends State<UIPasajerosCard> {
////
//  final GlobalKey<FormState> _forma = GlobalKey<FormState>();
//  Map mapaPasajero;
//
//  String mensajeCorreo = '';
//
//  mensajero(String mm) {
//    mensajeCorreo = mm;
//    setState(() {});
//  }
//
//  mensajeroError(String mm) {
//    mensajesError = mm;
//    setState(() {});
//  }
//
//  _enviarCorreo() async {
////    if (mapaPasajero[PASAJEROS.EMAIL] == '') {
////      mensajeroError('Debe indicar el correo electrónico');
////      mensaje(DEM.anyScaffoldKey.currentState, 'Debe indicar el correo electrónico');
////    }
//    mensajeroError('');
//    if (lEnviando) {
//      return;
//    }
//    lEnviando = true;
//    final FormState forma = _forma.currentState;
//
//    if (!forma.validate()) {
//      _autovalidar = true; // Iniciar validación en cada cambio
//      mensaje(DEM.anyScaffoldKey.currentState, Co.MENSAJE_CORREGIR_ERRORES);
//    } else {
//      forma.save();
//
//      Resultado resultado;
//      try {
//        mensaje(DEM.anyScaffoldKey.currentState, 'ENVIANDO correo con enlace del APP...espere unos segundos por favor...');
//        resultado = await DEM.api
//            .getRegistro('send-mail/' + mapaPasajero[PASAJEROS.EMAIL]);
//      } catch (e) {
//        resultado.objeto = e.toString();
//        resultado.mensaje = e.toString();
//      }
//      if (resultado.objeto == 'done') {
//        mensaje(DEM.anyScaffoldKey.currentState, 'Correo con enlace para el APP de QubiLocks enviado con éxito.');
//        mensajeroError('');
//      } else {
//        mensajeroError('');
//        mensaje(DEM.anyScaffoldKey.currentState, 'No se envió el correo... ' + resultado.objeto);
//      }
//      lEnviando = false;
//    }
//  }
//
//  String mensajesError = '';
//  bool lEnviando = false;
//
//  bool _autovalidar = false;
//  bool _formaEditada = false;
//
//  String _validarEmail(String value) {
//    _formaEditada = true;
//    if (value.isEmpty) return campoObligatorio(PASAJEROS.ETIQUETA_EMAIL);
//
//    mapaPasajero[PASAJEROS.EMAIL] = value;
//    return null;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    App.variables.calcular(context);
//
//    Pasajero pasajero = widget.pasajero;
//
//    if (pasajero == null) {
//      pasajero = Pasajero(
//        nombres: 'Gustavo Adolfo',
//        apellidos: 'Beckles Godoy',
//        doc: '567-512-832-1',
//        telefono: '+567291322',
//        email: 'gustavoadolfo@gmail.com',
//      );
//    }
//    mapaPasajero = pasajero.toMap();
//    double alto = AppRes.appResMap[Co.ALTO_EDICION];
//
//    return Card(
//      elevation: 3,
//      margin: EdgeInsets.all(10),
//      child: Form(
//        key: _forma,
//        autovalidate: _autovalidar,
////      onWillPop: _advertir,
//        child: Center(
//          child: Container(
//            width:
//                App.variables.calculeAnchoResponsive(context, .42, .8, .8, .8),
//            margin: EdgeInsets.only(
//                top: 0,
//                left: App.variables
//                    .calculeAnchoResponsive(context, 0, .1, .1, .1)),
//            height: 300,
//            child: Column(
//              mainAxisSize: MainAxisSize.max,
//              mainAxisAlignment: MainAxisAlignment.start,
//              crossAxisAlignment: CrossAxisAlignment.center,
//              children: <Widget>[
//                Row(
//                  mainAxisSize: MainAxisSize.max,
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: <Widget>[
////// Campo: Nombres. Tipo de Componente: BDEdicion
//                    UICampo(
//                      datos: mapaPasajero,
//                      tabla: PASAJEROS.ETIQUETA_ENTIDAD,
//                      campo: PASAJEROS.NOMBRES,
//                      denominacion: PASAJEROS.ETIQUETA_NOMBRES,
//                      etiqueta: PASAJEROS.ETIQUETA_NOMBRES,
//                      componente: 'BDEdicion',
//                      longitud: 60,
//                      decimales: 0,
//                      alto: alto,
//                      ancho: App.variables
//                          .calculeAnchoResponsive(context, .2, .2, .2, .2),
//                    ),
//                    SizedBox(
//                      width: 20,
//                    ),
////// Campo: Apellidos. Tipo de Componente: BDEdicion
//                    UICampo(
//                      datos: mapaPasajero,
//                      tabla: PASAJEROS.ETIQUETA_ENTIDAD,
//                      campo: PASAJEROS.APELLIDOS,
//                      denominacion: PASAJEROS.ETIQUETA_APELLIDOS,
//                      etiqueta: PASAJEROS.ETIQUETA_APELLIDOS,
//                      componente: 'BDEdicion',
//                      longitud: 60,
//                      decimales: 0,
//                      alto: alto,
//                      ancho: App.variables
//                          .calculeAnchoResponsive(context, .2, .2, .2, .2),
//                    ),
//                  ],
//                ),
//                Row(
//                  mainAxisSize: MainAxisSize.max,
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: <Widget>[
//// Campo: Documento. Tipo de Componente: BDEdicion
//                    UICampo(
//                      datos: mapaPasajero,
//                      tabla: PASAJEROS.ETIQUETA_ENTIDAD,
//                      campo: PASAJEROS.DOC,
//                      denominacion: PASAJEROS.ETIQUETA_DOC,
//                      etiqueta: PASAJEROS.ETIQUETA_DOC,
//                      componente: 'BDEdicion',
//                      longitud: 12,
//                      decimales: 0,
//                      alto: alto,
//                      ancho: App.variables
//                          .calculeAnchoResponsive(context, .2, .2, .2, .2),
//
////                  validatorTexto: _validarDoc,
//                    ),
//                    SizedBox(
//                      width: 20,
//                    ),
//
//// Campo: Teléfono. Tipo de Componente: BDEdicion
//                    UICampo(
//                      datos: mapaPasajero,
//                      tabla: PASAJEROS.ETIQUETA_ENTIDAD,
//                      campo: PASAJEROS.TELEFONO,
//                      denominacion: PASAJEROS.ETIQUETA_TELEFONO,
//                      etiqueta: PASAJEROS.ETIQUETA_TELEFONO,
//                      componente: 'BDEdicion',
//                      longitud: 15,
//                      decimales: 0,
//                      alto: alto,
//                      ancho: App.variables
//                          .calculeAnchoResponsive(context, .2, .2, .2, .2),
//                    ),
//                  ],
//                ),
//                Row(
//                  mainAxisSize: MainAxisSize.max,
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: <Widget>[
//// Campo: E-mail. Tipo de Componente: BDEdicion
//                    UICampo(
//                      datos: mapaPasajero,
//                      tabla: PASAJEROS.ETIQUETA_ENTIDAD,
//                      campo: PASAJEROS.EMAIL,
//                      denominacion: PASAJEROS.ETIQUETA_EMAIL,
//                      etiqueta: PASAJEROS.ETIQUETA_EMAIL,
//                      componente: 'BDEdicion',
//                      longitud: 50,
//                      decimales: 0,
//                      validatorTexto: _validarEmail,
//                      alto: alto,
//                      ancho: App.variables
//                          .calculeAnchoResponsive(context, .25, .2, .2, .2),
//                    ),
////                    SizedBox(width: 20,),
//                    UIBoton(
//                      mensajeCorreo == '' ? 'Enviar APP' : mensajeCorreo,
//                      mensajeCorreo == '' ? _enviarCorreo : null,
//                      ancho: 150,
//                      margenes: EdgeInsets.all(0),
//                    ),
//// Campo: Llave Electrónica. Tipo de Componente: BDChequeo
////                    UICampo(
////                      datos: mapaPasajero,
////                      tabla: PASAJEROS.ETIQUETA_ENTIDAD,
////                      campo: PASAJEROS.LLAVEELECTRONICA,
////                      denominacion: PASAJEROS.ETIQUETA_LLAVEELECTRONICA,
////                      etiqueta: PASAJEROS.ETIQUETA_LLAVEELECTRONICA,
////                      componente: 'BDChequeo',
////                      longitud: 1,
////                      decimales: 0,
////                      ancho: App.variables
////                          .calculeAnchoResponsive(context, .2, .2, .2, .2),
////                    ),
//                  ],
//                ),
//                mensajesError == ''
//                    ? Container()
//                    : Container(
//                        child: Text(
//                          mensajesError,
//                          style: AppRes.appResMap[Co.ESTILO_DATO],
//                        ),
//                      )
//              ],
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}
