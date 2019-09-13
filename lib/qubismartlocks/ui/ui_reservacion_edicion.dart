// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Edicion de Reservaciones
// Edicion para [//Reservaciones]

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIReservacionEdicion extends StatefulWidget {
  UIReservacionEdicion({Key key, this.registro}) : super(key: key);

  final Reservacion registro;

  @override
  _EstadoReservacionEdicion createState() =>
      _EstadoReservacionEdicion();
}

class _EstadoReservacionEdicion extends State<UIReservacionEdicion> {
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
      // al registro de Reservaciones en el widget
      widget.registro.fromMap(DEM.mapaReservacion);

      // Guardar Reservaciones
      Resultado _resultado =
          await Reservaciones.guardar(widget.registro);
      Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
    }
  }

  void _borrar() async {
    // Borrar Reservaciones
      Resultado _resultado =
          await Reservaciones.borrar(widget.registro);
    Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
  }

  String _validarIdEdificacion(Edificacion value) {
    _formaEditada = true;
    // TODO: Falta validar las Claves Foraneas
    // widget.registro.idEdificacion.id = value;
    return null;
  }

  String _validarTipoUnidadFuncional(TipoUnidadFuncional value) {
    _formaEditada = true;
    // TODO: Falta validar las Claves Foraneas
    // widget.registro.tipoUnidadFuncional.id = value;
    return null;
  }

  String _validarUnidadFuncional(UnidadFuncional value) {
    _formaEditada = true;
    // TODO: Falta validar las Claves Foraneas
    // widget.registro.unidadFuncional.id = value;
    return null;
  }

  String _validarGarantizada(bool value) {
    _formaEditada = true;
    widget.registro.garantizada = value;
    return null;
  }

  String _validarEstadoReservacion(EstadoReservacion value) {
    _formaEditada = true;
    // TODO: Falta validar las Claves Foraneas
    // widget.registro.estadoReservacion.id = value;
    return null;
  }



  @override
  Widget build(BuildContext context) {
    DEM.mapaReservacion = widget.registro.toMap();

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
// Campo: Id Edificación. Tipo de Componente: BDBusquedaCombo
            UICampo(
              datos: DEM.mapaReservacion,
              tabla: RESERVACIONES.ETIQUETA_ENTIDAD,
              campo: RESERVACIONES.IDEDIFICACION,
              denominacion: RESERVACIONES.ETIQUETA_IDEDIFICACION,
              etiqueta: RESERVACIONES.ETIQUETA_IDEDIFICACION,
              componente: 'BDBusquedaCombo',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Número de Reservación. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaReservacion,
              tabla: RESERVACIONES.ETIQUETA_ENTIDAD,
              campo: RESERVACIONES.NUMERORESERVACION,
              denominacion: RESERVACIONES.ETIQUETA_NUMERORESERVACION,
              etiqueta: RESERVACIONES.ETIQUETA_NUMERORESERVACION,
              componente: 'BDEdicion',
              longitud: 20,
              decimales: 0,


            ),
// Campo: Fecha de Llegada. Tipo de Componente: BDEdicionFecha
            UICampo(
              datos: DEM.mapaReservacion,
              tabla: RESERVACIONES.ETIQUETA_ENTIDAD,
              campo: RESERVACIONES.FECHALLEGADA,
              denominacion: RESERVACIONES.ETIQUETA_FECHALLEGADA,
              etiqueta: RESERVACIONES.ETIQUETA_FECHALLEGADA,
              componente: 'BDEdicionFecha',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Hora de Llegada. Tipo de Componente: BDEdicionHora
            UICampo(
              datos: DEM.mapaReservacion,
              tabla: RESERVACIONES.ETIQUETA_ENTIDAD,
              campo: RESERVACIONES.HORALLEGADA,
              denominacion: RESERVACIONES.ETIQUETA_HORALLEGADA,
              etiqueta: RESERVACIONES.ETIQUETA_HORALLEGADA,
              componente: 'BDEdicionHora',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Fecha de Salida. Tipo de Componente: BDEdicionFecha
            UICampo(
              datos: DEM.mapaReservacion,
              tabla: RESERVACIONES.ETIQUETA_ENTIDAD,
              campo: RESERVACIONES.FECHASALIDA,
              denominacion: RESERVACIONES.ETIQUETA_FECHASALIDA,
              etiqueta: RESERVACIONES.ETIQUETA_FECHASALIDA,
              componente: 'BDEdicionFecha',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Hora de Salida. Tipo de Componente: BDEdicionHora
            UICampo(
              datos: DEM.mapaReservacion,
              tabla: RESERVACIONES.ETIQUETA_ENTIDAD,
              campo: RESERVACIONES.HORASALIDA,
              denominacion: RESERVACIONES.ETIQUETA_HORASALIDA,
              etiqueta: RESERVACIONES.ETIQUETA_HORASALIDA,
              componente: 'BDEdicionHora',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Tipo de Unidad Funcional. Tipo de Componente: BDBusquedaCombo
            UICampo(
              datos: DEM.mapaReservacion,
              tabla: RESERVACIONES.ETIQUETA_ENTIDAD,
              campo: RESERVACIONES.TIPOUNIDADFUNCIONAL,
              denominacion: RESERVACIONES.ETIQUETA_TIPOUNIDADFUNCIONAL,
              etiqueta: RESERVACIONES.ETIQUETA_TIPOUNIDADFUNCIONAL,
              componente: 'BDBusquedaCombo',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Unidad Funcional. Tipo de Componente: BDBusquedaCombo
            UICampo(
              datos: DEM.mapaReservacion,
              tabla: RESERVACIONES.ETIQUETA_ENTIDAD,
              campo: RESERVACIONES.UNIDADFUNCIONAL,
              denominacion: RESERVACIONES.ETIQUETA_UNIDADFUNCIONAL,
              etiqueta: RESERVACIONES.ETIQUETA_UNIDADFUNCIONAL,
              componente: 'BDBusquedaCombo',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Adultos. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaReservacion,
              tabla: RESERVACIONES.ETIQUETA_ENTIDAD,
              campo: RESERVACIONES.ADULTOS,
              denominacion: RESERVACIONES.ETIQUETA_ADULTOS,
              etiqueta: RESERVACIONES.ETIQUETA_ADULTOS,
              componente: 'BDEdicion',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Niños. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaReservacion,
              tabla: RESERVACIONES.ETIQUETA_ENTIDAD,
              campo: RESERVACIONES.NIYOS,
              denominacion: RESERVACIONES.ETIQUETA_NIYOS,
              etiqueta: RESERVACIONES.ETIQUETA_NIYOS,
              componente: 'BDEdicion',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Referencia Número. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaReservacion,
              tabla: RESERVACIONES.ETIQUETA_ENTIDAD,
              campo: RESERVACIONES.REFERENCIANUMERO,
              denominacion: RESERVACIONES.ETIQUETA_REFERENCIANUMERO,
              etiqueta: RESERVACIONES.ETIQUETA_REFERENCIANUMERO,
              componente: 'BDEdicion',
              longitud: 20,
              decimales: 0,


            ),
// Campo: Fecha de Referencia. Tipo de Componente: BDEdicionFecha
            UICampo(
              datos: DEM.mapaReservacion,
              tabla: RESERVACIONES.ETIQUETA_ENTIDAD,
              campo: RESERVACIONES.FECHAREFERENCIA,
              denominacion: RESERVACIONES.ETIQUETA_FECHAREFERENCIA,
              etiqueta: RESERVACIONES.ETIQUETA_FECHAREFERENCIA,
              componente: 'BDEdicionFecha',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Garantizada. Tipo de Componente: BDChequeo
            UICampo(
              datos: DEM.mapaReservacion,
              tabla: RESERVACIONES.ETIQUETA_ENTIDAD,
              campo: RESERVACIONES.GARANTIZADA,
              denominacion: RESERVACIONES.ETIQUETA_GARANTIZADA,
              etiqueta: RESERVACIONES.ETIQUETA_GARANTIZADA,
              componente: 'BDChequeo',
              longitud: 1,
              decimales: 0,


            ),
// Campo: Estado de la Reservación. Tipo de Componente: BDBusquedaCombo
            UICampo(
              datos: DEM.mapaReservacion,
              tabla: RESERVACIONES.ETIQUETA_ENTIDAD,
              campo: RESERVACIONES.ESTADORESERVACION,
              denominacion: RESERVACIONES.ETIQUETA_ESTADORESERVACION,
              etiqueta: RESERVACIONES.ETIQUETA_ESTADORESERVACION,
              componente: 'BDBusquedaCombo',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Estado actualizado el. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaReservacion,
              tabla: RESERVACIONES.ETIQUETA_ENTIDAD,
              campo: RESERVACIONES.ESTADOACTUALIZADO,
              denominacion: RESERVACIONES.ETIQUETA_ESTADOACTUALIZADO,
              etiqueta: RESERVACIONES.ETIQUETA_ESTADOACTUALIZADO,
              componente: 'BDEdicion',
              longitud: 20,
              decimales: 0,


            ),
// Campo: Notas del Huesped. Tipo de Componente: BDMemo
            UICampo(
              datos: DEM.mapaReservacion,
              tabla: RESERVACIONES.ETIQUETA_ENTIDAD,
              campo: RESERVACIONES.NOTASHUESPED,
              denominacion: RESERVACIONES.ETIQUETA_NOTASHUESPED,
              etiqueta: RESERVACIONES.ETIQUETA_NOTASHUESPED,
              componente: 'BDMemo',
              longitud: 1024,
              decimales: 0,


            ),
// Campo: Notas de Reservación. Tipo de Componente: BDMemo
            UICampo(
              datos: DEM.mapaReservacion,
              tabla: RESERVACIONES.ETIQUETA_ENTIDAD,
              campo: RESERVACIONES.NOTASRESERVACION,
              denominacion: RESERVACIONES.ETIQUETA_NOTASRESERVACION,
              etiqueta: RESERVACIONES.ETIQUETA_NOTASRESERVACION,
              componente: 'BDMemo',
              longitud: 1024,
              decimales: 0,


            ),
// Campo: Notas de Personal. Tipo de Componente: BDMemo
            UICampo(
              datos: DEM.mapaReservacion,
              tabla: RESERVACIONES.ETIQUETA_ENTIDAD,
              campo: RESERVACIONES.NOTASPERSONAL,
              denominacion: RESERVACIONES.ETIQUETA_NOTASPERSONAL,
              etiqueta: RESERVACIONES.ETIQUETA_NOTASPERSONAL,
              componente: 'BDMemo',
              longitud: 1024,
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
