// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Edicion de Paquetería
// Edicion para [//Paquetería]

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIPaqueteEdicion extends StatefulWidget {
  UIPaqueteEdicion({Key key, this.registro}) : super(key: key);

  final Paquete registro;

  @override
  _EstadoPaqueteEdicion createState() =>
      _EstadoPaqueteEdicion();
}

class _EstadoPaqueteEdicion extends State<UIPaqueteEdicion> {
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
      // al registro de Paqueteria en el widget
      widget.registro.fromMap(DEM.mapaPaquete);

      // Guardar Paqueteria
      Resultado _resultado =
          await Paqueteria.guardar(widget.registro);
      Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
    }
  }

  void _borrar() async {
    // Borrar Paqueteria
      Resultado _resultado =
          await Paqueteria.borrar(widget.registro);
    Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
  }

  String _validarOrigenPaquete(OrigenPaquete value) {
    _formaEditada = true;
    // TODO: Falta validar las Claves Foraneas
    // widget.registro.origenPaquete.id = value;
    return null;
  }

  String _validarFechaHoraEntregado(String value) {
    _formaEditada = true;
    if (value.isEmpty)
      return campoObligatorio(PAQUETERIA.ETIQUETA_FECHAHORAENTREGADO);
    widget.registro.fechaHoraEntregado = value;
    return null;
  }

  String _validarPasajero(Pasajero value) {
    _formaEditada = true;
    // TODO: Falta validar las Claves Foraneas
    // widget.registro.pasajero.id = value;
    return null;
  }

  String _validarRecepcionista(int value) {
    _formaEditada = true;
    widget.registro.recepcionista = value;
    return null;
  }

  String _validarMensajeenviado(bool value) {
    _formaEditada = true;
    widget.registro.mensajeenviado = value;
    return null;
  }



  @override
  Widget build(BuildContext context) {
    DEM.mapaPaquete = widget.registro.toMap();

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
// Campo: Origen del Paquete. Tipo de Componente: BDBusquedaCombo
            UICampo(
              datos: DEM.mapaPaquete,
              tabla: PAQUETERIA.ETIQUETA_ENTIDAD,
              campo: PAQUETERIA.ORIGENPAQUETE,
              denominacion: PAQUETERIA.ETIQUETA_ORIGENPAQUETE,
              etiqueta: PAQUETERIA.ETIQUETA_ORIGENPAQUETE,
              componente: 'BDBusquedaCombo',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Número de Rastreo. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaPaquete,
              tabla: PAQUETERIA.ETIQUETA_ENTIDAD,
              campo: PAQUETERIA.NUMERORASTREO,
              denominacion: PAQUETERIA.ETIQUETA_NUMERORASTREO,
              etiqueta: PAQUETERIA.ETIQUETA_NUMERORASTREO,
              componente: 'BDEdicion',
              longitud: 20,
              decimales: 0,


            ),
// Campo: Destinatario. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaPaquete,
              tabla: PAQUETERIA.ETIQUETA_ENTIDAD,
              campo: PAQUETERIA.DESTINATARIO,
              denominacion: PAQUETERIA.ETIQUETA_DESTINATARIO,
              etiqueta: PAQUETERIA.ETIQUETA_DESTINATARIO,
              componente: 'BDEdicion',
              longitud: 20,
              decimales: 0,


            ),
// Campo: Fecha y Hora de Recepción. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaPaquete,
              tabla: PAQUETERIA.ETIQUETA_ENTIDAD,
              campo: PAQUETERIA.FECHAHORARECEPCION,
              denominacion: PAQUETERIA.ETIQUETA_FECHAHORARECEPCION,
              etiqueta: PAQUETERIA.ETIQUETA_FECHAHORARECEPCION,
              componente: 'BDEdicion',
              longitud: 20,
              decimales: 0,


            ),
// Campo: Nota de Recepción. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaPaquete,
              tabla: PAQUETERIA.ETIQUETA_ENTIDAD,
              campo: PAQUETERIA.NOTARECEPCION,
              denominacion: PAQUETERIA.ETIQUETA_NOTARECEPCION,
              etiqueta: PAQUETERIA.ETIQUETA_NOTARECEPCION,
              componente: 'BDEdicion',
              longitud: 200,
              decimales: 0,


            ),
// Campo: Nota del Destinatario. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaPaquete,
              tabla: PAQUETERIA.ETIQUETA_ENTIDAD,
              campo: PAQUETERIA.NOTADESTINATARIO,
              denominacion: PAQUETERIA.ETIQUETA_NOTADESTINATARIO,
              etiqueta: PAQUETERIA.ETIQUETA_NOTADESTINATARIO,
              componente: 'BDEdicion',
              longitud: 200,
              decimales: 0,


            ),
// Campo: Fecha y Hora Entregado. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaPaquete,
              tabla: PAQUETERIA.ETIQUETA_ENTIDAD,
              campo: PAQUETERIA.FECHAHORAENTREGADO,
              denominacion: PAQUETERIA.ETIQUETA_FECHAHORAENTREGADO,
              etiqueta: PAQUETERIA.ETIQUETA_FECHAHORAENTREGADO,
              componente: 'BDEdicion',
              longitud: 20,
              decimales: 0,

              validatorTexto: _validarFechaHoraEntregado,

            ),
// Campo: Pasajero. Tipo de Componente: BDBusquedaCombo
            UICampo(
              datos: DEM.mapaPaquete,
              tabla: PAQUETERIA.ETIQUETA_ENTIDAD,
              campo: PAQUETERIA.PASAJERO,
              denominacion: PAQUETERIA.ETIQUETA_PASAJERO,
              etiqueta: PAQUETERIA.ETIQUETA_PASAJERO,
              componente: 'BDBusquedaCombo',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Recibido por Pasajero. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaPaquete,
              tabla: PAQUETERIA.ETIQUETA_ENTIDAD,
              campo: PAQUETERIA.RECIBIDOPASAJERO,
              denominacion: PAQUETERIA.ETIQUETA_RECIBIDOPASAJERO,
              etiqueta: PAQUETERIA.ETIQUETA_RECIBIDOPASAJERO,
              componente: 'BDEdicion',
              longitud: 20,
              decimales: 0,


            ),
// Campo: Recepcionista. Tipo de Componente: BDBusquedaCombo
            UICampo(
              datos: DEM.mapaPaquete,
              tabla: PAQUETERIA.ETIQUETA_ENTIDAD,
              campo: PAQUETERIA.RECEPCIONISTA,
              denominacion: PAQUETERIA.ETIQUETA_RECEPCIONISTA,
              etiqueta: PAQUETERIA.ETIQUETA_RECEPCIONISTA,
              componente: 'BDBusquedaCombo',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Mensaje enviado. Tipo de Componente: BDChequeo
            UICampo(
              datos: DEM.mapaPaquete,
              tabla: PAQUETERIA.ETIQUETA_ENTIDAD,
              campo: PAQUETERIA.MENSAJEENVIADO,
              denominacion: PAQUETERIA.ETIQUETA_MENSAJEENVIADO,
              etiqueta: PAQUETERIA.ETIQUETA_MENSAJEENVIADO,
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
