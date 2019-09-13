/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelos Campos
 [Modelos de Campos/Modelos de Campos/Modelos Campos]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class ModeloCampoItem extends StatefulWidget {
  ModeloCampoItem({
    this.registro,
    this.lista,
    this.animation,
  });

  final List<ModeloCampo> lista;
  final ModeloCampo registro;
  final Animation animation;

  @override
  _ModeloCampoItemState createState() => _ModeloCampoItemState();
}

class _ModeloCampoItemState extends State<ModeloCampoItem> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          GlobalKey<ScaffoldState> key = Scaffold.of(context).widget.key;

          Resultado _resultado = await  ModelosCampos.registro(widget.registro.id, widget.registro);
          if (_resultado.estado == Co.REGISTRO_BORRADO) {
            mensajeError(key.currentState, Co.MENSAJE_REGISTRO_BORRADO);
            widget.lista.remove(widget.registro);
          }
          if (_resultado.estado == Co.OK) {
            widget.registro.assign(_resultado.objeto);
            ModeloCampo registroEnEdicion = ModeloCampo();
            registroEnEdicion.assign(widget.registro);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) =>
                FModelosCamposEdicion(
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
                  Text(widget.registro.denomModelo,
                      style: estiloListados),
                  Text(widget.registro.fecha.toString(),
                      style: estiloListados),
                  Text(widget.registro.hora.toString(),
                      style: estiloListados),
                  Text(widget.registro.entero.toString(),
                      style: estiloListados),
                  Text(widget.registro.logico.toString(),
                      style: estiloListados),
                  Text(widget.registro.modeloForaneo.denomModeloForaneo,
                      style: estiloListados),
                ],
              )
            ],
          )
        ),
    );
  }
}
