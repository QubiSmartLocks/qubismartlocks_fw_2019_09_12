import 'package:qubismartlocks_fw/qubismartlocks.dart';


class ListaConversaciones extends StatefulWidget {
  ListaConversaciones({this.refrescar});

  final VoidCallback refrescar;

  @override
  _ListaConversacionesState createState() => _ListaConversacionesState();
}

class _ListaConversacionesState extends State<ListaConversaciones> {
  List<Conversacion> listaConversaciones = List<Conversacion>();

  _inicializar() async {
    DEM.db.ref('Conversaciones').onValue.listen((event) {
      setState(() {
        listaConversaciones.clear();
      });
      print('Algo ha pasado...');
      if ((event != null) &&
          (event.snapshot != null) &&
          (event.snapshot.val() != null)) {
//        listaConversaciones.clear();
        print('Data de Conversaciones recibida...');
        print(event.snapshot.key);
        Map<String, dynamic> mapa = event.snapshot.val();
        mapa.forEach((key, value) {
          final registro = Conversacion();
          registro.fromMap(value);
          listaConversaciones.add(registro);
        });
        // TODO: ordenar la lista en orden inverso
        // (la última conversación primero)
        // por fecha/hora de actualización
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    _inicializar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//    print(DEM.fakeData.listaConversaciones.runtimeType);
    return ListView.builder(
//      itemCount: DEM.fakeData.listaConversaciones.length,
      itemCount: listaConversaciones.length,
      itemBuilder: (context, index) {
//        Conversacion conversacion = DEM.fakeData.listaConversaciones[index];
        Conversacion conversacion = listaConversaciones[index];
        return GestureDetector(
          child: ListTile(
            title: Text('${conversacion.denomConversacion}'),
            subtitle: Row(children: <Widget>[
              Icon(
                Icons.markunread,
                size: 20,
                color: Colors.grey.shade300,
              ),
              Text('${conversacion.fechaUltimoMensaje}'),
            ]),
//            trailing: Column(children: <Widget>[
//              Icon(
//                Icons.phone,
//                size: 20,
//                color: Colors.grey.shade300,
//              ),
//              Text('${conversacion.ordenPrioridad}'),
//            ]),
          ),
          onTap: () {
            DEM.conversacionActiva.assign(conversacion);
            DEM.mensajesEnConversacionActiva.clear();
            DEM.mensajesEnConversacionActiva = DEM.fakeData.listaMensajes
                .where((m) => m.conversacion.id == DEM.conversacionActiva.id)
                .toList();

            if (widget.refrescar != null) widget.refrescar();
          },
        );
      },
    );
  }
}
