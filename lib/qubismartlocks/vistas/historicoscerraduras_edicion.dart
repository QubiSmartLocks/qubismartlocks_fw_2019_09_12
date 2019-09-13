// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Edicion de Históricos de Cerraduras
// Edicion para [Qubi Smart Locks/Qubi Smart Locks/Históricos de Cerraduras]

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class FHistoricosCerradurasEdicion extends StatefulWidget {
  FHistoricosCerradurasEdicion({Key key, this.registro}) : super(key: key);

  final HistoricoCerradura registro;

  @override
  _EstadoHistoricosCerradurasEdicion createState() =>
      _EstadoHistoricosCerradurasEdicion();
}

class _EstadoHistoricosCerradurasEdicion extends State<FHistoricosCerradurasEdicion> {
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
      // al registro de HistoricosCerraduras en el widget
      widget.registro.fromMap(DEM.mapaHistoricoCerradura);

      // Guardar HistoricosCerraduras
      Resultado _resultado =
          await HistoricosCerraduras.guardar(widget.registro);
      Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
    }
  }

  void _borrar() async {
    // Borrar HistoricosCerraduras
      Resultado _resultado =
          await HistoricosCerraduras.borrar(widget.registro);
    Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
  }

  String _validarCerradura(int value) {
    _formaEditada = true;
    // TODO: Falta validar las Claves Foraneas
    // widget.registro.cerradura.id = value;
    return null;
  }

  String _validarUsuario(int value) {
    _formaEditada = true;
    widget.registro.usuario = value;
    return null;
  }

  String _validarFuncion(String value) {
    _formaEditada = true;
    if (value.isEmpty)
      return campoObligatorio(HISTORICOSCERRADURAS.ETIQUETA_FUNCION);
    widget.registro.funcion = value;
    return null;
  }



  @override
  Widget build(BuildContext context) {
    DEM.mapaHistoricoCerradura = widget.registro.toMap();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppRes.appResMap[Co.COLOR_FONDO_TITULO_EDICION],
        title: Text(
          //HISTORICOSCERRADURAS.ETIQUETA_REGISTRO + Co.TITULO_ABRE +
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
              datos: DEM.mapaHistoricoCerradura,
              tabla: HISTORICOSCERRADURAS.ETIQUETA_ENTIDAD,
              campo: HISTORICOSCERRADURAS.CERRADURA,
              denominacion: HISTORICOSCERRADURAS.ETIQUETA_CERRADURA,
              etiqueta: HISTORICOSCERRADURAS.ETIQUETA_CERRADURA,
              componente: 'BDBusquedaCombo',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Fecha. Tipo de Componente: BDEdicionFecha
            UICampo(
              datos: DEM.mapaHistoricoCerradura,
              tabla: HISTORICOSCERRADURAS.ETIQUETA_ENTIDAD,
              campo: HISTORICOSCERRADURAS.FECHA,
              denominacion: HISTORICOSCERRADURAS.ETIQUETA_FECHA,
              etiqueta: HISTORICOSCERRADURAS.ETIQUETA_FECHA,
              componente: 'BDEdicionFecha',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Hora. Tipo de Componente: BDEdicionHora
            UICampo(
              datos: DEM.mapaHistoricoCerradura,
              tabla: HISTORICOSCERRADURAS.ETIQUETA_ENTIDAD,
              campo: HISTORICOSCERRADURAS.HORA,
              denominacion: HISTORICOSCERRADURAS.ETIQUETA_HORA,
              etiqueta: HISTORICOSCERRADURAS.ETIQUETA_HORA,
              componente: 'BDEdicionHora',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Usuario. Tipo de Componente: BDBusquedaCombo
            UICampo(
              datos: DEM.mapaHistoricoCerradura,
              tabla: HISTORICOSCERRADURAS.ETIQUETA_ENTIDAD,
              campo: HISTORICOSCERRADURAS.USUARIO,
              denominacion: HISTORICOSCERRADURAS.ETIQUETA_USUARIO,
              etiqueta: HISTORICOSCERRADURAS.ETIQUETA_USUARIO,
              componente: 'BDBusquedaCombo',
              longitud: 0,
              decimales: 0,


            ),
// Campo: Función. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaHistoricoCerradura,
              tabla: HISTORICOSCERRADURAS.ETIQUETA_ENTIDAD,
              campo: HISTORICOSCERRADURAS.FUNCION,
              denominacion: HISTORICOSCERRADURAS.ETIQUETA_FUNCION,
              etiqueta: HISTORICOSCERRADURAS.ETIQUETA_FUNCION,
              componente: 'BDEdicion',
              longitud: 200,
              decimales: 0,

              validatorTexto: _validarFuncion,

            ),
// Campo: Notas. Tipo de Componente: BDMemo
            UICampo(
              datos: DEM.mapaHistoricoCerradura,
              tabla: HISTORICOSCERRADURAS.ETIQUETA_ENTIDAD,
              campo: HISTORICOSCERRADURAS.NOTAS,
              denominacion: HISTORICOSCERRADURAS.ETIQUETA_NOTAS,
              etiqueta: HISTORICOSCERRADURAS.ETIQUETA_NOTAS,
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
