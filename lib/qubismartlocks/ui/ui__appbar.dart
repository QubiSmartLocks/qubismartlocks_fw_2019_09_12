import 'package:qubismartlocks_fw/qubismartlocks.dart';

class UI__AppBar extends StatelessWidget {
  UI__AppBar(this.condicion, this.texto, this.guardar, this.cancelar);

  final bool condicion;
//  final bool listado;
  final String texto;
  final VoidCallback guardar;
  final VoidCallback cancelar;

  @override
  Widget build(BuildContext context) {
    return condicion
        ? AppBar(
            title: Text(
              texto,
              style: AppRes.appResMap[Co.ESTILO_TITULO],
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.save),
                onPressed: guardar,
              ),
              IconButton(
                icon: Icon(Icons.clear),
                onPressed: cancelar,
              ),
            ],
          )
        : null;
  }

}
