// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Edicion de Tipos de Unidades Funcionales
// Edicion para [Qubi Smart Locks/Qubi Smart Locks/Tipos de Unidades Funcionales]

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class FTipUnidadesFuncionalesEdicion extends StatefulWidget {
  FTipUnidadesFuncionalesEdicion({Key key, this.registro}) : super(key: key);

  final TipoUnidadFuncional registro;

  @override
  _EstadoTipUnidadesFuncionalesEdicion createState() =>
      _EstadoTipUnidadesFuncionalesEdicion();
}

class _EstadoTipUnidadesFuncionalesEdicion extends State<FTipUnidadesFuncionalesEdicion> {
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
      // al registro de TipUnidadesFuncionales en el widget
      widget.registro.fromMap(DEM.mapaTipoUnidadFuncional);

      // Guardar TipUnidadesFuncionales
      Resultado _resultado =
          await TipUnidadesFuncionales.guardar(widget.registro);
      Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
    }
  }

  void _borrar() async {
    // Borrar TipUnidadesFuncionales
      Resultado _resultado =
          await TipUnidadesFuncionales.borrar(widget.registro);
    Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
  }

  String _validarDenomTipoUnidadFuncional(String value) {
    _formaEditada = true;
    if (value.isEmpty)
      return campoObligatorio(TIPUNIDADESFUNCIONALES.ETIQUETA_DENOMTIPOUNIDADFUNCIONAL);
    widget.registro.denomTipoUnidadFuncional = value;
    return null;
  }



  @override
  Widget build(BuildContext context) {
    DEM.mapaTipoUnidadFuncional = widget.registro.toMap();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppRes.appResMap[Co.COLOR_FONDO_TITULO_EDICION],
        title: Text(
          //TIPUNIDADESFUNCIONALES.ETIQUETA_REGISTRO + Co.TITULO_ABRE +
              ((widget.registro.id == null) || (widget.registro.id == 0))
                  ? Co.VISTA_NUEVO_REGISTRO
                  : widget.registro.denomTipoUnidadFuncional,
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
// Campo: Denominación del Tipo de Unidad Funcional. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaTipoUnidadFuncional,
              tabla: TIPUNIDADESFUNCIONALES.ETIQUETA_ENTIDAD,
              campo: TIPUNIDADESFUNCIONALES.DENOMTIPOUNIDADFUNCIONAL,
              denominacion: TIPUNIDADESFUNCIONALES.ETIQUETA_DENOMTIPOUNIDADFUNCIONAL,
              etiqueta: TIPUNIDADESFUNCIONALES.ETIQUETA_DENOMTIPOUNIDADFUNCIONAL,
              componente: 'BDEdicion',
              longitud: 200,
              decimales: 0,

              validatorTexto: _validarDenomTipoUnidadFuncional,

            ),
// Campo: Máximo Cerraduras Asignadas. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaTipoUnidadFuncional,
              tabla: TIPUNIDADESFUNCIONALES.ETIQUETA_ENTIDAD,
              campo: TIPUNIDADESFUNCIONALES.MAXIMOCERRADURASASIGNADAS,
              denominacion: TIPUNIDADESFUNCIONALES.ETIQUETA_MAXIMOCERRADURASASIGNADAS,
              etiqueta: TIPUNIDADESFUNCIONALES.ETIQUETA_MAXIMOCERRADURASASIGNADAS,
              componente: 'BDEdicion',
              longitud: 0,
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
