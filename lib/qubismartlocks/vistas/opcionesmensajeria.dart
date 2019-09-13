/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Opciones de Mensajería
 [Mensajería (Chats)/Mensajería (Chats)/Opciones de Mensajería]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class FOpcionesMensajeria extends StatefulWidget {
  FOpcionesMensajeria({Key key}) : super(key: key);
  static const String ruta = '/opcionesmensajeria';
  final v = Vidget();

  @override
  State createState() => _EstadoOpcionesMensajeria();
}

class _EstadoOpcionesMensajeria extends State<FOpcionesMensajeria> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<OpcionMensajeria> lista = List<OpcionMensajeria>();

  Future<Resultado> getOpcionesMensajeria() async {
    setState(() {
      widget.v.mensaje = Co.MENSAJE_ESPERA;
    });

    Resultado _resultado = await OpcionesMensajeria.todos(lista);

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
    getOpcionesMensajeria();
  }

  @override
  void initState() {
    super.initState();
    inicializar();
  }

  @override
  Widget build(BuildContext context) {
    widget.v.titulo = OPCIONESMENSAJERIA.ETIQUETA_ENTIDAD;

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
            onPressed: getOpcionesMensajeria,
          ),
        ],
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
      ),
      body: Column(
        children: <Widget>[
          ArtMensaje(messageText: widget.v.mensaje),
          Text('Opción de Mensajería Detalle',
              style: Theme.of(context).textTheme.subhead),
        ],
      ),
    );
  }
}
