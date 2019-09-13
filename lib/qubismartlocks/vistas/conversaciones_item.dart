/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Conversaciones
 [Mensajería (Chats)/Mensajería (Chats)/Conversaciones]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class ConversacionItem extends StatefulWidget {
  ConversacionItem({
    this.registro,
    this.lista,
    this.animation,
  });

  final List<Conversacion> lista;
  final Conversacion registro;
  final Animation animation;

  @override
  _ConversacionItemState createState() => _ConversacionItemState();
}

class _ConversacionItemState extends State<ConversacionItem> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          GlobalKey<ScaffoldState> key = Scaffold.of(context).widget.key;

          Resultado _resultado = await  Conversaciones.registro(widget.registro.id, widget.registro);
          if (_resultado.estado == Co.REGISTRO_BORRADO) {
            mensajeError(key.currentState, Co.MENSAJE_REGISTRO_BORRADO);
            widget.lista.remove(widget.registro);
          }
          if (_resultado.estado == Co.OK) {
            widget.registro.assign(_resultado.objeto);
            Conversacion registroEnEdicion = Conversacion();
            registroEnEdicion.assign(widget.registro);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) =>
                FConversacionesEdicion(
                  registro: registroEnEdicion,
                ),
              ),
            ).then((resultado) {
              if (resultado != null) {
                if (resultado.estado == Co.OK) {
                  widget.registro.assign(registroEnEdicion);
                }
                if (resultado.estado == Co.REGISTRO_BORRADO) {
                  widget.lista.remove(widget.registro);
                }
              }
              setState(() {});
            });
          }
        },
        child: Container(
          // height: Co.ALTO_ITEMS_LISTADOS,
          width: CD.ancho,
          color: AppRes.appResMap[Co.COLOR_FONDO_ITEM_LISTA],
          margin: const EdgeInsets.symmetric(vertical: Co.MARGEN_ITEMS_LISTADOS_VERTICAL),
          padding: const EdgeInsets.all(Co.PADDING_ITEMS_LISTADOS_VERTICAL),

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.registro.denomConversacion,
                      style: estiloListados),
                  Text(widget.registro.ordenPrioridad.toString(),
                      style: estiloListados),
                ],
              )
            ],
          )
        ),
    );
  }
}
