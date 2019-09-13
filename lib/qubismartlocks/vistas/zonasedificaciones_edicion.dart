// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Edicion de Zonas en Edificaciones
// Edicion para [Qubi Smart Locks/Qubi Smart Locks/Zonas en Edificaciones]

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class FZonasEdificacionesEdicion extends StatefulWidget {
  FZonasEdificacionesEdicion({Key key, this.registro}) : super(key: key);

  final ZonaEdificacion registro;

  @override
  _EstadoZonasEdificacionesEdicion createState() =>
      _EstadoZonasEdificacionesEdicion();
}

class _EstadoZonasEdificacionesEdicion extends State<FZonasEdificacionesEdicion> {
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
      // al registro de ZonasEdificaciones en el widget
      widget.registro.fromMap(DEM.mapaZonaEdificacion);

      // Guardar ZonasEdificaciones
      Resultado _resultado =
          await ZonasEdificaciones.guardar(widget.registro);
      Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
    }
  }

  void _borrar() async {
    // Borrar ZonasEdificaciones
      Resultado _resultado =
          await ZonasEdificaciones.borrar(widget.registro);
    Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
  }

  String _validarDenomZona(String value) {
    _formaEditada = true;
    if (value.isEmpty)
      return campoObligatorio(ZONASEDIFICACIONES.ETIQUETA_DENOMZONA);
    widget.registro.denomZona = value;
    return null;
  }

  String _validarPersonaAdministradora(int value) {
    _formaEditada = true;
    widget.registro.personaAdministradora = value;
    return null;
  }



  @override
  Widget build(BuildContext context) {
    DEM.mapaZonaEdificacion = widget.registro.toMap();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppRes.appResMap[Co.COLOR_FONDO_TITULO_EDICION],
        title: Text(
          //ZONASEDIFICACIONES.ETIQUETA_REGISTRO + Co.TITULO_ABRE +
              ((widget.registro.id == null) || (widget.registro.id == 0))
                  ? Co.VISTA_NUEVO_REGISTRO
                  : widget.registro.edificacion,
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
// Campo: Denominación de la Zona. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaZonaEdificacion,
              tabla: ZONASEDIFICACIONES.ETIQUETA_ENTIDAD,
              campo: ZONASEDIFICACIONES.DENOMZONA,
              denominacion: ZONASEDIFICACIONES.ETIQUETA_DENOMZONA,
              etiqueta: ZONASEDIFICACIONES.ETIQUETA_DENOMZONA,
              componente: 'BDEdicion',
              longitud: 200,
              decimales: 0,

              validatorTexto: _validarDenomZona,

            ),
// Campo: Identificación de la Zona. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaZonaEdificacion,
              tabla: ZONASEDIFICACIONES.ETIQUETA_ENTIDAD,
              campo: ZONASEDIFICACIONES.IDENTZONA,
              denominacion: ZONASEDIFICACIONES.ETIQUETA_IDENTZONA,
              etiqueta: ZONASEDIFICACIONES.ETIQUETA_IDENTZONA,
              componente: 'BDEdicion',
              longitud: 4096,
              decimales: 0,


            ),
// Campo: Persona Administradora. Tipo de Componente: BDBusquedaCombo
            UICampo(
              datos: DEM.mapaZonaEdificacion,
              tabla: ZONASEDIFICACIONES.ETIQUETA_ENTIDAD,
              campo: ZONASEDIFICACIONES.PERSONAADMINISTRADORA,
              denominacion: ZONASEDIFICACIONES.ETIQUETA_PERSONAADMINISTRADORA,
              etiqueta: ZONASEDIFICACIONES.ETIQUETA_PERSONAADMINISTRADORA,
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
