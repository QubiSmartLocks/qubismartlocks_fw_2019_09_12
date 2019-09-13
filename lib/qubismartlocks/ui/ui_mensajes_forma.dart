/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Mensajes
 [Mensajería (Chats)/Mensajería (Chats)/Mensajes]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIMensajesForma extends StatefulWidget {
  static const String ruta = '/ui-mensajes/forma';

  @override
  _UIMensajesFormaState createState() => _UIMensajesFormaState();
}

class _UIMensajesFormaState extends State<UIMensajesForma> {

  _nuevomensaje() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIMensajeEdicion(registro: Mensaje())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return UI_Base(
      factorAlto: AppRes.appResMap[AppCo.FORMA_MENSAJES_FACTOR_ALTO],
      factorAncho: AppRes.appResMap[AppCo.FORMA_MENSAJES_FACTOR_ANCHO],
      icono: AppRes.appResMap[AppCo.FORMA_MENSAJES_IMAGEN_ICONO],
      titulo: AppRes.appResMap[AppCo.FORMA_MENSAJES_TITULO],
      onTapAdd: _nuevomensaje,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // TODO: Aquí el Widget de Filtrar/Buscar/Releer/Agregar/etc
          // Lista
          UIMensajesLista(),
          // Botones
          UIFormaButtons(onTapAdd: _nuevomensaje),
        ],
      ),
    );
  }
}
