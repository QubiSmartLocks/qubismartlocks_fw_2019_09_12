/*
 Proyecto: Qubi Smart Locks
 Version: 0.0.2
 Autor: Abner Hernández
 Unidad: UI__Mensaje
         Muestra un mensaje en pantalla si la condición se cumple
 */

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UI__Mensaje extends StatelessWidget {
  UI__Mensaje(this.visible, this.mensaje);
  final bool visible;
  final String mensaje;

  @override
  Widget build(BuildContext context) {

    return visible
            ? Center(
                child: Container(
                  color: AppRes.appResMap[Co.FONDO_CONTENEDOR_MENSAJE],
                  width: 250,
                  height: 100,
                  child: Card(
                    color: AppRes.appResMap[Co.FONDO_MENSAJE],
                    child: Center(
                      child: Text(mensaje,
                      style: AppRes.appResMap[Co.ESTILO_MENSAJE]),
                    ),
                  ),
                ),
              )
            : Container();

  }
}
