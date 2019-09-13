/*
 Proyecto: Qubi Smart Locks
 Version: 0.0.2
 Autor: Abner Hernández
 Unidad: Marcas de Cerraduras
 [Qubi Smart Locks/Qubi Smart Locks/Marcas de Cerraduras]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIMarcaCerraduraItem extends StatefulWidget {
  UIMarcaCerraduraItem({
    this.registro,
    this.lista,
    this.animation,
  });

  final List<MarcaCerradura> lista;
  final MarcaCerradura registro;
  final Animation animation;

  @override
  _UIMarcaCerraduraItemState createState() => _UIMarcaCerraduraItemState();
}

class _UIMarcaCerraduraItemState extends State<UIMarcaCerraduraItem> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        GlobalKey<ScaffoldState> key = Scaffold.of(context).widget.key;

        Resultado _resultado = await  MarcasCerraduras.registro(widget.registro.id, widget.registro);
        if (_resultado.estado == Co.REGISTRO_BORRADO) {
          mensajeError(key.currentState, Co.MENSAJE_REGISTRO_BORRADO);
          widget.lista.remove(widget.registro);
        }
        if (_resultado.estado == Co.OK) {
          widget.registro.assign(_resultado.objeto);
          MarcaCerradura registroEnEdicion = MarcaCerradura();
          registroEnEdicion.assign(widget.registro);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  UIMarcasCerradurasEdicion(
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
                  Text(widget.registro.denomMarcaCerradura,
                      style: estiloListados),
                ],
              ),
              Text(widget.registro.denomMarcaCerradura,
                  style: estiloListados),
            ],
          )
      ),
    );
  }
}
