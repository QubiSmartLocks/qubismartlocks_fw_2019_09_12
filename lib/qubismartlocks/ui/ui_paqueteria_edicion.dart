// Proyecto: Qubi Smart Locks
// Version: 0.0.2
// Autor: Abner Hernández
// Unidad: Edicion de Paquetería
// Edicion para [Qubi Smart Locks/Qubi Smart Locks/Paquetería]

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:qubismartlocks_fw/ui_campo-seleccion.dart';

class UIPaqueteriaEdicion extends StatefulWidget {
  UIPaqueteriaEdicion({Key key, this.registro}) : super(key: key);
  static const String ruta = '/ui-paqueteria-edicion';

  Paquete registro;

  @override
  _EstadoPaqueteriaEdicion createState() => _EstadoPaqueteriaEdicion();
}

class _EstadoPaqueteriaEdicion extends State<UIPaqueteriaEdicion> {
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
      Resultado _resultado = await Paqueteria.guardar(widget.registro);
      Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
    }
  }

  void _borrar() async {
    // Borrar Paqueteria
    Resultado _resultado = await Paqueteria.borrar(widget.registro);
    Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
  }

  String _validarOrigenPaquete(int value) {
    _formaEditada = true;
    // TODO: Falta validar las Claves Foraneas
    // widget.registro.origenPaquete.id = value;
    return null;
  }

  String _validarFechaHoraEntregado(String value) {
    _formaEditada = true;
    if (value.isEmpty)
      return campoObligatorio(PAQUETERIA.ETIQUETA_FECHAHORAENTREGADO);
//    widget.registro.fechaHoraEntregado = value;
    return null;
  }

  String _validarPasajero(int value) {
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
    if (widget.registro == null) {
      widget.registro = DEM.paquete;
    }

    DEM.mapaPaquete = widget.registro.toMap();
    print('DEM.listaOrigenesPaquetes.length');
    print(DEM.listaOrigenesPaquetes.length);
    DEM.listaOrigenesPaquetes.forEach((op) {
      print(op.toMap());
    });
    print('widget.registro.toMap()');
    print(widget.registro.toMap());
    print('OrigenPaquete está en la lista?');
    DEM.listaOrigenesPaquetes
        .where((OrigenPaquete item) => item == widget.registro.origenPaquete)
        .forEach((o) {
      print('Encontrado ${o.denomOrigenPaquete}');
    });

//      appBar: UI__AppBar(CD.ancho < AppRes.appResMap[Co.WEB_BREAK_POINT_4],'Paqueteria',null,null,) as AppBar,
    return Form(
      child: Column(
        children: <Widget>[
          Container(
            margin:
                EdgeInsets.only(top: 10, left: 10, right: 10), // TODO: VARIABLE
            child: Row(
              children: <Widget>[
                Expanded(
                  child: UICampoSeleccionSencillo<OrigenPaquete>(
                    ancho: 300,
                    // TODO: VARIABLE
                    alto: AppRes.appResMap[Co.ALTO_EDICION],
                    lista: DEM.listaOrigenesPaquetes,
                    opcion: widget.registro.origenPaquete,
                    mostrar: ORIGENESPAQUETES.DENOMORIGENPAQUETE,
                    campoSegunModelo: campoSegunModelo,
                    assign: (OrigenPaquete origen) {
                      widget.registro.origenPaquete.assign(origen);
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(width: 10), // TODO: VARIABLE
                Expanded(
                  child: UICampo(
                    datos: DEM.mapaPaquete,
                    tabla: PAQUETERIA.ETIQUETA_ENTIDAD,
                    campo: PAQUETERIA.NUMERORASTREO,
                    denominacion: PAQUETERIA.ETIQUETA_NUMERORASTREO,
                    etiqueta: PAQUETERIA.ETIQUETA_NUMERORASTREO,
                    componente: 'BDEdicion',
                    // TODO: VARIABLE
                    longitud: 20,
                    // TODO: VARIABLE
                    decimales: 0, // TODO: VARIABLE
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: UICampo(
                    datos: DEM.mapaPaquete,
                    tabla: PAQUETERIA.ETIQUETA_ENTIDAD,
                    campo: PAQUETERIA.NOTARECEPCION,
                    denominacion: PAQUETERIA.ETIQUETA_NOTARECEPCION,
                    etiqueta: PAQUETERIA.ETIQUETA_NOTARECEPCION,
                    componente: 'BDEdicion',
                    longitud: 200,
                    decimales: 0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: 10, left: 10, right: 10), // TODO: VARIABLE
            child: Row(
              children: <Widget>[
                Expanded(
                  child: UICampo(
                    datos: DEM.mapaPaquete,
                    tabla: PAQUETERIA.ETIQUETA_ENTIDAD,
                    campo: PAQUETERIA.DESTINATARIO,
                    denominacion: PAQUETERIA.ETIQUETA_DESTINATARIO,
                    etiqueta: PAQUETERIA.ETIQUETA_DESTINATARIO,
                    componente: 'BDEdicion',
                    longitud: 20,
                    decimales: 0,
                  ),
                ),
                SizedBox(width: 10), // TODO: VARIABLE
                Expanded(
                  child: UICampo(
                    datos: DEM.mapaPaquete,
                    tabla: PAQUETERIA.ETIQUETA_ENTIDAD,
                    campo: PAQUETERIA.FECHAHORARECEPCION,
                    denominacion: PAQUETERIA.ETIQUETA_FECHAHORARECEPCION,
                    etiqueta: PAQUETERIA.ETIQUETA_FECHAHORARECEPCION,
                    componente: 'BDEdicion',
                    longitud: 20,
                    decimales: 0,
                  ),
                ),
                SizedBox(width: 10), // TODO: VARIABLE
                Expanded(
                  child: UICampoSeleccion(
                    data: DEM.mapaPaquete,
                    campo: PAQUETERIA.ORIGENPAQUETE,
                    lista:
                        OrigenesPaquetes.toMapList(DEM.listaOrigenesPaquetes),
                    mostrar: ORIGENESPAQUETES.DENOMORIGENPAQUETE,
                    selecto: DEM.mapaPaquete[PAQUETERIA.ORIGENPAQUETE],
                    ancho: 300,
                    // TODO: VARIABLE
                    alto: AppRes.appResMap[Co.ALTO_EDICION],
                    altoLista: MediaQuery.of(context).size.height / 2,
                    // TODO: VARIABLE
                    anchoLista: MediaQuery.of(context).size.width / 2,
                    // TODO: VARIABLE
                    etiqueta: PAQUETERIA.ETIQUETA_ORIGENPAQUETE,
                    titulo: ORIGENESPAQUETES.ETIQUETA_ENTIDAD,
                    callback: () {
                      widget.registro.origenPaquete
                          .fromMap(DEM.mapaPaquete[PAQUETERIA.ORIGENPAQUETE]);
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: 10, left: 10, right: 10), // TODO: VARIABLE
            child: Row(
              children: <Widget>[
                Expanded(
                  child: UICampo(
                    datos: DEM.mapaPaquete,
                    tabla: PAQUETERIA.ETIQUETA_ENTIDAD,
                    campo: PAQUETERIA.NOTADESTINATARIO,
                    denominacion: PAQUETERIA.ETIQUETA_NOTADESTINATARIO,
                    etiqueta: PAQUETERIA.ETIQUETA_NOTADESTINATARIO,
                    componente: 'BDEdicion',
                    longitud: 200,
                    decimales: 0,
                  ),
                ),
                SizedBox(width: 10), // TODO: VARIABLE
                Expanded(
                  child: UICampo(
                    datos: DEM.mapaPaquete,
                    tabla: PAQUETERIA.ETIQUETA_ENTIDAD,
                    campo: PAQUETERIA.FECHAHORAENTREGADO,
                    denominacion: PAQUETERIA.ETIQUETA_FECHAHORAENTREGADO,
                    etiqueta: PAQUETERIA.ETIQUETA_FECHAHORAENTREGADO,
                    componente: 'BDEdicion',
                    longitud: 20,
                    decimales: 0,

// validatorTexto: _validarFechaHoraEntregado,
                  ),
                ),
                SizedBox(width: 10), // TODO: VARIABLE
                Expanded(
                  child: UICampo(
                    datos: DEM.mapaPaquete,
                    tabla: PAQUETERIA.ETIQUETA_ENTIDAD,
                    campo: PAQUETERIA.RECIBIDOPASAJERO,
                    denominacion: PAQUETERIA.ETIQUETA_RECIBIDOPASAJERO,
                    etiqueta: PAQUETERIA.ETIQUETA_RECIBIDOPASAJERO,
                    componente: 'BDEdicion',
                    longitud: 20,
                    decimales: 0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: 10, left: 10, right: 10), // TODO: VARIABLE
            child: Row(
              children: <Widget>[
                Expanded(
                  child:
// Campo: Tipo de Usuario. Tipo de Componente: BDBusquedaCombo
                      UICampoFechaHora(
                    labelText: 'Label Text',
                    selectDate: null,
                    selectTime: null,
                    selectedTime: TimeOfDay(minute: 00, hour: 12),
                    soloLectura: false,
                    locale: 'en_US',
                    lastDate: DateTime.now().add(Duration(days: 30)),
                    firstDate: DateTime.now(),
                  ),
                ),
                SizedBox(width: 2), // TODO: VARIABLE
                Expanded(
                  child: UICampo(
                    datos: DEM.mapaPaquete,
                    tabla: PAQUETERIA.ETIQUETA_ENTIDAD,
                    campo: PAQUETERIA.MENSAJEENVIADO,
                    denominacion: PAQUETERIA.ETIQUETA_MENSAJEENVIADO,
                    etiqueta: PAQUETERIA.ETIQUETA_MENSAJEENVIADO,
                    componente: 'BDChequeo',
                    // TODO: VARIABLE
                    longitud: 1,
                    // TODO: VARIABLE
                    decimales: 0, // TODO: VARIABLE
                  ),
                ),
              ],
            ),
          ),
          CD.ancho < AppRes.appResMap[Co.WEB_BREAK_POINT_4]
              ? Container()
              : Container(
//                  width: anchoColumna - 50, // TODO: VARIABLE
                  child: UIBGB(
                      guardar: _guardar,
                      borrar: widget.registro.id == 0 ? null : _borrar),
                ),
        ],
      ),
    );
  }
}
