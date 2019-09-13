/*
 Proyecto: Qubi Smart Locks
 Version: 0.0.2
 Autor: Abner Hernández
 Unidad: Niveles de Usuarios
 [Seguridad/Seguridad/Niveles de Usuarios]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';

class UINivelesUsuarios extends StatefulWidget {
  UINivelesUsuarios({Key key}) : super(key: key);
  static const String ruta = '/nivelesusuarios';
  final v = Vidget();

  @override
  State createState() => _EstadoNivelesUsuarios();
}

class _EstadoNivelesUsuarios extends State<UINivelesUsuarios> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<NivelUsuario> lista = List<NivelUsuario>();

  Future<Resultado> getNivelesUsuarios() async {
    setState(() {
      widget.v.mensaje = Co.MENSAJE_ESPERA;
    });

    Resultado _resultado = await NivelesUsuarios.todos(lista);

    lista.sort((a, b) => a.denomNivelUsuario.compareTo(b.denomNivelUsuario));

    setState(() {
      if (_resultado.estado == Co.ERROR) {
        widget.v.mensaje = _resultado.mensaje;
      } else {
        widget.v.mensaje = '';
      }
    });

    return _resultado;
  }

  inicializar() async {
    getNivelesUsuarios();
  }

  @override
  void initState() {
    print('Token vacío: ${DEM.api.tokenData.isEmpty()}');

    super.initState();
    inicializar();
  }

  @override
  Widget build(BuildContext context) {
    widget.v.titulo = NIVELESUSUARIOS.ETIQUETA_ENTIDAD;

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
                                                child: CircleAvatar(
                                                  backgroundColor: AppRes
                                                      .appResMap[Co.COLOR_2],
                                                  backgroundImage: AssetImage(
                                                      AppRes.appResMap[Co
                                                          .BACKGROUND_CLIENTES]),
                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                width: 300,
                                                height: 50,
                                                child: Text(
                                                  'Usuarios',
                                                  style: AppRes.appResMap[
                                                  Co.ESTILO_TITULO],
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                EdgeInsets.only(left: 15),
                                                width: 500,
                                                alignment: Alignment.bottomLeft,
                                                child: Text(
                                                  'Niveles de Usuarios',
                                                  style: AppRes.appResMap[
                                                  Co.ESTILO_ETIQUETA],
                                                ),
                                              ),
                                              Container(
                                                width: 500,
                                                height: 1,
                                                color: AppRes
                                                    .appResMap[Co.COLOR_1],
                                              ),
                                            ],
                                          ),
// Aquí el código de listado, va la columna como child
//----------------------------------------------------------------------------
                                          Container(
                                            width: 500,
                                            height: 300,
                                            child: Card(
                                              color:
                                              AppRes.appResMap[Co.FONDO_1],
                                              child: Column(
                                                children: <Widget>[
                                                  ArtMensaje(
                                                      messageText:
                                                      widget.v.mensaje),
                                                  Flexible(
                                                    child: ListView.builder(
                                                      padding: EdgeInsets.all(
                                                          Co.PADDING_LISTAS),
                                                      itemCount: lista == null
                                                          ? 0
                                                          : lista.length,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                          int index) {
                                                        return NivelUsuarioItem(
                                                            lista: lista,
                                                            registro:
                                                            lista[index]);
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
// fin datos de listado
//-------------------------------------------------------------------------------------------------------------
                                          // Botones
                                          Container(
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                              children: <Widget>[
                                                Container(
                                                  width: 70,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        50),
                                                  ),
                                                  child: FlatButton(
                                                    color: AppRes.appResMap[Co.COLOR_2],
                                                    shape:
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            8)),
                                                    child: Icon(Icons.home,
                                                        color: AppRes.appResMap[
                                                        Co.COLOR_3]),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context).size.width / 4,
                                                ),
                                                Container(
                                                    width: 70,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          50),
                                                    ),
                                                    child: FlatButton(
                                                        color: AppRes.appResMap[Co.COLOR_2],
                                                        shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                8)),
                                                        child: Icon(Icons.add,
                                                            color: AppRes
                                                                .appResMap[
                                                            Co.COLOR_3]),
                                                        onPressed: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (BuildContext
                                                              context) =>
                                                                  FNivelesUsuariosEdicion(
                                                                    registro:
                                                                    NivelUsuario(),
                                                                  ),
                                                            ),
                                                          ).then((resultado) {
                                                            print(resultado);
                                                            if (resultado
                                                                .estado ==
                                                                Co.REGISTRO_NUEVO) {
                                                              lista.add(
                                                                  resultado
                                                                      .objeto);
                                                              lista.sort((a, b) => a
                                                                  .denomNivelUsuario
                                                                  .compareTo(b
                                                                  .denomNivelUsuario));
                                                            }
                                                          });
                                                        })),
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