// Proyecto: Qubi Smart Locks
// Version: 0.0.2
// Autor: Abner Hernández
// Unidad: Edicion de Pasajeros
// Edicion para [Qubi Smart Locks/Qubi Smart Locks/Pasajeros]

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIPasjerosEdicion extends StatefulWidget {
  UIPasjerosEdicion({Key key, this.registro}) : super(key: key);

  final Pasajero registro;

  @override
  _EstadoPasajerosEdicion createState() =>
      _EstadoPasajerosEdicion();
}

class _EstadoPasajerosEdicion extends State<UIPasjerosEdicion> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _forma = GlobalKey<FormState>();

  bool _autovalidar = false;
  bool _formaEditada = false;

  void _guardar() async {
    final FormState forma = _forma.currentState;
    if (!forma.validate()) {
      _autovalidar = true; // Iniciar validación en cada cambio
      mensaje(_scaffoldKey.currentState, Co.MENSAJE_CORREGIR_ERRORES);
    } else {
      forma.save();

      // Asignar los datos del mapa en Edición en la Sesión
      // al registro de Pasajeros en el widget
      widget.registro.fromMap(DEM.mapaPasajero);

      // Guardar Pasajeros
      Resultado _resultado =
      await Pasajeros.guardar(widget.registro);
      Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
    }
  }

  void _borrar() async {
    // Borrar Pasajeros
    Resultado _resultado =
    await Pasajeros.borrar(widget.registro);
    Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
  }

  String _validarReservacion(int value) {
    _formaEditada = true;
    widget.registro.reservacion = value;
    return null;
  }

  String _validarTipoIdent(int value) {
    _formaEditada = true;
    // TODO: Falta validar las Claves Foraneas
    // widget.registro.tipoIdent.id = value;
    return null;
  }

  String _validarDocIdent(String value) {
    _formaEditada = true;
    if (value.isEmpty)
      return campoObligatorio(PASAJEROS.ETIQUETA_DOCIDENT);
    widget.registro.docIdent = value;
    return null;
  }

  String _validarLlaveElectronica(bool value) {
    _formaEditada = true;
    widget.registro.llaveElectronica = value;
    return null;
  }



  @override
  Widget build(BuildContext context) {
    DEM.mapaPasajero = widget.registro.toMap();

    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  UILaterales(),
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
                            width: MediaQuery.of(context).size.width * 90 / 100,
                            child: Image.asset(
                              AppRes.appResMap[Co.BACKGROUND_SCREEN],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Center(
                          child: Card(
                            color: AppRes.appResMap[Co.FONDO_1],
                            elevation: 3,
                            child: Container(
                              width: 600,
                              height: 550,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(18)),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Column(children: <Widget>[
                                      Center(
                                        child: Column(children: <Widget>[
                                          Column(
                                            children: <Widget>[
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: 25, bottom: 15),
                                                width: 80,
                                                height: 80,
                                                child: Container(
                                                  child: Image.asset(
                                                      'images/clientes.png'),
                                                ),
//                                                CircleAvatar(
//                                                  backgroundColor: AppRes
//                                                      .appResMap[Co.COLOR_2],
//                                                  backgroundImage: AssetImage(
//                                                      imagenCard),
//                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                height: 50,
                                                child: Text(
                                                  'Pasajeros',
                                                  style: AppRes.appResMap[
                                                  Co.ESTILO_TITULO],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            child: Row(
                                              children: <Widget>[
// Campo: Reservación. Tipo de Componente: BDBusquedaCombo
//                                                UICampo(
//                                                  alto: 45,
//                                                  ancho: 250,
//                                                  datos: DEM.mapaPasajero,
//                                                  tabla: PASAJEROS.ETIQUETA_ENTIDAD,
//                                                  campo: PASAJEROS.RESERVACION,
//                                                  denominacion: PASAJEROS.ETIQUETA_RESERVACION,
//                                                  etiqueta: PASAJEROS.ETIQUETA_RESERVACION,
//                                                  componente: 'BDBusquedaCombo',
//                                                  longitud: 0,
//                                                  decimales: 0,
//
//
//                                                ),
// Campo: Nombres. Tipo de Componente: BDEdicion
                                                UICampo(
                                                  alto: 45,
                                                  ancho: 250,
                                                  datos: DEM.mapaPasajero,
                                                  tabla: PASAJEROS.ETIQUETA_ENTIDAD,
                                                  campo: PASAJEROS.NOMBRES,
                                                  denominacion: PASAJEROS.ETIQUETA_NOMBRES,
                                                  etiqueta: PASAJEROS.ETIQUETA_NOMBRES,
                                                  componente: 'BDEdicion',
                                                  longitud: 60,
                                                  decimales: 0,


                                                ),
// Campo: Apellidos. Tipo de Componente: BDEdicion
                                                UICampo(
                                                  alto: 45,
                                                  ancho: 250,
                                                  datos: DEM.mapaPasajero,
                                                  tabla: PASAJEROS.ETIQUETA_ENTIDAD,
                                                  campo: PASAJEROS.APELLIDOS,
                                                  denominacion: PASAJEROS.ETIQUETA_APELLIDOS,
                                                  etiqueta: PASAJEROS.ETIQUETA_APELLIDOS,
                                                  componente: 'BDEdicion',
                                                  longitud: 60,
                                                  decimales: 0,


                                                ),
                                                //SizedBox(width: 10,),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: <Widget>[
// Campo: Tipo de Identificación. Tipo de Componente: BDBusquedaCombo
//                                                UICampo(
//                                                  alto: 45,
//                                                  ancho: 250,
//                                                  datos: DEM.mapaPasajero,
//                                                  tabla: PASAJEROS.ETIQUETA_ENTIDAD,
//                                                  campo: PASAJEROS.TIPOIDENT,
//                                                  denominacion: PASAJEROS.ETIQUETA_TIPOIDENT,
//                                                  etiqueta: PASAJEROS.ETIQUETA_TIPOIDENT,
//                                                  componente: 'BDBusquedaCombo',
//                                                  longitud: 0,
//                                                  decimales: 0,
//
//
//                                                ),
// Campo: Documento de Identificación. Tipo de Componente: BDEdicion
                                                UICampo(
                                                  alto: 45,
                                                  ancho: 250,
                                                  datos: DEM.mapaPasajero,
                                                  tabla: PASAJEROS.ETIQUETA_ENTIDAD,
                                                  campo: PASAJEROS.DOCIDENT,
                                                  denominacion: PASAJEROS.ETIQUETA_DOCIDENT,
                                                  etiqueta: PASAJEROS.ETIQUETA_DOCIDENT,
                                                  componente: 'BDEdicion',
                                                  longitud: 12,
                                                  decimales: 0,

                                                  // validatorTexto: _validarDocIdent,

                                                ),
                                                //SizedBox(width: 10,),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: <Widget>[
// Campo: Teléfono. Tipo de Componente: BDEdicion
                                                UICampo(
                                                  alto: 45,
                                                  ancho: 250,
                                                  datos: DEM.mapaPasajero,
                                                  tabla: PASAJEROS.ETIQUETA_ENTIDAD,
                                                  campo: PASAJEROS.TELEFONO,
                                                  denominacion: PASAJEROS.ETIQUETA_TELEFONO,
                                                  etiqueta: PASAJEROS.ETIQUETA_TELEFONO,
                                                  componente: 'BDEdicion',
                                                  longitud: 15,
                                                  decimales: 0,


                                                ),
// Campo: Correo Electrónico. Tipo de Componente: BDEdicion
                                                UICampo(
                                                  alto: 45,
                                                  ancho: 250,
                                                  datos: DEM.mapaPasajero,
                                                  tabla: PASAJEROS.ETIQUETA_ENTIDAD,
                                                  campo: PASAJEROS.CORREOELECTRONICO,
                                                  denominacion: PASAJEROS.ETIQUETA_CORREOELECTRONICO,
                                                  etiqueta: PASAJEROS.ETIQUETA_CORREOELECTRONICO,
                                                  componente: 'BDEdicion',
                                                  longitud: 50,
                                                  decimales: 0,


                                                ),
// Campo: Llave Electrónica. Tipo de Componente: BDChequeo
                                                UICampo(
                                                  alto: 45,
                                                  ancho: 50,
                                                  datos: DEM.mapaPasajero,
                                                  tabla: PASAJEROS.ETIQUETA_ENTIDAD,
                                                  campo: PASAJEROS.LLAVEELECTRONICA,
                                                  denominacion: PASAJEROS.ETIQUETA_LLAVEELECTRONICA,
                                                  etiqueta: PASAJEROS.ETIQUETA_LLAVEELECTRONICA,
                                                  componente: 'BDChequeo',
                                                  longitud: 1,
                                                  decimales: 0,


                                                ),
                                                //SizedBox(width: 10,),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: 400,
                                            child: UIBGB(
                                                guardar: _guardar,
                                                borrar: widget.registro.id == 0
                                                    ? null
                                                    : _borrar),
                                          ),
                                        ]),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  UILaterales(),
                ],
              ),
            ],
          ),
        ),
      ),
    );


  }
}
