// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Edicion de Unidades Funcionales
// Edicion para [//Unidades Funcionales]

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIUnidadFuncionalEdicion extends StatefulWidget {
  UIUnidadFuncionalEdicion({Key key, this.registro}) : super(key: key);

  final UnidadFuncional registro;

  @override
  _EstadoUnidadFuncionalEdicion createState() =>
      _EstadoUnidadFuncionalEdicion();
}

class _EstadoUnidadFuncionalEdicion extends State<UIUnidadFuncionalEdicion> {
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
      // al registro de UnidadesFuncionales en el widget
      widget.registro.fromMap(DEM.mapaUnidadFuncional);

      // Guardar UnidadesFuncionales
      Resultado _resultado =
          await UnidadesFuncionales.guardar(widget.registro);
      Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
    }
  }

  void _borrar() async {
    // Borrar UnidadesFuncionales
      Resultado _resultado =
          await UnidadesFuncionales.borrar(widget.registro);
    Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
  }

  String _validarEdificacion(Edificacion value) {
    _formaEditada = true;
    // TODO: Falta validar las Claves Foraneas
    // widget.registro.edificacion.id = value;
    return null;
  }

  String _validarZona(ZonaEdificacion value) {
    _formaEditada = true;
    // TODO: Falta validar las Claves Foraneas
    // widget.registro.zona.id = value;
    return null;
  }

  String _validarTipoUnidadFuncional(TipoUnidadFuncional value) {
    _formaEditada = true;
    // TODO: Falta validar las Claves Foraneas
    // widget.registro.tipoUnidadFuncional.id = value;
    return null;
  }

  String _validarDenomUnidadFuncional(String value) {
    _formaEditada = true;
    if (value.isEmpty)
      return campoObligatorio(UNIDADESFUNCIONALES.ETIQUETA_DENOMUNIDADFUNCIONAL);
    widget.registro.denomUnidadFuncional = value;
    return null;
  }



  @override
  Widget build(BuildContext context) {
    DEM.mapaUnidadFuncional = widget.registro.toMap();

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
// Campo: Edificación. Tipo de Componente: BDBusquedaCombo
            UICampo(
              datos: DEM.mapaUnidadFuncional,
              tabla: UNIDADESFUNCIONALES.ETIQUETA_ENTIDAD,
              campo: UNIDADESFUNCIONALES.EDIFICACION,
              denominacion: UNIDADESFUNCIONALES.ETIQUETA_EDIFICACION,
              etiqueta: UNIDADESFUNCIONALES.ETIQUETA_EDIFICACION,
              componente: 'BDBusquedaCombo',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Zona. Tipo de Componente: BDBusquedaCombo
            UICampo(
              datos: DEM.mapaUnidadFuncional,
              tabla: UNIDADESFUNCIONALES.ETIQUETA_ENTIDAD,
              campo: UNIDADESFUNCIONALES.ZONA,
              denominacion: UNIDADESFUNCIONALES.ETIQUETA_ZONA,
              etiqueta: UNIDADESFUNCIONALES.ETIQUETA_ZONA,
              componente: 'BDBusquedaCombo',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Tipo de Unidad Funcional. Tipo de Componente: BDBusquedaCombo
            UICampo(
              datos: DEM.mapaUnidadFuncional,
              tabla: UNIDADESFUNCIONALES.ETIQUETA_ENTIDAD,
              campo: UNIDADESFUNCIONALES.TIPOUNIDADFUNCIONAL,
              denominacion: UNIDADESFUNCIONALES.ETIQUETA_TIPOUNIDADFUNCIONAL,
              etiqueta: UNIDADESFUNCIONALES.ETIQUETA_TIPOUNIDADFUNCIONAL,
              componente: 'BDBusquedaCombo',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Denominación de la Unidad Funcional. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaUnidadFuncional,
              tabla: UNIDADESFUNCIONALES.ETIQUETA_ENTIDAD,
              campo: UNIDADESFUNCIONALES.DENOMUNIDADFUNCIONAL,
              denominacion: UNIDADESFUNCIONALES.ETIQUETA_DENOMUNIDADFUNCIONAL,
              etiqueta: UNIDADESFUNCIONALES.ETIQUETA_DENOMUNIDADFUNCIONAL,
              componente: 'BDEdicion',
              longitud: 200,
              decimales: 0,

              validatorTexto: _validarDenomUnidadFuncional,

            ),
              // UICamposObligatorios(),
              UIBotonesGuardarBorrar(guardar: _guardar, borrar: widget.registro.id == 0 ? null : _borrar ),
            ],
          ),
        ),
    );
  }
}
