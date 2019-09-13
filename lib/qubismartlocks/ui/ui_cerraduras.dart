/*
 Proyecto: Qubi Smart Locks
 Version: 0.0.2
 Autor: Abner Hernández
 Unidad: Cerraduras
 [Qubi Smart Locks/Qubi Smart Locks/Cerraduras]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UICerraduras extends StatefulWidget {
  UICerraduras({Key key}) : super(key: key);
  static const String ruta = '/cerraduras';
  final v = Vidget();

  @override
  State createState() => _EstadoCerraduras();
}

class _EstadoCerraduras extends State<UICerraduras> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Cerradura> lista = List<Cerradura>();

  Future<Resultado> getCerraduras() async {
    setState(() {
      widget.v.mensaje = Co.MENSAJE_ESPERA;
    });

    Resultado _resultado = await Cerraduras.todos(lista);

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
    getCerraduras();
  }

  @override
  void initState() {
    super.initState();
    inicializar();
  }

  @override
  Widget build(BuildContext context) {
    widget.v.titulo = CERRADURAS.ETIQUETA_ENTIDAD;

    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                MediaQuery.of(context).size.width > 800
                    ? UILaterales()
                    : Container(),
                // Contenedor principal
                Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width > 800
                      ? MediaQuery.of(context).size.width * 90 / 100
                      : MediaQuery.of(context).size.width,
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
                      // Card de datos generales
                      Center(
                        child: Card(
                          color: AppRes.appResMap[Co.FONDO_1],
                          elevation: 3,
                          child: Container(
                            width: MediaQuery.of(context).size.width > 800
                                ? MediaQuery.of(context).size.width * .6
                                : MediaQuery.of(context).size.width * .95,
                            height: MediaQuery.of(context).size.height > 800
                                ? MediaQuery.of(context).size.height * .6
                                : MediaQuery.of(context).size.height * .95,
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
                                              child:
                                                Container(
                                                  child:
                                                  Image.asset('web_qubi_icon_cerraduras.png'),
                                                ),
//                                              CircleAvatar(
//                                                backgroundColor: AppRes
//                                                    .appResMap[Co.COLOR_2],
//                                                backgroundImage:
//                                                AssetImage(imagenCard),
//                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              height: 50,
                                              child: Text(
                                                'Cerraduras',
                                                style: AppRes.appResMap[
                                                Co.ESTILO_TITULO],
                                              ),
                                            ),
                                          ],
                                        ),
                                        // Listado
                                        Container(
                                            width: MediaQuery.of(context).size.width > 800 ? MediaQuery.of(context).size.width * .6
                                                : MediaQuery.of(context)
                                                .size
                                                .width *
                                                .95,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height >
                                                800
                                                ? MediaQuery.of(context)
                                                .size
                                                .height *
                                                .3
                                                : MediaQuery.of(context)
                                                .size
                                                .height *
                                                .5,
                                            child: UICerradurasLista(),
                                        ),
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
                                                  BorderRadius.circular(50),
                                                ),
                                                child: FlatButton(
                                                  color: AppRes
                                                      .appResMap[Co.COLOR_2],
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8)),
                                                  child: Icon(Icons.home,
                                                      color: AppRes.appResMap[
                                                      Co.COLOR_3]),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ),
                                              IconButton(
                                                color: AppRes
                                                    .appResMap[Co.COLOR_2],
                                                icon: Icon(Icons.refresh),
//                                                  onPressed:
//                                                  getMarcasCerraduras,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                    4,
                                              ),
                                              Container(
                                                  width: 70,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        50),
                                                  ),
                                                  child: FlatButton(
                                                    color: AppRes
                                                        .appResMap[Co.COLOR_2],
                                                    shape:
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            8)),
                                                    child: Icon(Icons.add,
                                                        color: AppRes.appResMap[
                                                        Co.COLOR_1]),
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (BuildContext
                                                          context) =>
                                                              UICerradurasEdicion(
                                                                registro:
                                                                Cerradura(),
                                                              ),
                                                        ),
                                                      ).then((resultado) {
                                                        print(resultado);
                                                        if (resultado.estado ==
                                                            Co.REGISTRO_NUEVO) {
                                                          lista.add(
                                                              resultado.objeto);
                                                        }
                                                      });
                                                    },
                                                  )),
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
                      ),
                    ],
                  ),
                ),
                MediaQuery.of(context).size.width > 800
                    ? UILaterales()
                    : Container(),
              ],
            ),
          ],
        ),
//        ),
      ),
    );
  }
}


//Scaffold(
//key: _scaffoldKey,
//appBar: AppBar(
//backgroundColor: AppRes.appResMap[Co.COLOR_FONDO_TITULO_LISTA],
//title: Text(
//widget.v.titulo,
//style: estiloTituloPantalla,
//),
//actions: <Widget>[
//IconButton(
//icon: Icon(Icons.refresh),
//onPressed: getCerraduras,
//),
//],
//elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
//),
//body: Column(
//children: <Widget>[
//ArtMensaje(messageText: widget.v.mensaje),
//Flexible(
//child: ListView.builder(
//padding: EdgeInsets.all(Co.PADDING_LISTAS),
//itemCount:
//lista == null ? 0 : lista.length,
//itemBuilder: (BuildContext context, int index) {
////                Animation<double> animation,
////                animation = Animation
//return CerraduraItem(
//lista: lista,
//registro: lista[index]);
//},
//),
//),
//],
//),
//floatingActionButton: FloatingActionButton(
//backgroundColor: AppRes.appResMap[Co.COLOR_PRINCIPAL],
//child: const Icon(Icons.add),
//onPressed: () {
//Navigator.push(context , MaterialPageRoute(
//builder: (BuildContext context) =>
//UICerradurasEdicion(
//registro: Cerradura(),
//),
//),
//).then((resultado) {
//print(resultado);
//if (resultado.estado == Co.REGISTRO_NUEVO) {
//lista.add(resultado.objeto);
//}
//});
//},
//),
//);