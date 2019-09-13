// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Edicion de Cerraduras
// Edicion para [//Cerraduras]

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UICerraduraEdicion extends StatefulWidget {
  UICerraduraEdicion({Key key, this.registro}) : super(key: key);

  final Cerradura registro;

  @override
  _EstadoCerraduraEdicion createState() =>
      _EstadoCerraduraEdicion();
}

class _EstadoCerraduraEdicion extends State<UICerraduraEdicion> {
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
      // al registro de Cerraduras en el widget
      widget.registro.fromMap(DEM.mapaCerradura);

      // Guardar Cerraduras
      Resultado _resultado =
          await Cerraduras.guardar(widget.registro);
      Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
    }
  }

  void _borrar() async {
    // Borrar Cerraduras
      Resultado _resultado =
          await Cerraduras.borrar(widget.registro);
    Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
  }

  String _validarMarca(MarcaCerradura value) {
    _formaEditada = true;
    // TODO: Falta validar las Claves Foraneas
    // widget.registro.marca.id = value;
    return null;
  }

  String _validarModelo(ModeloCerradura value) {
    _formaEditada = true;
    // TODO: Falta validar las Claves Foraneas
    // widget.registro.modelo.id = value;
    return null;
  }

  String _validarDenomCerradura(String value) {
    _formaEditada = true;
    if (value.isEmpty)
      return campoObligatorio(CERRADURAS.ETIQUETA_DENOMCERRADURA);
    widget.registro.denomCerradura = value;
    return null;
  }

  String _validarSerial(String value) {
    _formaEditada = true;
    if (value.isEmpty)
      return campoObligatorio(CERRADURAS.ETIQUETA_SERIAL);
    widget.registro.serial = value;
    return null;
  }

  String _validarUnidadFuncional(UnidadFuncional value) {
    _formaEditada = true;
    // TODO: Falta validar las Claves Foraneas
    // widget.registro.unidadFuncional.id = value;
    return null;
  }

  String _validarEstadoCerradura(EstadoCerradura value) {
    _formaEditada = true;
    // TODO: Falta validar las Claves Foraneas
    // widget.registro.estadoCerradura.id = value;
    return null;
  }



  @override
  Widget build(BuildContext context) {
    DEM.mapaCerradura = widget.registro.toMap();

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
// Campo: Marca. Tipo de Componente: BDBusquedaCombo
            UICampo(
              datos: DEM.mapaCerradura,
              tabla: CERRADURAS.ETIQUETA_ENTIDAD,
              campo: CERRADURAS.MARCA,
              denominacion: CERRADURAS.ETIQUETA_MARCA,
              etiqueta: CERRADURAS.ETIQUETA_MARCA,
              componente: 'BDBusquedaCombo',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Modelo. Tipo de Componente: BDBusquedaCombo
            UICampo(
              datos: DEM.mapaCerradura,
              tabla: CERRADURAS.ETIQUETA_ENTIDAD,
              campo: CERRADURAS.MODELO,
              denominacion: CERRADURAS.ETIQUETA_MODELO,
              etiqueta: CERRADURAS.ETIQUETA_MODELO,
              componente: 'BDBusquedaCombo',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Denominación de la Cerradura. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaCerradura,
              tabla: CERRADURAS.ETIQUETA_ENTIDAD,
              campo: CERRADURAS.DENOMCERRADURA,
              denominacion: CERRADURAS.ETIQUETA_DENOMCERRADURA,
              etiqueta: CERRADURAS.ETIQUETA_DENOMCERRADURA,
              componente: 'BDEdicion',
              longitud: 200,
              decimales: 0,

              validatorTexto: _validarDenomCerradura,

            ),
// Campo: Serial. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaCerradura,
              tabla: CERRADURAS.ETIQUETA_ENTIDAD,
              campo: CERRADURAS.SERIAL,
              denominacion: CERRADURAS.ETIQUETA_SERIAL,
              etiqueta: CERRADURAS.ETIQUETA_SERIAL,
              componente: 'BDEdicion',
              longitud: 30,
              decimales: 0,

              validatorTexto: _validarSerial,

            ),
// Campo: Unidad Funcional. Tipo de Componente: BDBusquedaCombo
            UICampo(
              datos: DEM.mapaCerradura,
              tabla: CERRADURAS.ETIQUETA_ENTIDAD,
              campo: CERRADURAS.UNIDADFUNCIONAL,
              denominacion: CERRADURAS.ETIQUETA_UNIDADFUNCIONAL,
              etiqueta: CERRADURAS.ETIQUETA_UNIDADFUNCIONAL,
              componente: 'BDBusquedaCombo',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Estado de la Cerradura. Tipo de Componente: BDBusquedaCombo
            UICampo(
              datos: DEM.mapaCerradura,
              tabla: CERRADURAS.ETIQUETA_ENTIDAD,
              campo: CERRADURAS.ESTADOCERRADURA,
              denominacion: CERRADURAS.ETIQUETA_ESTADOCERRADURA,
              etiqueta: CERRADURAS.ETIQUETA_ESTADOCERRADURA,
              componente: 'BDBusquedaCombo',
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
