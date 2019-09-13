// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Edicion de Conversaciones
// Edicion para [Mensajería (Chats)/Mensajería (Chats)/Conversaciones]

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class FConversacionesEdicion extends StatefulWidget {
  FConversacionesEdicion({Key key, this.registro}) : super(key: key);

  final Conversacion registro;

  @override
  _EstadoConversacionesEdicion createState() =>
      _EstadoConversacionesEdicion();
}

class _EstadoConversacionesEdicion extends State<FConversacionesEdicion> {
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
      // al registro de Conversaciones en el widget
      widget.registro.fromMap(DEM.mapaConversacion);

      // Guardar Conversaciones
      Resultado _resultado =
          await Conversaciones.guardar(widget.registro);
      Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
    }
  }

  void _borrar() async {
    // Borrar Conversaciones
      Resultado _resultado =
          await Conversaciones.borrar(widget.registro);
    Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
  }

  String _validarDenomConversacion(String value) {
    _formaEditada = true;
    if (value.isEmpty)
      return campoObligatorio(CONVERSACIONES.ETIQUETA_DENOMCONVERSACION);
    widget.registro.denomConversacion = value;
    return null;
  }



  @override
  Widget build(BuildContext context) {
    DEM.mapaConversacion = widget.registro.toMap();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppRes.appResMap[Co.COLOR_FONDO_TITULO_EDICION],
        title: Text(
          //CONVERSACIONES.ETIQUETA_REGISTRO + Co.TITULO_ABRE +
              ((widget.registro.id == null) || (widget.registro.id == 0))
                  ? Co.VISTA_NUEVO_REGISTRO
                  : widget.registro.denomConversacion,
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
// Campo: Denominación de la Conversación. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaConversacion,
              tabla: CONVERSACIONES.ETIQUETA_ENTIDAD,
              campo: CONVERSACIONES.DENOMCONVERSACION,
              denominacion: CONVERSACIONES.ETIQUETA_DENOMCONVERSACION,
              etiqueta: CONVERSACIONES.ETIQUETA_DENOMCONVERSACION,
              componente: 'BDEdicion',
              longitud: 200,
              decimales: 0,

              validatorTexto: _validarDenomConversacion,

            ),
// Campo: Orden de Prioridad. Tipo de Componente: BDEdicionNumero
            UICampo(
              datos: DEM.mapaConversacion,
              tabla: CONVERSACIONES.ETIQUETA_ENTIDAD,
              campo: CONVERSACIONES.ORDENPRIORIDAD,
              denominacion: CONVERSACIONES.ETIQUETA_ORDENPRIORIDAD,
              etiqueta: CONVERSACIONES.ETIQUETA_ORDENPRIORIDAD,
              componente: 'BDEdicionNumero',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Fecha de Creación. Tipo de Componente: BDEdicionFecha
            UICampo(
              datos: DEM.mapaConversacion,
              tabla: CONVERSACIONES.ETIQUETA_ENTIDAD,
              campo: CONVERSACIONES.FECHACREACION,
              denominacion: CONVERSACIONES.ETIQUETA_FECHACREACION,
              etiqueta: CONVERSACIONES.ETIQUETA_FECHACREACION,
              componente: 'BDEdicionFecha',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Fecha de Último Mensaje. Tipo de Componente: BDEdicionFecha
            UICampo(
              datos: DEM.mapaConversacion,
              tabla: CONVERSACIONES.ETIQUETA_ENTIDAD,
              campo: CONVERSACIONES.FECHAULTIMOMENSAJE,
              denominacion: CONVERSACIONES.ETIQUETA_FECHAULTIMOMENSAJE,
              etiqueta: CONVERSACIONES.ETIQUETA_FECHAULTIMOMENSAJE,
              componente: 'BDEdicionFecha',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Nota. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaConversacion,
              tabla: CONVERSACIONES.ETIQUETA_ENTIDAD,
              campo: CONVERSACIONES.NOTA,
              denominacion: CONVERSACIONES.ETIQUETA_NOTA,
              etiqueta: CONVERSACIONES.ETIQUETA_NOTA,
              componente: 'BDEdicion',
              longitud: 200,
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
