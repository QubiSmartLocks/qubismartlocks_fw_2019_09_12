// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Edicion de Room Rates
// Edicion para [Clock PMS (Api Reservaciones)/Clock PMS (Api Reservaciones)/Room Rates]

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class FRoomRatesEdicion extends StatefulWidget {
  FRoomRatesEdicion({Key key, this.registro}) : super(key: key);

  final RoomRate registro;

  @override
  _EstadoRoomRatesEdicion createState() =>
      _EstadoRoomRatesEdicion();
}

class _EstadoRoomRatesEdicion extends State<FRoomRatesEdicion> {
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
      // al registro de RoomRates en el widget
      widget.registro.fromMap(DEM.mapaRoomRate);

      // Guardar RoomRates
      Resultado _resultado =
          await RoomRates.guardar(widget.registro);
      Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
    }
  }

  void _borrar() async {
    // Borrar RoomRates
      Resultado _resultado =
          await RoomRates.borrar(widget.registro);
    Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
  }

  String _validarname(String value) {
    _formaEditada = true;
    if (value.isEmpty)
      return campoObligatorio(ROOMRATES.ETIQUETA_NAME);
    widget.registro.name = value;
    return null;
  }

  String _validarroom_type_id(int value) {
    _formaEditada = true;
    widget.registro.room_type_id = value;
    return null;
  }



  @override
  Widget build(BuildContext context) {
    DEM.mapaRoomRate = widget.registro.toMap();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppRes.appResMap[Co.COLOR_FONDO_TITULO_EDICION],
        title: Text(
          //ROOMRATES.ETIQUETA_REGISTRO + Co.TITULO_ABRE +
              ((widget.registro.id == null) || (widget.registro.id == 0))
                  ? Co.VISTA_NUEVO_REGISTRO
                  : widget.registro.id,
          //    + Co.TITULO_CIERRA,
          style: estiloTituloPantalla,
        ),
        centerTitle: true,
        primary: true,
      ),
      body: Form(
          key: _forma,
          autovalidate: _autovalidar,
          onWillPop: () async {
            return await advertirDatosInvalidos(
                context, _forma.currentState, _formaEditada);
          },
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: <Widget>[
// Campo: name. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaRoomRate,
              tabla: ROOMRATES.ETIQUETA_ENTIDAD,
              campo: ROOMRATES.NAME,
              denominacion: ROOMRATES.ETIQUETA_NAME,
              etiqueta: ROOMRATES.ETIQUETA_NAME,
              componente: 'BDEdicion',
              longitud: 255,
              decimales: 0,

              validatorTexto: _validarname,

            ),
// Campo: room_type_id. Tipo de Componente: BDEdicionNumero
            UICampo(
              datos: DEM.mapaRoomRate,
              tabla: ROOMRATES.ETIQUETA_ENTIDAD,
              campo: ROOMRATES.ROOM_TYPE_ID,
              denominacion: ROOMRATES.ETIQUETA_ROOM_TYPE_ID,
              etiqueta: ROOMRATES.ETIQUETA_ROOM_TYPE_ID,
              componente: 'BDEdicionNumero',
              longitud: 0,
              decimales: 0,


            ),
// Campo: housekeeping_warning. Tipo de Componente: BDMemo
            UICampo(
              datos: DEM.mapaRoomRate,
              tabla: ROOMRATES.ETIQUETA_ENTIDAD,
              campo: ROOMRATES.HOUSEKEEPING_WARNING,
              denominacion: ROOMRATES.ETIQUETA_HOUSEKEEPING_WARNING,
              etiqueta: ROOMRATES.ETIQUETA_HOUSEKEEPING_WARNING,
              componente: 'BDMemo',
              longitud: 4096,
              decimales: 0,


            ),
// Campo: housekeeping_status. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaRoomRate,
              tabla: ROOMRATES.ETIQUETA_ENTIDAD,
              campo: ROOMRATES.HOUSEKEEPING_STATUS,
              denominacion: ROOMRATES.ETIQUETA_HOUSEKEEPING_STATUS,
              etiqueta: ROOMRATES.ETIQUETA_HOUSEKEEPING_STATUS,
              componente: 'BDEdicion',
              longitud: 255,
              decimales: 0,


            ),
// Campo: description. Tipo de Componente: BDMemo
            UICampo(
              datos: DEM.mapaRoomRate,
              tabla: ROOMRATES.ETIQUETA_ENTIDAD,
              campo: ROOMRATES.DESCRIPTION,
              denominacion: ROOMRATES.ETIQUETA_DESCRIPTION,
              etiqueta: ROOMRATES.ETIQUETA_DESCRIPTION,
              componente: 'BDMemo',
              longitud: 4096,
              decimales: 0,


            ),
// Campo: sort_order. Tipo de Componente: BDEdicionNumero
            UICampo(
              datos: DEM.mapaRoomRate,
              tabla: ROOMRATES.ETIQUETA_ENTIDAD,
              campo: ROOMRATES.SORT_ORDER,
              denominacion: ROOMRATES.ETIQUETA_SORT_ORDER,
              etiqueta: ROOMRATES.ETIQUETA_SORT_ORDER,
              componente: 'BDEdicionNumero',
              longitud: 0,
              decimales: 0,


            ),
// Campo: location_id. Tipo de Componente: BDEdicionNumero
            UICampo(
              datos: DEM.mapaRoomRate,
              tabla: ROOMRATES.ETIQUETA_ENTIDAD,
              campo: ROOMRATES.LOCATION_ID,
              denominacion: ROOMRATES.ETIQUETA_LOCATION_ID,
              etiqueta: ROOMRATES.ETIQUETA_LOCATION_ID,
              componente: 'BDEdicionNumero',
              longitud: 0,
              decimales: 0,


            ),
              // UICamposObligatorios(),
              UIBotonesGuardarBorrar(guardar: _guardar, borrar: widget.registro.id == 0 ? null : _borrar ),
            ],
          ),
        ),
    );
  }
}
