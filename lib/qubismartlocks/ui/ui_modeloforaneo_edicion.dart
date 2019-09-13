// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Edicion de Modelos Foráneos
// Edicion para [//Modelos Foráneos]

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIModeloForaneoEdicion extends StatefulWidget {
  UIModeloForaneoEdicion({Key key, this.registro}) : super(key: key);

  final ModeloForaneo registro;

  @override
  _EstadoModeloForaneoEdicion createState() =>
      _EstadoModeloForaneoEdicion();
}

class _EstadoModeloForaneoEdicion extends State<UIModeloForaneoEdicion> {
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
      // al registro de ModelosForaneos en el widget
      widget.registro.fromMap(DEM.mapaModeloForaneo);

      // Guardar ModelosForaneos
      Resultado _resultado =
          await ModelosForaneos.guardar(widget.registro);
      Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
    }
  }

  void _borrar() async {
    // Borrar ModelosForaneos
      Resultado _resultado =
          await ModelosForaneos.borrar(widget.registro);
    Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
  }

  String _validarDenomModeloForaneo(String value) {
    _formaEditada = true;
    if (value.isEmpty)
      return campoObligatorio(MODELOSFORANEOS.ETIQUETA_DENOMMODELOFORANEO);
    widget.registro.denomModeloForaneo = value;
    return null;
  }



  @override
  Widget build(BuildContext context) {
    DEM.mapaModeloForaneo = widget.registro.toMap();

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
// Campo: Denominación del Modelo Foraneo. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaModeloForaneo,
              tabla: MODELOSFORANEOS.ETIQUETA_ENTIDAD,
              campo: MODELOSFORANEOS.DENOMMODELOFORANEO,
              denominacion: MODELOSFORANEOS.ETIQUETA_DENOMMODELOFORANEO,
              etiqueta: MODELOSFORANEOS.ETIQUETA_DENOMMODELOFORANEO,
              componente: 'BDEdicion',
              longitud: 200,
              decimales: 0,

              validatorTexto: _validarDenomModeloForaneo,

            ),
// Campo: Descripción del Modelo Foraneo. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaModeloForaneo,
              tabla: MODELOSFORANEOS.ETIQUETA_ENTIDAD,
              campo: MODELOSFORANEOS.DESCMODELOFORANEO,
              denominacion: MODELOSFORANEOS.ETIQUETA_DESCMODELOFORANEO,
              etiqueta: MODELOSFORANEOS.ETIQUETA_DESCMODELOFORANEO,
              componente: 'BDEdicion',
              longitud: 4096,
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
