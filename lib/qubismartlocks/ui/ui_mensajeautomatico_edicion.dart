// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Edicion de Mensajes Automáticos
// Edicion para [//Mensajes Automáticos]

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIMensajeAutomaticoEdicion extends StatefulWidget {
  UIMensajeAutomaticoEdicion({Key key, this.registro}) : super(key: key);

  final MensajeAutomatico registro;

  @override
  _EstadoMensajeAutomaticoEdicion createState() =>
      _EstadoMensajeAutomaticoEdicion();
}

class _EstadoMensajeAutomaticoEdicion extends State<UIMensajeAutomaticoEdicion> {
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
      // al registro de MensajesAutomaticos en el widget
      widget.registro.fromMap(DEM.mapaMensajeAutomatico);

      // Guardar MensajesAutomaticos
      Resultado _resultado =
          await MensajesAutomaticos.guardar(widget.registro);
      Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
    }
  }

  void _borrar() async {
    // Borrar MensajesAutomaticos
      Resultado _resultado =
          await MensajesAutomaticos.borrar(widget.registro);
    Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
  }

  String _validarTipoMensaje(String value) {
    _formaEditada = true;
    if (value.isEmpty)
      return campoObligatorio(MENSAJESAUTOMATICOS.ETIQUETA_TIPOMENSAJE);
    widget.registro.tipoMensaje = value;
    return null;
  }

  String _validarMensaje(String value) {
    _formaEditada = true;
    if (value.isEmpty)
      return campoObligatorio(MENSAJESAUTOMATICOS.ETIQUETA_MENSAJE);
    widget.registro.mensaje = value;
    return null;
  }



  @override
  Widget build(BuildContext context) {
    DEM.mapaMensajeAutomatico = widget.registro.toMap();

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
// Campo: Tipo de Mensaje. Tipo de Componente: BDEdicionColor
            UICampo(
              datos: DEM.mapaMensajeAutomatico,
              tabla: MENSAJESAUTOMATICOS.ETIQUETA_ENTIDAD,
              campo: MENSAJESAUTOMATICOS.TIPOMENSAJE,
              denominacion: MENSAJESAUTOMATICOS.ETIQUETA_TIPOMENSAJE,
              etiqueta: MENSAJESAUTOMATICOS.ETIQUETA_TIPOMENSAJE,
              componente: 'BDEdicionColor',
              longitud: 20,
              decimales: 0,

              validatorTexto: _validarTipoMensaje,

            ),
// Campo: Mensaje. Tipo de Componente: BDMemo
            UICampo(
              datos: DEM.mapaMensajeAutomatico,
              tabla: MENSAJESAUTOMATICOS.ETIQUETA_ENTIDAD,
              campo: MENSAJESAUTOMATICOS.MENSAJE,
              denominacion: MENSAJESAUTOMATICOS.ETIQUETA_MENSAJE,
              etiqueta: MENSAJESAUTOMATICOS.ETIQUETA_MENSAJE,
              componente: 'BDMemo',
              longitud: 1024,
              decimales: 0,

              validatorTexto: _validarMensaje,

            ),
              // UICamposObligatorios(),
              UIBotonesGuardarBorrar(guardar: _guardar, borrar: widget.registro.id == 0 ? null : _borrar ),
            ],
          ),
        ),
    );
  }
}
