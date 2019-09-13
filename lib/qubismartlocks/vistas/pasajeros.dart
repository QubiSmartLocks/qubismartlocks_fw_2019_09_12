/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Pasajeros
 [Qubi Smart Locks/Qubi Smart Locks/Pasajeros]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class FPasajeros extends StatefulWidget {
  FPasajeros({Key key}) : super(key: key);
  static const String ruta = '/pasajeros';
  final v = Vidget();

  @override
  State createState() => _EstadoPasajeros();
}

class _EstadoPasajeros extends State<FPasajeros> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Pasajero> lista = List<Pasajero>();

  Future<Resultado> getPasajeros() async {
    setState(() {
      widget.v.mensaje = Co.MENSAJE_ESPERA;
    });

    Resultado _resultado = await Pasajeros.todos(lista);

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
    getPasajeros();
  }

  @override
  void initState() {
    super.initState();
    inicializar();
  }

  @override
  Widget build(BuildContext context) {
    widget.v.titulo = PASAJEROS.ETIQUETA_ENTIDAD;

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
            onPressed: getPasajeros,
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
                return PasajeroItem(
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
                  FPasajerosEdicion(
                      registro: Pasajero(),
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
