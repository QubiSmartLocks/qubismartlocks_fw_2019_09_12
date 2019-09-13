/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Mensajes Automáticos
 [Mensajería (Chats)/Mensajería (Chats)/Mensajes Automáticos]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIMensajesAutomaticosForma extends StatefulWidget {
  static const String ruta = '/ui-mensajesautomaticos/forma';

  @override
  _UIMensajesAutomaticosFormaState createState() => _UIMensajesAutomaticosFormaState();
}

class _UIMensajesAutomaticosFormaState extends State<UIMensajesAutomaticosForma> {

  _nuevomensajeautomatico() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIMensajeAutomaticoEdicion(registro: MensajeAutomatico())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return UI_Base(
      factorAlto: AppRes.appResMap[AppCo.FORMA_MENSAJESAUTOMATICOS_FACTOR_ALTO],
      factorAncho: AppRes.appResMap[AppCo.FORMA_MENSAJESAUTOMATICOS_FACTOR_ANCHO],
      icono: AppRes.appResMap[AppCo.FORMA_MENSAJESAUTOMATICOS_IMAGEN_ICONO],
      titulo: AppRes.appResMap[AppCo.FORMA_MENSAJESAUTOMATICOS_TITULO],
      onTapAdd: _nuevomensajeautomatico,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // TODO: Aquí el Widget de Filtrar/Buscar/Releer/Agregar/etc
          // Lista
          UIMensajesAutomaticosLista(),
          // Botones
          UIFormaButtons(onTapAdd: _nuevomensajeautomatico),
        ],
      ),
    );
  }
}
