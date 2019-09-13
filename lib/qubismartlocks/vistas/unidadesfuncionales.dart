/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Unidades Funcionales
 [Qubi Smart Locks/Qubi Smart Locks/Unidades Funcionales]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class FUnidadesFuncionales extends StatefulWidget {
  FUnidadesFuncionales({Key key}) : super(key: key);
  static const String ruta = '/unidadesfuncionales';
  final v = Vidget();

  @override
  State createState() => _EstadoUnidadesFuncionales();
}

class _EstadoUnidadesFuncionales extends State<FUnidadesFuncionales> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<UnidadFuncional> lista = List<UnidadFuncional>();

  Future<Resultado> getUnidadesFuncionales() async {
    setState(() {
      widget.v.mensaje = Co.MENSAJE_ESPERA;
    });

    Resultado _resultado = await UnidadesFuncionales.todos(lista);

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
    getUnidadesFuncionales();
  }

  @override
  void initState() {
    super.initState();
    inicializar();
  }

  @override
  Widget build(BuildContext context) {
    widget.v.titulo = UNIDADESFUNCIONALES.ETIQUETA_ENTIDAD;

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
            onPressed: getUnidadesFuncionales,
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
                return UnidadFuncionalItem(
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
                  FUnidadesFuncionalesEdicion(
                      registro: UnidadFuncional(),
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
