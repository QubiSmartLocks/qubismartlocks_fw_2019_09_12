// Proyecto: Qubi Smart Locks
// Version: 0.0.2
// Autor: Abner Hernández
// Unidad: Edicion de Marcas de Cerraduras
// Edicion para [Qubi Smart Locks/Qubi Smart Locks/Marcas de Cerraduras]

import 'package:qubismartlocks_fw/qubismartlocks.dart';

class UIMarcasCerradurasEdicion extends StatefulWidget {
  UIMarcasCerradurasEdicion({Key key, this.registro}) : super(key: key);

  final MarcaCerradura registro;

  @override
  _EstadoMarcasCerradurasEdicion createState() =>
      _EstadoMarcasCerradurasEdicion();
}

class _EstadoMarcasCerradurasEdicion extends State<UIMarcasCerradurasEdicion> {
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
      Resultado _resultado = await MarcasCerraduras.guardar(widget.registro);
      Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
    }
  }

  void _borrar() async {
    // Borrar MarcasCerraduras
    Resultado _resultado = await MarcasCerraduras.borrar(widget.registro);
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

    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  UILaterales(),
                  Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width * 90 / 100,
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 400,
                            width: MediaQuery.of(context).size.width * 90 / 100,
                            child: Image.asset(
                              AppRes.appResMap[Co.BACKGROUND_SCREEN],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Center(
                          child: Card(
                            color: AppRes.appResMap[Co.FONDO_1],
                            elevation: 3,
                            child: Container(
                              width: 500,
                              height: 550,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18)),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Column(children: <Widget>[
                                      Center(
                                        child: Column(children: <Widget>[
                                          Column(
                                            children: <Widget>[
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: 25, bottom: 15),
                                                width: 80,
                                                height: 80,
                                                child: Container(
                                                  child: Image.asset(
                                                      'images/clientes.png'),
                                                ),
//                                                CircleAvatar(
//                                                  backgroundColor: AppRes
//                                                      .appResMap[Co.COLOR_2],
//                                                  backgroundImage: AssetImage(
//                                                      imagenCard),
//                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                height: 50,
                                                child: Text(
                                                  'Marcas de Cerraduras',
                                                  //tituloCard,
                                                  style: AppRes.appResMap[
                                                      Co.ESTILO_TITULO],
                                                ),
                                              ),
                                            ],
                                          ),
// fin datos de listado
                                          Container(
                                            width: 400,
                                            height: 250,
                                            child: Form(
                                              key: _forma,
                                              autovalidate: _autovalidar,
                                              onWillPop: () async {
                                                return await advertirDatosInvalidos(
                                                    context,
                                                    _forma.currentState,
                                                    _formaEditada);
                                              },
                                              //child: ListView(
                                              child: Column(
                                                children: <Widget>[
// Campo: Denominación del Marca de Cerradura. Tipo de Componente: BDEdicion
                                                  UICampo(
                                                    datos:
                                                        DEM.mapaMarcaCerradura,
                                                    tabla: MARCASCERRADURAS
                                                        .ETIQUETA_ENTIDAD,
                                                    campo: MARCASCERRADURAS
                                                        .DENOMMARCACERRADURA,
                                                    denominacion: MARCASCERRADURAS
                                                        .ETIQUETA_DENOMMARCACERRADURA,
                                                    etiqueta: MARCASCERRADURAS
                                                        .ETIQUETA_DENOMMARCACERRADURA,
                                                    componente: 'BDEdicion',
                                                    longitud: 200,
                                                    decimales: 0,
                                                    validatorTexto:
                                                        _validarDenomMarcaCerradura,
                                                  ),
// Campo: Descripción del Marca de Cerradura. Tipo de Componente: BDEdicion
                                                  UICampo(
                                                    datos:
                                                        DEM.mapaMarcaCerradura,
                                                    tabla: MARCASCERRADURAS
                                                        .ETIQUETA_ENTIDAD,
                                                    campo: MARCASCERRADURAS
                                                        .DESCMARCACERRADURA,
                                                    denominacion: MARCASCERRADURAS
                                                        .ETIQUETA_DESCMARCACERRADURA,
                                                    etiqueta: MARCASCERRADURAS
                                                        .ETIQUETA_DESCMARCACERRADURA,
                                                    componente: 'BDEdicion',
                                                    longitud: 4096,
                                                    decimales: 0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 400,
                                            child: UIBGB(
                                                guardar: _guardar,
                                                borrar: widget.registro.id == 0
                                                    ? null
                                                    : _borrar),
                                          ),
                                        ]),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  UILaterales(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
