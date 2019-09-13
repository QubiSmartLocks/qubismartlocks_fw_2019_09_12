/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Room Types
 [Clock PMS (Api Reservaciones)/Clock PMS (Api Reservaciones)/Room Types]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class FRoomTypes extends StatefulWidget {
  FRoomTypes({Key key}) : super(key: key);
  static const String ruta = '/roomtypes';
  final v = Vidget();

  @override
  State createState() => _EstadoRoomTypes();
}

class _EstadoRoomTypes extends State<FRoomTypes> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<RoomType> lista = List<RoomType>();

  Future<Resultado> getRoomTypes() async {
    setState(() {
      widget.v.mensaje = Co.MENSAJE_ESPERA;
    });

    Resultado _resultado = await RoomTypes.todos(lista);

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
    getRoomTypes();
  }

  @override
  void initState() {
    super.initState();
    inicializar();
  }

  @override
  Widget build(BuildContext context) {
    widget.v.titulo = ROOMTYPES.ETIQUETA_ENTIDAD;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppRes.appResMap[Co.COLOR_FONDO_TITULO_LISTA],
        title: Text(
            widget.v.titulo,
            style: estiloTituloPantalla,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: getRoomTypes,
          ),
        ],
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
      ),
      body: Column(
        children: <Widget>[
          ArtMensaje(messageText: widget.v.mensaje),
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(Co.PADDING_LISTAS),
              itemCount:
                  lista == null ? 0 : lista.length,
              itemBuilder: (BuildContext context, int index) {
//                Animation<double> animation,
//                animation = Animation
                return RoomTypeItem(
                    lista: lista,
                    registro: lista[index]);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppRes.appResMap[Co.COLOR_PRINCIPAL],
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context , MaterialPageRoute(
              builder: (BuildContext context) =>
                  FRoomTypesEdicion(
                      registro: RoomType(),
                  ),
              ),
          ).then((resultado) {
            print(resultado);
            if (resultado.estado == Co.REGISTRO_NUEVO) {
              lista.add(resultado.objeto);
            }
          });
        },
      ),
    );
  }
}
