import 'package:qubismartlocks_fw/qubismartlocks.dart';

class UINivelesUsuariosEdicion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: AppRes.appResMap[Co.FONDO_1],
        elevation: 3,
        child: Container(
          width: 550,
          height: 550,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(18)),
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
                            margin: EdgeInsets.only(top: 25, bottom: 15),
                            width: 80,
                            height: 80,
                            child: CircleAvatar(
                              backgroundColor: AppRes.appResMap[Co.COLOR_2],
                              backgroundImage: AssetImage(
                                  AppRes.appResMap[Co.BACKGROUND_CLIENTES]),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 300,
                            height: 50,
                            child: Text(
                              'Niveles de Usuarios',
                              style: AppRes.appResMap[Co.ESTILO_TITULO],
                            ),
                          ),
                        ],
                      ),
                      //----------------------------------------------------------------------------
// Campo: Denominación del Nivel de Usuario. Tipo de Componente: BDEdicion
                      UICampo(
                        ancho: 350,
                        alto: 45,
                        datos: DEM.mapaNivelUsuario,
                        tabla: NIVELESUSUARIOS.ETIQUETA_ENTIDAD,
                        campo: NIVELESUSUARIOS.DENOMNIVELUSUARIO,
                        denominacion: NIVELESUSUARIOS.ETIQUETA_DENOMNIVELUSUARIO,
                        etiqueta: NIVELESUSUARIOS.ETIQUETA_DENOMNIVELUSUARIO,
                        componente: 'BDEdicion',
                        longitud: 200,
                        decimales: 0,

                        //validatorTexto: _validarDenomNivelUsuario,

                      ),
// Campo: Detalle de Niveles. Tipo de Componente: BDEdicion
                      UICampo(
                        ancho: 350,
                        alto: 45,
                        datos: DEM.mapaNivelUsuario,
                        tabla: NIVELESUSUARIOS.ETIQUETA_ENTIDAD,
                        campo: NIVELESUSUARIOS.DETNIVELES,
                        denominacion: NIVELESUSUARIOS.ETIQUETA_DETNIVELES,
                        etiqueta: NIVELESUSUARIOS.ETIQUETA_DETNIVELES,
                        componente: 'BDEdicion',
                        longitud: 4096,
                        decimales: 0,


                      ),
                      // Botones
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Text(
                                  'Guardar',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300),
                                ),
                                onPressed: () {},
                                color: Color(0xFF7EB8C0),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 15,
                            ),
                            Container(
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Text(
                                  'Cancelar',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                color: Color(0xFF7EB8C0),
                              ),
                            )
                          ],
                        ),
                      ),
                    ]),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}