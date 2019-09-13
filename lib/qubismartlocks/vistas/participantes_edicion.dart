// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Edicion de Participantes
// Edicion para [Mensajería (Chats)/Mensajería (Chats)/Participantes]

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class FParticipantesEdicion extends StatefulWidget {
  FParticipantesEdicion({Key key, this.registro}) : super(key: key);

  final Participante registro;

  @override
  _EstadoParticipantesEdicion createState() =>
      _EstadoParticipantesEdicion();
}

class _EstadoParticipantesEdicion extends State<FParticipantesEdicion> {
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
      // al registro de Participantes en el widget
      widget.registro.fromMap(DEM.mapaParticipante);

      // Guardar Participantes
      Resultado _resultado =
          await Participantes.guardar(widget.registro);
      Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
    }
  }

  void _borrar() async {
    // Borrar Participantes
      Resultado _resultado =
          await Participantes.borrar(widget.registro);
    Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
  }

  String _validarConversacion(int value) {
    _formaEditada = true;
    // TODO: Falta validar las Claves Foraneas
    // widget.registro.conversacion.id = value;
    return null;
  }

  String _validarUsuario(int value) {
    _formaEditada = true;
    widget.registro.usuario = value;
    return null;
  }



  @override
  Widget build(BuildContext context) {
    DEM.mapaParticipante = widget.registro.toMap();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppRes.appResMap[Co.COLOR_FONDO_TITULO_EDICION],
        title: Text(
          //PARTICIPANTES.ETIQUETA_REGISTRO + Co.TITULO_ABRE +
              ((widget.registro.id == null) || (widget.registro.id == 0))
                  ? Co.VISTA_NUEVO_REGISTRO
                  : widget.registro.conversacion,
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
// Campo: Conversación. Tipo de Componente: BDBusquedaCombo
            UICampo(
              datos: DEM.mapaParticipante,
              tabla: PARTICIPANTES.ETIQUETA_ENTIDAD,
              campo: PARTICIPANTES.CONVERSACION,
              denominacion: PARTICIPANTES.ETIQUETA_CONVERSACION,
              etiqueta: PARTICIPANTES.ETIQUETA_CONVERSACION,
              componente: 'BDBusquedaCombo',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Usuario. Tipo de Componente: BDBusquedaCombo
            UICampo(
              datos: DEM.mapaParticipante,
              tabla: PARTICIPANTES.ETIQUETA_ENTIDAD,
              campo: PARTICIPANTES.USUARIO,
              denominacion: PARTICIPANTES.ETIQUETA_USUARIO,
              etiqueta: PARTICIPANTES.ETIQUETA_USUARIO,
              componente: 'BDBusquedaCombo',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Nombre. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaParticipante,
              tabla: PARTICIPANTES.ETIQUETA_ENTIDAD,
              campo: PARTICIPANTES.NOMBRE,
              denominacion: PARTICIPANTES.ETIQUETA_NOMBRE,
              etiqueta: PARTICIPANTES.ETIQUETA_NOMBRE,
              componente: 'BDEdicion',
              longitud: 60,
              decimales: 0,


            ),
// Campo: Nota. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaParticipante,
              tabla: PARTICIPANTES.ETIQUETA_ENTIDAD,
              campo: PARTICIPANTES.NOTA,
              denominacion: PARTICIPANTES.ETIQUETA_NOTA,
              etiqueta: PARTICIPANTES.ETIQUETA_NOTA,
              componente: 'BDEdicion',
              longitud: 200,
              decimales: 0,


            ),
// Campo: Key Conversación. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaParticipante,
              tabla: PARTICIPANTES.ETIQUETA_ENTIDAD,
              campo: PARTICIPANTES.KEYCONVERSACION,
              denominacion: PARTICIPANTES.ETIQUETA_KEYCONVERSACION,
              etiqueta: PARTICIPANTES.ETIQUETA_KEYCONVERSACION,
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
