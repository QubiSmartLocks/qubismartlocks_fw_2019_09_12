// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Edicion de Room Types
// Edicion para [//Room Types]

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIRoomTypeEdicion extends StatefulWidget {
  UIRoomTypeEdicion({Key key, this.registro}) : super(key: key);

  final RoomType registro;

  @override
  _EstadoRoomTypeEdicion createState() =>
      _EstadoRoomTypeEdicion();
}

class _EstadoRoomTypeEdicion extends State<UIRoomTypeEdicion> {
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
      // al registro de RoomTypes en el widget
      widget.registro.fromMap(DEM.mapaRoomType);

      // Guardar RoomTypes
      Resultado _resultado =
          await RoomTypes.guardar(widget.registro);
      Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
    }
  }

  void _borrar() async {
    // Borrar RoomTypes
      Resultado _resultado =
          await RoomTypes.borrar(widget.registro);
    Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
  }

  String _validarname(String value) {
    _formaEditada = true;
    if (value.isEmpty)
      return campoObligatorio(ROOMTYPES.ETIQUETA_NAME);
    widget.registro.name = value;
    return null;
  }



  @override
  Widget build(BuildContext context) {
    DEM.mapaRoomType = widget.registro.toMap();

    return Container(
    width: CD.ancho *.5,
        height: CD.alto * .5,
        child: Form(
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
              datos: DEM.mapaRoomType,
              tabla: ROOMTYPES.ETIQUETA_ENTIDAD,
              campo: ROOMTYPES.NAME,
              denominacion: ROOMTYPES.ETIQUETA_NAME,
              etiqueta: ROOMTYPES.ETIQUETA_NAME,
              componente: 'BDEdicion',
              longitud: 255,
              decimales: 0,

              validatorTexto: _validarname,

            ),
// Campo: location_id. Tipo de Componente: BDEdicionNumero
            UICampo(
              datos: DEM.mapaRoomType,
              tabla: ROOMTYPES.ETIQUETA_ENTIDAD,
              campo: ROOMTYPES.LOCATION_ID,
              denominacion: ROOMTYPES.ETIQUETA_LOCATION_ID,
              etiqueta: ROOMTYPES.ETIQUETA_LOCATION_ID,
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
