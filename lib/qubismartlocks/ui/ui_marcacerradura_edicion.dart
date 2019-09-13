// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Edicion de Marcas de Cerraduras
// Edicion para [//Marcas de Cerraduras]

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIMarcaCerraduraEdicion extends StatefulWidget {
  UIMarcaCerraduraEdicion({Key key, this.registro}) : super(key: key);

  final MarcaCerradura registro;

  @override
  _EstadoMarcaCerraduraEdicion createState() =>
      _EstadoMarcaCerraduraEdicion();
}

class _EstadoMarcaCerraduraEdicion extends State<UIMarcaCerraduraEdicion> {
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
      // al registro de MarcasCerraduras en el widget
      widget.registro.fromMap(DEM.mapaMarcaCerradura);

      // Guardar MarcasCerraduras
      Resultado _resultado =
          await MarcasCerraduras.guardar(widget.registro);
      Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
    }
  }

  void _borrar() async {
    // Borrar MarcasCerraduras
      Resultado _resultado =
          await MarcasCerraduras.borrar(widget.registro);
    Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
  }

  String _validarDenomMarcaCerradura(String value) {
    _formaEditada = true;
    if (value.isEmpty)
      return campoObligatorio(MARCASCERRADURAS.ETIQUETA_DENOMMARCACERRADURA);
    widget.registro.denomMarcaCerradura = value;
    return null;
  }



  @override
  Widget build(BuildContext context) {
    DEM.mapaMarcaCerradura = widget.registro.toMap();

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
// Campo: Denominación del Marca de Cerradura. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaMarcaCerradura,
              tabla: MARCASCERRADURAS.ETIQUETA_ENTIDAD,
              campo: MARCASCERRADURAS.DENOMMARCACERRADURA,
              denominacion: MARCASCERRADURAS.ETIQUETA_DENOMMARCACERRADURA,
              etiqueta: MARCASCERRADURAS.ETIQUETA_DENOMMARCACERRADURA,
              componente: 'BDEdicion',
              longitud: 200,
              decimales: 0,

              validatorTexto: _validarDenomMarcaCerradura,

            ),
// Campo: Descripción del Marca de Cerradura. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaMarcaCerradura,
              tabla: MARCASCERRADURAS.ETIQUETA_ENTIDAD,
              campo: MARCASCERRADURAS.DESCMARCACERRADURA,
              denominacion: MARCASCERRADURAS.ETIQUETA_DESCMARCACERRADURA,
              etiqueta: MARCASCERRADURAS.ETIQUETA_DESCMARCACERRADURA,
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
