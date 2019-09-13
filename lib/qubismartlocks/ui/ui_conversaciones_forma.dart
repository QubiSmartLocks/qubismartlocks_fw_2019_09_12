/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Conversaciones
 [Mensajería (Chats)/Mensajería (Chats)/Conversaciones]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIConversacionesForma extends StatefulWidget {
  static const String ruta = '/ui-conversaciones/forma';

  @override
  _UIConversacionesFormaState createState() => _UIConversacionesFormaState();
}

class _UIConversacionesFormaState extends State<UIConversacionesForma> {

  _nuevoconversacion() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIConversacionEdicion(registro: Conversacion())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return UI_Base(
      factorAlto: AppRes.appResMap[AppCo.FORMA_CONVERSACIONES_FACTOR_ALTO],
      factorAncho: AppRes.appResMap[AppCo.FORMA_CONVERSACIONES_FACTOR_ANCHO],
      icono: AppRes.appResMap[AppCo.FORMA_CONVERSACIONES_IMAGEN_ICONO],
      titulo: AppRes.appResMap[AppCo.FORMA_CONVERSACIONES_TITULO],
      onTapAdd: _nuevoconversacion,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // TODO: Aquí el Widget de Filtrar/Buscar/Releer/Agregar/etc
          // Lista
          UIConversacionesLista(),
          // Botones
          UIFormaButtons(onTapAdd: _nuevoconversacion),
        ],
      ),
    );
  }
}
