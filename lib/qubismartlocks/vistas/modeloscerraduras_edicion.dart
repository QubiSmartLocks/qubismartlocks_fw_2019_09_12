// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Edicion de Modelos de Cerraduras
// Edicion para [Qubi Smart Locks/Qubi Smart Locks/Modelos de Cerraduras]

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class FModelosCerradurasEdicion extends StatefulWidget {
  FModelosCerradurasEdicion({Key key, this.registro}) : super(key: key);

  final ModeloCerradura registro;

  @override
  _EstadoModelosCerradurasEdicion createState() =>
      _EstadoModelosCerradurasEdicion();
}

class _EstadoModelosCerradurasEdicion extends State<FModelosCerradurasEdicion> {
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
      // al registro de ModelosCerraduras en el widget
      widget.registro.fromMap(DEM.mapaModeloCerradura);

      // Guardar ModelosCerraduras
      Resultado _resultado =
          await ModelosCerraduras.guardar(widget.registro);
      Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
    }
  }

  void _borrar() async {
    // Borrar ModelosCerraduras
      Resultado _resultado =
          await ModelosCerraduras.borrar(widget.registro);
    Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
  }

  String _validarDenomModelo(String value) {
    _formaEditada = true;
    if (value.isEmpty)
      return campoObligatorio(MODELOSCERRADURAS.ETIQUETA_DENOMMODELO);
    widget.registro.denomModelo = value;
    return null;
  }



  @override
  Widget build(BuildContext context) {
    DEM.mapaModeloCerradura = widget.registro.toMap();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppRes.appResMap[Co.COLOR_FONDO_TITULO_EDICION],
        title: Text(
          //MODELOSCERRADURAS.ETIQUETA_REGISTRO + Co.TITULO_ABRE +
              ((widget.registro.id == null) || (widget.registro.id == 0))
                  ? Co.VISTA_NUEVO_REGISTRO
                  : widget.registro.marca,
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
// Campo: Denominación del Modelo. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaModeloCerradura,
              tabla: MODELOSCERRADURAS.ETIQUETA_ENTIDAD,
              campo: MODELOSCERRADURAS.DENOMMODELO,
              denominacion: MODELOSCERRADURAS.ETIQUETA_DENOMMODELO,
              etiqueta: MODELOSCERRADURAS.ETIQUETA_DENOMMODELO,
              componente: 'BDEdicion',
              longitud: 200,
              decimales: 0,

              validatorTexto: _validarDenomModelo,

            ),
// Campo: Descripción del Modelo. Tipo de Componente: BDMemo
            UICampo(
              datos: DEM.mapaModeloCerradura,
              tabla: MODELOSCERRADURAS.ETIQUETA_ENTIDAD,
              campo: MODELOSCERRADURAS.DESCMODELO,
              denominacion: MODELOSCERRADURAS.ETIQUETA_DESCMODELO,
              etiqueta: MODELOSCERRADURAS.ETIQUETA_DESCMODELO,
              componente: 'BDMemo',
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
