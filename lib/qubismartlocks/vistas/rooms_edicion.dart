// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Edicion de Rooms
// Edicion para [Clock PMS (Api Reservaciones)/Clock PMS (Api Reservaciones)/Rooms]

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class FRoomsEdicion extends StatefulWidget {
  FRoomsEdicion({Key key, this.registro}) : super(key: key);

  final Room registro;

  @override
  _EstadoRoomsEdicion createState() =>
      _EstadoRoomsEdicion();
}

class _EstadoRoomsEdicion extends State<FRoomsEdicion> {
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
      // al registro de Rooms en el widget
      widget.registro.fromMap(DEM.mapaRoom);

      // Guardar Rooms
      Resultado _resultado =
          await Rooms.guardar(widget.registro);
      Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
    }
  }

  void _borrar() async {
    // Borrar Rooms
      Resultado _resultado =
          await Rooms.borrar(widget.registro);
    Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
  }

  String _validarname(String value) {
    _formaEditada = true;
    if (value.isEmpty)
      return campoObligatorio(ROOMS.ETIQUETA_NAME);
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
    DEM.mapaRoom = widget.registro.toMap();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppRes.appResMap[Co.COLOR_FONDO_TITULO_EDICION],
        title: Text(
          //ROOMS.ETIQUETA_REGISTRO + Co.TITULO_ABRE +
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
              datos: DEM.mapaRoom,
              tabla: ROOMS.ETIQUETA_ENTIDAD,
              campo: ROOMS.NAME,
              denominacion: ROOMS.ETIQUETA_NAME,
              etiqueta: ROOMS.ETIQUETA_NAME,
              componente: 'BDEdicion',
              longitud: 255,
              decimales: 0,

              validatorTexto: _validarname,

            ),
// Campo: room_type_id. Tipo de Componente: BDEdicionNumero
            UICampo(
              datos: DEM.mapaRoom,
              tabla: ROOMS.ETIQUETA_ENTIDAD,
              campo: ROOMS.ROOM_TYPE_ID,
              denominacion: ROOMS.ETIQUETA_ROOM_TYPE_ID,
              etiqueta: ROOMS.ETIQUETA_ROOM_TYPE_ID,
              componente: 'BDEdicionNumero',
              longitud: 0,
              decimales: 0,


            ),
// Campo: housekeeping_warning. Tipo de Componente: BDMemo
            UICampo(
              datos: DEM.mapaRoom,
              tabla: ROOMS.ETIQUETA_ENTIDAD,
              campo: ROOMS.HOUSEKEEPING_WARNING,
              denominacion: ROOMS.ETIQUETA_HOUSEKEEPING_WARNING,
              etiqueta: ROOMS.ETIQUETA_HOUSEKEEPING_WARNING,
              componente: 'BDMemo',
              longitud: 4096,
              decimales: 0,


            ),
// Campo: housekeeping_status. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaRoom,
              tabla: ROOMS.ETIQUETA_ENTIDAD,
              campo: ROOMS.HOUSEKEEPING_STATUS,
              denominacion: ROOMS.ETIQUETA_HOUSEKEEPING_STATUS,
              etiqueta: ROOMS.ETIQUETA_HOUSEKEEPING_STATUS,
              componente: 'BDEdicion',
              longitud: 255,
              decimales: 0,


            ),
// Campo: description. Tipo de Componente: BDMemo
            UICampo(
              datos: DEM.mapaRoom,
              tabla: ROOMS.ETIQUETA_ENTIDAD,
              campo: ROOMS.DESCRIPTION,
              denominacion: ROOMS.ETIQUETA_DESCRIPTION,
              etiqueta: ROOMS.ETIQUETA_DESCRIPTION,
              componente: 'BDMemo',
              longitud: 4096,
              decimales: 0,


            ),
// Campo: sort_order. Tipo de Componente: BDEdicionNumero
            UICampo(
              datos: DEM.mapaRoom,
              tabla: ROOMS.ETIQUETA_ENTIDAD,
              campo: ROOMS.SORT_ORDER,
              denominacion: ROOMS.ETIQUETA_SORT_ORDER,
              etiqueta: ROOMS.ETIQUETA_SORT_ORDER,
              componente: 'BDEdicionNumero',
              longitud: 0,
              decimales: 0,


            ),
// Campo: location_id. Tipo de Componente: BDEdicionNumero
            UICampo(
              datos: DEM.mapaRoom,
              tabla: ROOMS.ETIQUETA_ENTIDAD,
              campo: ROOMS.LOCATION_ID,
              denominacion: ROOMS.ETIQUETA_LOCATION_ID,
              etiqueta: ROOMS.ETIQUETA_LOCATION_ID,
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
