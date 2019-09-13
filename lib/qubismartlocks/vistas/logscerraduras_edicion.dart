// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Edicion de Logs de Cerraduras
// Edicion para [Qubi Smart Locks/Qubi Smart Locks/Logs de Cerraduras]

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class FLogsCerradurasEdicion extends StatefulWidget {
  FLogsCerradurasEdicion({Key key, this.registro}) : super(key: key);

  final LogCerradura registro;

  @override
  _EstadoLogsCerradurasEdicion createState() =>
      _EstadoLogsCerradurasEdicion();
}

class _EstadoLogsCerradurasEdicion extends State<FLogsCerradurasEdicion> {
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
      // al registro de LogsCerraduras en el widget
      widget.registro.fromMap(DEM.mapaLogCerradura);

      // Guardar LogsCerraduras
      Resultado _resultado =
          await LogsCerraduras.guardar(widget.registro);
      Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
    }
  }

  void _borrar() async {
    // Borrar LogsCerraduras
      Resultado _resultado =
          await LogsCerraduras.borrar(widget.registro);
    Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
  }

  String _validarCerradura(int value) {
    _formaEditada = true;
    // TODO: Falta validar las Claves Foraneas
    // widget.registro.cerradura.id = value;
    return null;
  }



  @override
  Widget build(BuildContext context) {
    DEM.mapaLogCerradura = widget.registro.toMap();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppRes.appResMap[Co.COLOR_FONDO_TITULO_EDICION],
        title: Text(
          //LOGSCERRADURAS.ETIQUETA_REGISTRO + Co.TITULO_ABRE +
              ((widget.registro.id == null) || (widget.registro.id == 0))
                  ? Co.VISTA_NUEVO_REGISTRO
                  : widget.registro.cerradura,
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
// Campo: Cerradura. Tipo de Componente: BDBusquedaCombo
            UICampo(
              datos: DEM.mapaLogCerradura,
              tabla: LOGSCERRADURAS.ETIQUETA_ENTIDAD,
              campo: LOGSCERRADURAS.CERRADURA,
              denominacion: LOGSCERRADURAS.ETIQUETA_CERRADURA,
              etiqueta: LOGSCERRADURAS.ETIQUETA_CERRADURA,
              componente: 'BDBusquedaCombo',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Fecha. Tipo de Componente: BDEdicionFecha
            UICampo(
              datos: DEM.mapaLogCerradura,
              tabla: LOGSCERRADURAS.ETIQUETA_ENTIDAD,
              campo: LOGSCERRADURAS.FECHA,
              denominacion: LOGSCERRADURAS.ETIQUETA_FECHA,
              etiqueta: LOGSCERRADURAS.ETIQUETA_FECHA,
              componente: 'BDEdicionFecha',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Hora. Tipo de Componente: BDEdicionHora
            UICampo(
              datos: DEM.mapaLogCerradura,
              tabla: LOGSCERRADURAS.ETIQUETA_ENTIDAD,
              campo: LOGSCERRADURAS.HORA,
              denominacion: LOGSCERRADURAS.ETIQUETA_HORA,
              etiqueta: LOGSCERRADURAS.ETIQUETA_HORA,
              componente: 'BDEdicionHora',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Detalle del Log. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaLogCerradura,
              tabla: LOGSCERRADURAS.ETIQUETA_ENTIDAD,
              campo: LOGSCERRADURAS.DETLOG,
              denominacion: LOGSCERRADURAS.ETIQUETA_DETLOG,
              etiqueta: LOGSCERRADURAS.ETIQUETA_DETLOG,
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
