/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Tipos de Unidades Funcionales
 [Qubi Smart Locks/Qubi Smart Locks/Tipos de Unidades Funcionales]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class TipoUnidadFuncionalItem extends StatefulWidget {
  TipoUnidadFuncionalItem({
    this.registro,
    this.lista,
    this.animation,
  });

  final List<TipoUnidadFuncional> lista;
  final TipoUnidadFuncional registro;
  final Animation animation;

  @override
  _TipoUnidadFuncionalItemState createState() => _TipoUnidadFuncionalItemState();
}

class _TipoUnidadFuncionalItemState extends State<TipoUnidadFuncionalItem> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          GlobalKey<ScaffoldState> key = Scaffold.of(context).widget.key;

          Resultado _resultado = await  TipUnidadesFuncionales.registro(widget.registro.id, widget.registro);
          if (_resultado.estado == Co.REGISTRO_BORRADO) {
            mensajeError(key.currentState, Co.MENSAJE_REGISTRO_BORRADO);
            widget.lista.remove(widget.registro);
          }
          if (_resultado.estado == Co.OK) {
            widget.registro.assign(_resultado.objeto);
            TipoUnidadFuncional registroEnEdicion = TipoUnidadFuncional();
            registroEnEdicion.assign(widget.registro);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) =>
                FTipUnidadesFuncionalesEdicion(
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
                  Text(widget.registro.denomTipoUnidadFuncional,
                      style: estiloListados),
                  Text(widget.registro.maximoCerradurasAsignadas.toString(),
                      style: estiloListados),
                ],
              )
            ],
          )
        ),
    );
  }
}
