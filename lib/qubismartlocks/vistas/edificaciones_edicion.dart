// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Edicion de Edificaciones
// Edicion para [Qubi Smart Locks/Qubi Smart Locks/Edificaciones]

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class FEdificacionesEdicion extends StatefulWidget {
  FEdificacionesEdicion({Key key, this.registro}) : super(key: key);

  final Edificacion registro;

  @override
  _EstadoEdificacionesEdicion createState() =>
      _EstadoEdificacionesEdicion();
}

class _EstadoEdificacionesEdicion extends State<FEdificacionesEdicion> {
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
      // al registro de Edificaciones en el widget
      widget.registro.fromMap(DEM.mapaEdificacion);

      // Guardar Edificaciones
      Resultado _resultado =
          await Edificaciones.guardar(widget.registro);
      Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
    }
  }

  void _borrar() async {
    // Borrar Edificaciones
      Resultado _resultado =
          await Edificaciones.borrar(widget.registro);
    Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
  }

  String _validarDenomEdificacion(String value) {
    _formaEditada = true;
    if (value.isEmpty)
      return campoObligatorio(EDIFICACIONES.ETIQUETA_DENOMEDIFICACION);
    widget.registro.denomEdificacion = value;
    return null;
  }

  String _validarTipoEdificacion(int value) {
    _formaEditada = true;
    // TODO: Falta validar las Claves Foraneas
    // widget.registro.tipoEdificacion.id = value;
    return null;
  }

  String _validarPersonaAdministradora(int value) {
    _formaEditada = true;
    widget.registro.personaAdministradora = value;
    return null;
  }

  String _validarPropietario(int value) {
    _formaEditada = true;
    // TODO: Falta validar las Claves Foraneas
    // widget.registro.propietario.id = value;
    return null;
  }



  @override
  Widget build(BuildContext context) {
    DEM.mapaEdificacion = widget.registro.toMap();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppRes.appResMap[Co.COLOR_FONDO_TITULO_EDICION],
        title: Text(
          //EDIFICACIONES.ETIQUETA_REGISTRO + Co.TITULO_ABRE +
              ((widget.registro.id == null) || (widget.registro.id == 0))
                  ? Co.VISTA_NUEVO_REGISTRO
                  : widget.registro.denomEdificacion,
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
// Campo: Denominación de la Edificación. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaEdificacion,
              tabla: EDIFICACIONES.ETIQUETA_ENTIDAD,
              campo: EDIFICACIONES.DENOMEDIFICACION,
              denominacion: EDIFICACIONES.ETIQUETA_DENOMEDIFICACION,
              etiqueta: EDIFICACIONES.ETIQUETA_DENOMEDIFICACION,
              componente: 'BDEdicion',
              longitud: 200,
              decimales: 0,

              validatorTexto: _validarDenomEdificacion,

            ),
// Campo: Tipo de Edificación. Tipo de Componente: BDBusquedaCombo
            UICampo(
              datos: DEM.mapaEdificacion,
              tabla: EDIFICACIONES.ETIQUETA_ENTIDAD,
              campo: EDIFICACIONES.TIPOEDIFICACION,
              denominacion: EDIFICACIONES.ETIQUETA_TIPOEDIFICACION,
              etiqueta: EDIFICACIONES.ETIQUETA_TIPOEDIFICACION,
              componente: 'BDBusquedaCombo',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Dirección. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaEdificacion,
              tabla: EDIFICACIONES.ETIQUETA_ENTIDAD,
              campo: EDIFICACIONES.DIRECCION,
              denominacion: EDIFICACIONES.ETIQUETA_DIRECCION,
              etiqueta: EDIFICACIONES.ETIQUETA_DIRECCION,
              componente: 'BDEdicion',
              longitud: 100,
              decimales: 0,


            ),
// Campo: Ubicación GPS. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaEdificacion,
              tabla: EDIFICACIONES.ETIQUETA_ENTIDAD,
              campo: EDIFICACIONES.UBICACIONGPS,
              denominacion: EDIFICACIONES.ETIQUETA_UBICACIONGPS,
              etiqueta: EDIFICACIONES.ETIQUETA_UBICACIONGPS,
              componente: 'BDEdicion',
              longitud: 30,
              decimales: 0,


            ),
// Campo: Persona Administradora. Tipo de Componente: BDBusquedaCombo
            UICampo(
              datos: DEM.mapaEdificacion,
              tabla: EDIFICACIONES.ETIQUETA_ENTIDAD,
              campo: EDIFICACIONES.PERSONAADMINISTRADORA,
              denominacion: EDIFICACIONES.ETIQUETA_PERSONAADMINISTRADORA,
              etiqueta: EDIFICACIONES.ETIQUETA_PERSONAADMINISTRADORA,
              componente: 'BDBusquedaCombo',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Propietario. Tipo de Componente: BDBusquedaCombo
            UICampo(
              datos: DEM.mapaEdificacion,
              tabla: EDIFICACIONES.ETIQUETA_ENTIDAD,
              campo: EDIFICACIONES.PROPIETARIO,
              denominacion: EDIFICACIONES.ETIQUETA_PROPIETARIO,
              etiqueta: EDIFICACIONES.ETIQUETA_PROPIETARIO,
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
