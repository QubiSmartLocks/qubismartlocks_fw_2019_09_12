// Proyecto: Qubi Smart Locks
// Version: 0.0.2
// Autor: Abner Hernández
// Unidad: Edicion de Unidades Funcionales
// Edicion para [Qubi Smart Locks/Qubi Smart Locks/Unidades Funcionales]

import 'package:qubismartlocks_fw/qubismartlocks.dart';

class UIUnidadesFuncionalesEdicion extends StatefulWidget {
  UIUnidadesFuncionalesEdicion({Key key, this.registro}) : super(key: key);

  final UnidadFuncional registro;

  @override
  _EstadoUnidadesFuncionalesEdicion createState() =>
      _EstadoUnidadesFuncionalesEdicion();
}

class _EstadoUnidadesFuncionalesEdicion
    extends State<UIUnidadesFuncionalesEdicion> {
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
      // al registro de UnidadesFuncionales en el widget
      widget.registro.fromMap(DEM.mapaUnidadFuncional);

      // Guardar UnidadesFuncionales
      Resultado _resultado = await UnidadesFuncionales.guardar(widget.registro);
      Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
    }
  }

  void _borrar() async {
    // Borrar UnidadesFuncionales
    Resultado _resultado = await UnidadesFuncionales.borrar(widget.registro);
    Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
  }

  String _validarEdificacion(int value) {
    _formaEditada = true;
    // TODO: Falta validar las Claves Foraneas
    // widget.registro.edificacion.id = value;
    return null;
  }

  String _validarZona(int value) {
    _formaEditada = true;
    // TODO: Falta validar las Claves Foraneas
    // widget.registro.zona.id = value;
    return null;
  }

  String _validarTipoUnidadFuncional(int value) {
    _formaEditada = true;
    // TODO: Falta validar las Claves Foraneas
    // widget.registro.tipoUnidadFuncional.id = value;
    return null;
  }

  String _validarDenomUnidadFuncional(String value) {
    _formaEditada = true;
    if (value.isEmpty)
      return campoObligatorio(
          UNIDADESFUNCIONALES.ETIQUETA_DENOMUNIDADFUNCIONAL);
    widget.registro.denomUnidadFuncional = value;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    DEM.mapaUnidadFuncional = widget.registro.toMap();

    return Scaffold(
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
                              width: 600,
                              height: 430,
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
                                                  child: Image.asset('images/web_qubi_habitaciones.png', fit: BoxFit.cover,),
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
                                                  'Habitaciones',
                                                  style: AppRes.appResMap[
                                                      Co.ESTILO_TITULO],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child: // Campo: Edificación. Tipo de Componente: BDBusquedaCombo
                                                      UICosa(),
//                                                     UICampo(
//                                                        ancho: 350,
//                                                        alto: 45,
//                                                        datos: DEM.mapaUnidadFuncional,
//                                                        tabla: UNIDADESFUNCIONALES.ETIQUETA_ENTIDAD,
//                                                        campo: UNIDADESFUNCIONALES.EDIFICACION,
//                                                        denominacion: UNIDADESFUNCIONALES.ETIQUETA_EDIFICACION,
//                                                         etiqueta: UNIDADESFUNCIONALES.ETIQUETA_EDIFICACION,
//                                                          componente: 'BDBusquedaCombo',
//                                                          longitud: 0,
//                                                          decimales: 0,
//                                                      ),
                                                ),
                                                SizedBox(width: 10,),
                                                Expanded(
                                                  child: // Campo: Zona. Tipo de Componente: BDBusquedaCombo
                                                      UICosa(),
//                      UICampo(
//                        ancho: 350,
//                        alto: 45,
//                        datos: DEM.mapaUnidadFuncional,
//                        tabla: UNIDADESFUNCIONALES.ETIQUETA_ENTIDAD,
//                        campo: UNIDADESFUNCIONALES.ZONA,
//                        denominacion: UNIDADESFUNCIONALES.ETIQUETA_ZONA,
//                        etiqueta: UNIDADESFUNCIONALES.ETIQUETA_ZONA,
//                       // componente: 'BDBusquedaCombo',
//                        longitud: 0,
//                        decimales: 0,
//
//
//                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 10, right: 10),

                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child: // Campo: Tipo de Unidad Funcional. Tipo de Componente: BDBusquedaCombo
                                                      UICosa(),
//                      UICampo(
//                        ancho: 350,
//                        alto: 45,
//                        datos: DEM.mapaUnidadFuncional,
//                        tabla: UNIDADESFUNCIONALES.ETIQUETA_ENTIDAD,
//                        campo: UNIDADESFUNCIONALES.TIPOUNIDADFUNCIONAL,
//                        denominacion: UNIDADESFUNCIONALES.ETIQUETA_TIPOUNIDADFUNCIONAL,
//                        etiqueta: UNIDADESFUNCIONALES.ETIQUETA_TIPOUNIDADFUNCIONAL,
//                       // componente: 'BDBusquedaCombo',
//
//
//                      ),
                                                ),
                                                SizedBox(width: 10,),

                                                Expanded(
                                                  child: // Campo: Denominación de la Unidad Funcional. Tipo de Componente: BDEdicion
                                                      UICampo(
                                                    ancho: 350,
                                                    alto: 45,
                                                    datos:
                                                        DEM.mapaUnidadFuncional,
                                                    tabla: UNIDADESFUNCIONALES
                                                        .ETIQUETA_ENTIDAD,
                                                    campo: UNIDADESFUNCIONALES
                                                        .DENOMUNIDADFUNCIONAL,
                                                    denominacion:
                                                        UNIDADESFUNCIONALES
                                                            .ETIQUETA_DENOMUNIDADFUNCIONAL,
                                                    etiqueta: UNIDADESFUNCIONALES
                                                        .ETIQUETA_DENOMUNIDADFUNCIONAL,
                                                    componente: 'BDEdicion',
                                                    longitud: 200,
                                                    decimales: 0,

                                                    //validatorTexto: _validarDenomUnidadFuncional,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: 550,
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
