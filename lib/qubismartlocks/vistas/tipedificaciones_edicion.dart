// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Edicion de Tipos de Edificaciones
// Edicion para [Qubi Smart Locks/Qubi Smart Locks/Tipos de Edificaciones]

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class FTipEdificacionesEdicion extends StatefulWidget {
  FTipEdificacionesEdicion({Key key, this.registro}) : super(key: key);

  final TipoEdificacion registro;

  @override
  _EstadoTipEdificacionesEdicion createState() =>
      _EstadoTipEdificacionesEdicion();
}

class _EstadoTipEdificacionesEdicion extends State<FTipEdificacionesEdicion> {
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
      // al registro de TiposEdificaciones en el widget
      widget.registro.fromMap(DEM.mapaTipoEdificacion);

      // Guardar TiposEdificaciones
      Resultado _resultado =
          await TiposEdificaciones.guardar(widget.registro);
      Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
    }
  }

  void _borrar() async {
    // Borrar TiposEdificaciones
      Resultado _resultado =
          await TiposEdificaciones.borrar(widget.registro);
    Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
  }

  String _validarDenomTipoEdificacion(String value) {
    _formaEditada = true;
    if (value.isEmpty)
      return campoObligatorio(TIPOSEDIFICACIONES.ETIQUETA_DENOMTIPOEDIFICACION);
    widget.registro.denomTipoEdificacion = value;
    return null;
  }

  String _validarSeZonifica(bool value) {
    _formaEditada = true;
    widget.registro.seZonifica = value;
    return null;
  }

  String _validarTieneMultiplesUnidadesFuncionales(bool value) {
    _formaEditada = true;
    widget.registro.tieneMultiplesUnidadesFuncionales = value;
    return null;
  }



  @override
  Widget build(BuildContext context) {
    DEM.mapaTipoEdificacion = widget.registro.toMap();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppRes.appResMap[Co.COLOR_FONDO_TITULO_EDICION],
        title: Text(
          //TIPOSEDIFICACIONES.ETIQUETA_REGISTRO + Co.TITULO_ABRE +
              ((widget.registro.id == null) || (widget.registro.id == 0))
                  ? Co.VISTA_NUEVO_REGISTRO
                  : widget.registro.denomTipoEdificacion,
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
// Campo: Denominación del Tipo de Edificación. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaTipoEdificacion,
              tabla: TIPOSEDIFICACIONES.ETIQUETA_ENTIDAD,
              campo: TIPOSEDIFICACIONES.DENOMTIPOEDIFICACION,
              denominacion: TIPOSEDIFICACIONES.ETIQUETA_DENOMTIPOEDIFICACION,
              etiqueta: TIPOSEDIFICACIONES.ETIQUETA_DENOMTIPOEDIFICACION,
              componente: 'BDEdicion',
              longitud: 200,
              decimales: 0,

              validatorTexto: _validarDenomTipoEdificacion,

            ),
// Campo: Descripción del Tipo de Edificación. Tipo de Componente: BDMemo
            UICampo(
              datos: DEM.mapaTipoEdificacion,
              tabla: TIPOSEDIFICACIONES.ETIQUETA_ENTIDAD,
              campo: TIPOSEDIFICACIONES.DESCTIPOEDIFICACION,
              denominacion: TIPOSEDIFICACIONES.ETIQUETA_DESCTIPOEDIFICACION,
              etiqueta: TIPOSEDIFICACIONES.ETIQUETA_DESCTIPOEDIFICACION,
              componente: 'BDMemo',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Se Zonifica. Tipo de Componente: BDChequeo
            UICampo(
              datos: DEM.mapaTipoEdificacion,
              tabla: TIPOSEDIFICACIONES.ETIQUETA_ENTIDAD,
              campo: TIPOSEDIFICACIONES.SEZONIFICA,
              denominacion: TIPOSEDIFICACIONES.ETIQUETA_SEZONIFICA,
              etiqueta: TIPOSEDIFICACIONES.ETIQUETA_SEZONIFICA,
              componente: 'BDChequeo',
              longitud: 1,
              decimales: 0,


            ),
// Campo: Tiene Múltiples Unidades Funcionales. Tipo de Componente: BDChequeo
            UICampo(
              datos: DEM.mapaTipoEdificacion,
              tabla: TIPOSEDIFICACIONES.ETIQUETA_ENTIDAD,
              campo: TIPOSEDIFICACIONES.TIENEMULTIPLESUNIDADESFUNCIONALES,
              denominacion: TIPOSEDIFICACIONES.ETIQUETA_TIENEMULTIPLESUNIDADESFUNCIONALES,
              etiqueta: TIPOSEDIFICACIONES.ETIQUETA_TIENEMULTIPLESUNIDADESFUNCIONALES,
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
