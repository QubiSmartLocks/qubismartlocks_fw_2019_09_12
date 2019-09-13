// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Edicion de Opciones de Mensajería
// Edicion para [//Opciones de Mensajería]

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIOpcionMensajeriaEdicion extends StatefulWidget {
  UIOpcionMensajeriaEdicion({Key key, this.registro}) : super(key: key);

  final OpcionMensajeria registro;

  @override
  _EstadoOpcionMensajeriaEdicion createState() =>
      _EstadoOpcionMensajeriaEdicion();
}

class _EstadoOpcionMensajeriaEdicion extends State<UIOpcionMensajeriaEdicion> {
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
      // al registro de OpcionesMensajeria en el widget
      widget.registro.fromMap(DEM.mapaOpcionMensajeria);

      // Guardar OpcionesMensajeria
      Resultado _resultado =
          await OpcionesMensajeria.guardar(widget.registro);
      Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
    }
  }

  void _borrar() async {
    // Borrar OpcionesMensajeria
      Resultado _resultado =
          await OpcionesMensajeria.borrar(widget.registro);
    Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
  }

  String _validarParticipanteAutomatico(Participante value) {
    _formaEditada = true;
    // TODO: Falta validar las Claves Foraneas
    // widget.registro.participanteAutomatico.id = value;
    return null;
  }

  String _validarBienvenida(MensajeAutomatico value) {
    _formaEditada = true;
    // TODO: Falta validar las Claves Foraneas
    // widget.registro.bienvenida.id = value;
    return null;
  }

  String _validarDespedida(MensajeAutomatico value) {
    _formaEditada = true;
    // TODO: Falta validar las Claves Foraneas
    // widget.registro.despedida.id = value;
    return null;
  }

  String _validarPaquete(MensajeAutomatico value) {
    _formaEditada = true;
    // TODO: Falta validar las Claves Foraneas
    // widget.registro.paquete.id = value;
    return null;
  }

  String _validarProximoCheckIn(MensajeAutomatico value) {
    _formaEditada = true;
    // TODO: Falta validar las Claves Foraneas
    // widget.registro.proximoCheckIn.id = value;
    return null;
  }

  String _validarProximoCheckOut(MensajeAutomatico value) {
    _formaEditada = true;
    // TODO: Falta validar las Claves Foraneas
    // widget.registro.proximoCheckOut.id = value;
    return null;
  }



  @override
  Widget build(BuildContext context) {
    DEM.mapaOpcionMensajeria = widget.registro.toMap();

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
// Campo: Participante Automático. Tipo de Componente: BDBusquedaCombo
            UICampo(
              datos: DEM.mapaOpcionMensajeria,
              tabla: OPCIONESMENSAJERIA.ETIQUETA_ENTIDAD,
              campo: OPCIONESMENSAJERIA.PARTICIPANTEAUTOMATICO,
              denominacion: OPCIONESMENSAJERIA.ETIQUETA_PARTICIPANTEAUTOMATICO,
              etiqueta: OPCIONESMENSAJERIA.ETIQUETA_PARTICIPANTEAUTOMATICO,
              componente: 'BDBusquedaCombo',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Bienvenida. Tipo de Componente: BDBusquedaCombo
            UICampo(
              datos: DEM.mapaOpcionMensajeria,
              tabla: OPCIONESMENSAJERIA.ETIQUETA_ENTIDAD,
              campo: OPCIONESMENSAJERIA.BIENVENIDA,
              denominacion: OPCIONESMENSAJERIA.ETIQUETA_BIENVENIDA,
              etiqueta: OPCIONESMENSAJERIA.ETIQUETA_BIENVENIDA,
              componente: 'BDBusquedaCombo',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Despedida. Tipo de Componente: BDBusquedaCombo
            UICampo(
              datos: DEM.mapaOpcionMensajeria,
              tabla: OPCIONESMENSAJERIA.ETIQUETA_ENTIDAD,
              campo: OPCIONESMENSAJERIA.DESPEDIDA,
              denominacion: OPCIONESMENSAJERIA.ETIQUETA_DESPEDIDA,
              etiqueta: OPCIONESMENSAJERIA.ETIQUETA_DESPEDIDA,
              componente: 'BDBusquedaCombo',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Paquete. Tipo de Componente: BDBusquedaCombo
            UICampo(
              datos: DEM.mapaOpcionMensajeria,
              tabla: OPCIONESMENSAJERIA.ETIQUETA_ENTIDAD,
              campo: OPCIONESMENSAJERIA.PAQUETE,
              denominacion: OPCIONESMENSAJERIA.ETIQUETA_PAQUETE,
              etiqueta: OPCIONESMENSAJERIA.ETIQUETA_PAQUETE,
              componente: 'BDBusquedaCombo',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Próximo Check In. Tipo de Componente: BDBusquedaCombo
            UICampo(
              datos: DEM.mapaOpcionMensajeria,
              tabla: OPCIONESMENSAJERIA.ETIQUETA_ENTIDAD,
              campo: OPCIONESMENSAJERIA.PROXIMOCHECKIN,
              denominacion: OPCIONESMENSAJERIA.ETIQUETA_PROXIMOCHECKIN,
              etiqueta: OPCIONESMENSAJERIA.ETIQUETA_PROXIMOCHECKIN,
              componente: 'BDBusquedaCombo',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Próximo Check Out. Tipo de Componente: BDBusquedaCombo
            UICampo(
              datos: DEM.mapaOpcionMensajeria,
              tabla: OPCIONESMENSAJERIA.ETIQUETA_ENTIDAD,
              campo: OPCIONESMENSAJERIA.PROXIMOCHECKOUT,
              denominacion: OPCIONESMENSAJERIA.ETIQUETA_PROXIMOCHECKOUT,
              etiqueta: OPCIONESMENSAJERIA.ETIQUETA_PROXIMOCHECKOUT,
              componente: 'BDBusquedaCombo',
              longitud: 0,
              decimales: 0,


            ),
              UIBotonesGuardarBorrar(guardar: _guardar, borrar: null ),
            ],
          ),
        ),
    );
  }
}
