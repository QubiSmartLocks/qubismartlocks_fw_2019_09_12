// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Edicion de Estados de Reservaciones
// Edicion para [Qubi Smart Locks/Qubi Smart Locks/Estados de Reservaciones]

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class FEstadosReservacionesEdicion extends StatefulWidget {
  FEstadosReservacionesEdicion({Key key, this.registro}) : super(key: key);

  final EstadoReservacion registro;

  @override
  _EstadoEstadosReservacionesEdicion createState() =>
      _EstadoEstadosReservacionesEdicion();
}

class _EstadoEstadosReservacionesEdicion extends State<FEstadosReservacionesEdicion> {
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
      // al registro de EstadosReservaciones en el widget
      widget.registro.fromMap(DEM.mapaEstadoReservacion);

      // Guardar EstadosReservaciones
      Resultado _resultado =
          await EstadosReservaciones.guardar(widget.registro);
      Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
    }
  }

  void _borrar() async {
    // Borrar EstadosReservaciones
      Resultado _resultado =
          await EstadosReservaciones.borrar(widget.registro);
    Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
  }

  String _validarDenomEstadoReservacion(String value) {
    _formaEditada = true;
    if (value.isEmpty)
      return campoObligatorio(ESTADOSRESERVACIONES.ETIQUETA_DENOMESTADORESERVACION);
    widget.registro.denomEstadoReservacion = value;
    return null;
  }

  String _validarVisible(bool value) {
    _formaEditada = true;
    widget.registro.visible = value;
    return null;
  }



  @override
  Widget build(BuildContext context) {
    DEM.mapaEstadoReservacion = widget.registro.toMap();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppRes.appResMap[Co.COLOR_FONDO_TITULO_EDICION],
        title: Text(
          //ESTADOSRESERVACIONES.ETIQUETA_REGISTRO + Co.TITULO_ABRE +
              ((widget.registro.id == null) || (widget.registro.id == 0))
                  ? Co.VISTA_NUEVO_REGISTRO
                  : widget.registro.denomEstadoReservacion,
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
// Campo: Denominación del Estado de Reservación. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaEstadoReservacion,
              tabla: ESTADOSRESERVACIONES.ETIQUETA_ENTIDAD,
              campo: ESTADOSRESERVACIONES.DENOMESTADORESERVACION,
              denominacion: ESTADOSRESERVACIONES.ETIQUETA_DENOMESTADORESERVACION,
              etiqueta: ESTADOSRESERVACIONES.ETIQUETA_DENOMESTADORESERVACION,
              componente: 'BDEdicion',
              longitud: 200,
              decimales: 0,

              validatorTexto: _validarDenomEstadoReservacion,

            ),
// Campo: Descripción del Estado de Reservación. Tipo de Componente: BDMemo
            UICampo(
              datos: DEM.mapaEstadoReservacion,
              tabla: ESTADOSRESERVACIONES.ETIQUETA_ENTIDAD,
              campo: ESTADOSRESERVACIONES.DESCESTADORESERVACION,
              denominacion: ESTADOSRESERVACIONES.ETIQUETA_DESCESTADORESERVACION,
              etiqueta: ESTADOSRESERVACIONES.ETIQUETA_DESCESTADORESERVACION,
              componente: 'BDMemo',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Visible. Tipo de Componente: BDChequeo
            UICampo(
              datos: DEM.mapaEstadoReservacion,
              tabla: ESTADOSRESERVACIONES.ETIQUETA_ENTIDAD,
              campo: ESTADOSRESERVACIONES.VISIBLE,
              denominacion: ESTADOSRESERVACIONES.ETIQUETA_VISIBLE,
              etiqueta: ESTADOSRESERVACIONES.ETIQUETA_VISIBLE,
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
