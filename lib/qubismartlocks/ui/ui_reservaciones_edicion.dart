// Proyecto: Qubi Smart Locks
// Version: 0.0.2
// Autor: Abner Hernández
// Unidad: Edicion de Reservaciones
// Edicion para [Qubi Smart Locks/Qubi Smart Locks/Reservaciones]

import 'package:qubismartlocks_fw/qubismartlocks.dart';

class UIReservacionesEdicion extends StatefulWidget {
  UIReservacionesEdicion({Key key, this.registro}) : super(key: key);

  final Reservacion registro;

  @override
  _EstadoReservacionesEdicion createState() => _EstadoReservacionesEdicion();
}

class _EstadoReservacionesEdicion extends State<UIReservacionesEdicion> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _forma = GlobalKey<FormState>();
//
//  bool _autovalidar = false;
//  bool _formaEditada = false;
//
//  void _guardar() async {
//    final FormState forma = _forma.currentState;
//    if (!forma.validate()) {
//      _autovalidar = true; // Iniciar validación en cada cambio
//      mensaje(_scaffoldKey.currentState, Co.MENSAJE_CORREGIR_ERRORES);
//    } else {
//      forma.save();
//
//      // Asignar los datos del mapa en Edición en la Sesión
//      // al registro de Reservaciones en el widget
//      widget.registro.fromMap(DEM.mapaReservacion);
//
//      // Guardar Reservaciones
//      Resultado _resultado = await Reservaciones.guardar(widget.registro);
//      Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
//    }
//  }
//
//  void _borrar() async {
//    // Borrar Reservaciones
//    Resultado _resultado = await Reservaciones.borrar(widget.registro);
//    Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
//  }
//
//  String _validarIdEdificacion(int value) {
//    _formaEditada = true;
//    // TODO: Falta validar las Claves Foraneas
//    // widget.registro.idEdificacion.id = value;
//    return null;
//  }
//
//  String _validarTipoUnidadFuncional(int value) {
//    _formaEditada = true;
//    // TODO: Falta validar las Claves Foraneas
//    // widget.registro.tipoUnidadFuncional.id = value;
//    return null;
//  }
//
//  String _validarUnidadFuncional(int value) {
//    _formaEditada = true;
//    // TODO: Falta validar las Claves Foraneas
//    // widget.registro.unidadFuncional.id = value;
//    return null;
//  }
//
//  String _validarGarantizada(bool value) {
//    _formaEditada = true;
//    widget.registro.garantizada = value;
//    return null;
//  }
//
//  String _validarEstadoReservacion(int value) {
//    _formaEditada = true;
//    // TODO: Falta validar las Claves Foraneas
//    // widget.registro.estadoReservacion.id = value;
//    return null;
//  }
//
  @override
  Widget build(BuildContext context) {
    //  DEM.mapaReservacion = widget.registro.toMap();
    var anchoC = 800.0;
    return Scaffold(
      appBar: MediaQuery.of(context).size.width <
              AppRes.appResMap[Co.WEB_BREAK_POINT_4]
          ? AppBar(
              title: Text('Reservaciones'),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.save),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {},
                ),
              ],
            )
          : null,
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              UILaterales(),
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width * .9,
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 400,
                        width: MediaQuery.of(context).size.width * .9,
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
                          width: CD.ancho * .9,
                          height: CD.alto * .9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                          ),
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(top: 25, bottom: 15),
                                  width: 80,
                                  height: 80,
                                  child: Container(
                                    child: Image.asset(
                                        'images/web_qubi_pasajeros.png'),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  child: Text(
                                    'Clientes',
                                    style: AppRes.appResMap[Co.ESTILO_TITULO],
                                  ),
                                ),
                                //--
                                Form(
//                                      key: _forma,
//                                      autovalidate: _autovalidar,
//                                      onWillPop: () async {
//                                        return await advertirDatosInvalidos(
//                                            context, _forma.currentState, _formaEditada);
//                                      },
                                  child: Column(
                                    // padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 10, left: 10, right: 10),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child:
// Campo: Número de Reservación. Tipo de Componente: BDEdicion
                                                  UICampo(
                                                datos: DEM.mapaReservacion,
                                                tabla: RESERVACIONES
                                                    .ETIQUETA_ENTIDAD,
                                                campo: RESERVACIONES
                                                    .NUMERORESERVACION,
                                                denominacion: RESERVACIONES
                                                    .ETIQUETA_NUMERORESERVACION,
                                                etiqueta: RESERVACIONES
                                                    .ETIQUETA_NUMERORESERVACION,
                                                componente: 'BDEdicion',
                                                longitud: 20,
                                                decimales: 0,
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Expanded(
                                              child:
// Campo: Fecha de Llegada. Tipo de Componente: BDEdicionFecha
                                                  UICosa(),
//                                          UICampo(
//                                            datos: DEM.mapaReservacion,
//                                            tabla: RESERVACIONES.ETIQUETA_ENTIDAD,
//                                            campo: RESERVACIONES.FECHALLEGADA,
//                                            denominacion: RESERVACIONES.ETIQUETA_FECHALLEGADA,
//                                            etiqueta: RESERVACIONES.ETIQUETA_FECHALLEGADA,
//                                            componente: 'BDEdicionFecha',
//                                            longitud: 0,
//                                            decimales: 0,
//                                          ),
                                            ),
                                            SizedBox(width: 10),
                                            Expanded(
                                              child:
// Campo: Tipo de Unidad Funcional. Tipo de Componente: BDBusquedaCombo
                                                  UICosa(),

//                                          UICampo(
//                                            datos: DEM.mapaReservacion,
//                                            tabla: RESERVACIONES.ETIQUETA_ENTIDAD,
//                                            campo: RESERVACIONES.TIPOUNIDADFUNCIONAL,
//                                            denominacion: RESERVACIONES.ETIQUETA_TIPOUNIDADFUNCIONAL,
//                                            etiqueta: RESERVACIONES.ETIQUETA_TIPOUNIDADFUNCIONAL,
//                                            componente: 'BDBusquedaCombo',
//                                            longitud: 0,
//                                            decimales: 0,
//                                          ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 10, left: 10, right: 10),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child:
// Campo: Fecha de Salida. Tipo de Componente: BDEdicionFecha
                                                  UICosa(),

//                                          UICampo(
//                                            datos: DEM.mapaReservacion,
//                                            tabla: RESERVACIONES.ETIQUETA_ENTIDAD,
//                                            campo: RESERVACIONES.FECHASALIDA,
//                                            denominacion: RESERVACIONES.ETIQUETA_FECHASALIDA,
//                                            etiqueta: RESERVACIONES.ETIQUETA_FECHASALIDA,
//                                            componente: 'BDEdicionFecha',
//                                            longitud: 0,
//                                            decimales: 0,
//                                          ),
                                            ),
                                            SizedBox(width: 10),
                                            Expanded(
                                              child:
// Campo: Unidad Funcional. Tipo de Componente: BDBusquedaCombo
                                                  UICosa(),
//                                          UICampo(
//                                            datos: DEM.mapaReservacion,
//                                            tabla: RESERVACIONES.ETIQUETA_ENTIDAD,
//                                            campo: RESERVACIONES.UNIDADFUNCIONAL,
//                                            denominacion: RESERVACIONES.ETIQUETA_UNIDADFUNCIONAL,
//                                            etiqueta: RESERVACIONES.ETIQUETA_UNIDADFUNCIONAL,
//                                            componente: 'BDBusquedaCombo',
//                                            longitud: 0,
//                                            decimales: 0,
//
//
//                                          ),
                                            ),
                                            SizedBox(width: 10),
                                            Expanded(
                                              child:
// Campo: Adultos. Tipo de Componente: BDEdicion
                                                  UICampo(
                                                datos: DEM.mapaReservacion,
                                                tabla: RESERVACIONES
                                                    .ETIQUETA_ENTIDAD,
                                                campo: RESERVACIONES.ADULTOS,
                                                denominacion: RESERVACIONES
                                                    .ETIQUETA_ADULTOS,
                                                etiqueta: RESERVACIONES
                                                    .ETIQUETA_ADULTOS,
                                                componente: 'BDEdicion',
                                                longitud: 0,
                                                decimales: 0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 10, left: 10, right: 10),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child:
// Campo: Niños. Tipo de Componente: BDEdicion
                                                  UICampo(
                                                datos: DEM.mapaReservacion,
                                                tabla: RESERVACIONES
                                                    .ETIQUETA_ENTIDAD,
                                                campo: RESERVACIONES.NIYOS,
                                                denominacion: RESERVACIONES
                                                    .ETIQUETA_NIYOS,
                                                etiqueta: RESERVACIONES
                                                    .ETIQUETA_NIYOS,
                                                componente: 'BDEdicion',
                                                longitud: 0,
                                                decimales: 0,
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Expanded(
                                              child:
// Campo: Referencia Número. Tipo de Componente: BDEdicion
                                                  UICampo(
                                                datos: DEM.mapaReservacion,
                                                tabla: RESERVACIONES
                                                    .ETIQUETA_ENTIDAD,
                                                campo: RESERVACIONES
                                                    .REFERENCIANUMERO,
                                                denominacion: RESERVACIONES
                                                    .ETIQUETA_REFERENCIANUMERO,
                                                etiqueta: RESERVACIONES
                                                    .ETIQUETA_REFERENCIANUMERO,
                                                componente: 'BDEdicion',
                                                longitud: 20,
                                                decimales: 0,
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Expanded(
                                              child:
// Campo: Fecha de Referencia. Tipo de Componente: BDEdicionFecha
                                                  UICosa(),

//                                          UICampo(
//                                            datos: DEM.mapaReservacion,
//                                            tabla: RESERVACIONES.ETIQUETA_ENTIDAD,
//                                            campo: RESERVACIONES.FECHAREFERENCIA,
//                                            denominacion: RESERVACIONES.ETIQUETA_FECHAREFERENCIA,
//                                            etiqueta: RESERVACIONES.ETIQUETA_FECHAREFERENCIA,
//                                            componente: 'BDEdicionFecha',
//                                            longitud: 0,
//                                            decimales: 0,
//                                          ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 10, left: 10, right: 10),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child:
// Campo: Estado de la Reservación. Tipo de Componente: BDBusquedaCombo
                                                  UICosa(),

//                                          UICampo(
//                                            datos: DEM.mapaReservacion,
//                                            tabla: RESERVACIONES.ETIQUETA_ENTIDAD,
//                                            campo: RESERVACIONES.ESTADORESERVACION,
//                                            denominacion: RESERVACIONES.ETIQUETA_ESTADORESERVACION,
//                                            etiqueta: RESERVACIONES.ETIQUETA_ESTADORESERVACION,
//                                            componente: 'BDBusquedaCombo',
//                                            longitud: 0,
//                                            decimales: 0,
//                                          ),
                                            ),
//                                                SizedBox(width: 10),
//                                                Expanded(
//                                                  child:
//
//                                                ),
//
//                                                SizedBox(width: 10),
//                                                Expanded(
//                                                  child: ,
//                                                ),
                                          ],
                                        ),
                                      ),

//                                          UIBotonesGuardarBorrar(guardar: _guardar, borrar: widget.registro.id == 0 ? null : _borrar ),
                                    ],
                                  ),
                                ),
//                                    Container(
//                                      // var anchoC = 800.0;
//                                      width: anchoC - 50,
//                                      child: UIBGB(
//                                          guardar: _guardar,
//                                          borrar: widget.registro.id == 0
//                                              ? null
//                                              : _borrar),
//                                    ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              UILaterales(),
            ],
          ),
        ],
      ),
    );
  }
}

/*
NUMERORESERVACION,      String
FECHALLEGADA,           DateTime
FECHASALIDA,            DateTime
TIPOUNIDADFUNCIONAL,    TipoUnidadFuncional
UNIDADFUNCIONAL,        UnidadFuncional
ADULTOS,                int
NIYOS,                  int
REFERENCIANUMERO,       String
FECHAREFERENCIA,        DateTime
ESTADORESERVACION,      EstadoReservacion

  int id;
  Edificacion idEdificacion;
  String numeroReservacion;
  DateTime fechaLlegada;
  TimeOfDay horaLlegada;
  DateTime fechaSalida;
  TimeOfDay horaSalida;
  TipoUnidadFuncional tipoUnidadFuncional;
  UnidadFuncional unidadFuncional;
  int adultos;
  int niyos;
  String referenciaNumero;
  DateTime fechaReferencia;
  bool garantizada;
  EstadoReservacion estadoReservacion;
  String estadoactualizado;
  String notasHuesped;
  String notasReservacion;
  String notasPersonal;
 */
