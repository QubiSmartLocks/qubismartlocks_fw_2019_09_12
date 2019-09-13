// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Edicion de Mensajes
// Edicion para [//Mensajes]

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIMensajeEdicion extends StatefulWidget {
  UIMensajeEdicion({Key key, this.registro}) : super(key: key);

  final Mensaje registro;

  @override
  _EstadoMensajeEdicion createState() =>
      _EstadoMensajeEdicion();
}

class _EstadoMensajeEdicion extends State<UIMensajeEdicion> {
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
      // al registro de Mensajes en el widget
      widget.registro.fromMap(DEM.mapaMensaje);

      // Guardar Mensajes
      Resultado _resultado =
          await Mensajes.guardar(widget.registro);
      Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
    }
  }

  void _borrar() async {
    // Borrar Mensajes
      Resultado _resultado =
          await Mensajes.borrar(widget.registro);
    Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
  }

  String _validarConversacion(Conversacion value) {
    _formaEditada = true;
    // TODO: Falta validar las Claves Foraneas
    // widget.registro.conversacion.id = value;
    return null;
  }

  String _validarParticipante(Participante value) {
    _formaEditada = true;
    // TODO: Falta validar las Claves Foraneas
    // widget.registro.participante.id = value;
    return null;
  }

  String _validarMomento(DateTime value) {
    _formaEditada = true;
    widget.registro.momento = value;
    return null;
  }

  String _validarMensajeTexto(String value) {
    _formaEditada = true;
    if (value.isEmpty)
      return campoObligatorio(MENSAJES.ETIQUETA_MENSAJETEXTO);
    widget.registro.mensajeTexto = value;
    return null;
  }



  @override
  Widget build(BuildContext context) {
    DEM.mapaMensaje = widget.registro.toMap();

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
// Campo: Conversación. Tipo de Componente: BDBusquedaCombo
            UICampo(
              datos: DEM.mapaMensaje,
              tabla: MENSAJES.ETIQUETA_ENTIDAD,
              campo: MENSAJES.CONVERSACION,
              denominacion: MENSAJES.ETIQUETA_CONVERSACION,
              etiqueta: MENSAJES.ETIQUETA_CONVERSACION,
              componente: 'BDBusquedaCombo',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Participante. Tipo de Componente: BDBusquedaCombo
            UICampo(
              datos: DEM.mapaMensaje,
              tabla: MENSAJES.ETIQUETA_ENTIDAD,
              campo: MENSAJES.PARTICIPANTE,
              denominacion: MENSAJES.ETIQUETA_PARTICIPANTE,
              etiqueta: MENSAJES.ETIQUETA_PARTICIPANTE,
              componente: 'BDBusquedaCombo',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Momento. Tipo de Componente: BDEdicionMomento
            UICampo(
              datos: DEM.mapaMensaje,
              tabla: MENSAJES.ETIQUETA_ENTIDAD,
              campo: MENSAJES.MOMENTO,
              denominacion: MENSAJES.ETIQUETA_MOMENTO,
              etiqueta: MENSAJES.ETIQUETA_MOMENTO,
              componente: 'BDEdicionMomento',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Mensaje de Texto. Tipo de Componente: BDMemo
            UICampo(
              datos: DEM.mapaMensaje,
              tabla: MENSAJES.ETIQUETA_ENTIDAD,
              campo: MENSAJES.MENSAJETEXTO,
              denominacion: MENSAJES.ETIQUETA_MENSAJETEXTO,
              etiqueta: MENSAJES.ETIQUETA_MENSAJETEXTO,
              componente: 'BDMemo',
              longitud: 1024,
              decimales: 0,

              validatorTexto: _validarMensajeTexto,

            ),
// Campo: Key Conversación. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaMensaje,
              tabla: MENSAJES.ETIQUETA_ENTIDAD,
              campo: MENSAJES.KEYCONVERSACION,
              denominacion: MENSAJES.ETIQUETA_KEYCONVERSACION,
              etiqueta: MENSAJES.ETIQUETA_KEYCONVERSACION,
              componente: 'BDEdicion',
              longitud: 30,
              decimales: 0,


            ),
// Campo: Key Participante. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaMensaje,
              tabla: MENSAJES.ETIQUETA_ENTIDAD,
              campo: MENSAJES.KEYPARTICIPANTE,
              denominacion: MENSAJES.ETIQUETA_KEYPARTICIPANTE,
              etiqueta: MENSAJES.ETIQUETA_KEYPARTICIPANTE,
              componente: 'BDEdicion',
              longitud: 30,
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
