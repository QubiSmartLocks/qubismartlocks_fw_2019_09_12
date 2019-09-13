// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Edicion de Estados de Cerraduras
// Edicion para [//Estados de Cerraduras]

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIEstadoCerraduraEdicion extends StatefulWidget {
  UIEstadoCerraduraEdicion({Key key, this.registro}) : super(key: key);

  final EstadoCerradura registro;

  @override
  _EstadoEstadoCerraduraEdicion createState() =>
      _EstadoEstadoCerraduraEdicion();
}

class _EstadoEstadoCerraduraEdicion extends State<UIEstadoCerraduraEdicion> {
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
      // al registro de EstadosCerraduras en el widget
      widget.registro.fromMap(DEM.mapaEstadoCerradura);

      // Guardar EstadosCerraduras
      Resultado _resultado =
          await EstadosCerraduras.guardar(widget.registro);
      Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
    }
  }

  void _borrar() async {
    // Borrar EstadosCerraduras
      Resultado _resultado =
          await EstadosCerraduras.borrar(widget.registro);
    Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
  }

  String _validarDenomEstadoCerradura(String value) {
    _formaEditada = true;
    if (value.isEmpty)
      return campoObligatorio(ESTADOSCERRADURAS.ETIQUETA_DENOMESTADOCERRADURA);
    widget.registro.denomEstadoCerradura = value;
    return null;
  }

  String _validarActiva(bool value) {
    _formaEditada = true;
    widget.registro.activa = value;
    return null;
  }



  @override
  Widget build(BuildContext context) {
    DEM.mapaEstadoCerradura = widget.registro.toMap();

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
// Campo: Denominación del Estado de Cerradura. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaEstadoCerradura,
              tabla: ESTADOSCERRADURAS.ETIQUETA_ENTIDAD,
              campo: ESTADOSCERRADURAS.DENOMESTADOCERRADURA,
              denominacion: ESTADOSCERRADURAS.ETIQUETA_DENOMESTADOCERRADURA,
              etiqueta: ESTADOSCERRADURAS.ETIQUETA_DENOMESTADOCERRADURA,
              componente: 'BDEdicion',
              longitud: 200,
              decimales: 0,

              validatorTexto: _validarDenomEstadoCerradura,

            ),
// Campo: Activa. Tipo de Componente: BDChequeo
            UICampo(
              datos: DEM.mapaEstadoCerradura,
              tabla: ESTADOSCERRADURAS.ETIQUETA_ENTIDAD,
              campo: ESTADOSCERRADURAS.ACTIVA,
              denominacion: ESTADOSCERRADURAS.ETIQUETA_ACTIVA,
              etiqueta: ESTADOSCERRADURAS.ETIQUETA_ACTIVA,
              componente: 'BDChequeo',
              longitud: 1,
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
