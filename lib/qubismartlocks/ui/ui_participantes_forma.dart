/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Participantes
 [Mensajería (Chats)/Mensajería (Chats)/Participantes]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIParticipantesForma extends StatefulWidget {
  static const String ruta = '/ui-participantes/forma';

  @override
  _UIParticipantesFormaState createState() => _UIParticipantesFormaState();
}

class _UIParticipantesFormaState extends State<UIParticipantesForma> {

  _nuevoparticipante() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIParticipanteEdicion(registro: Participante())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return UI_Base(
      factorAlto: AppRes.appResMap[AppCo.FORMA_PARTICIPANTES_FACTOR_ALTO],
      factorAncho: AppRes.appResMap[AppCo.FORMA_PARTICIPANTES_FACTOR_ANCHO],
      icono: AppRes.appResMap[AppCo.FORMA_PARTICIPANTES_IMAGEN_ICONO],
      titulo: AppRes.appResMap[AppCo.FORMA_PARTICIPANTES_TITULO],
      onTapAdd: _nuevoparticipante,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // TODO: Aquí el Widget de Filtrar/Buscar/Releer/Agregar/etc
          // Lista
          UIParticipantesLista(),
          // Botones
          UIFormaButtons(onTapAdd: _nuevoparticipante),
        ],
      ),
    );
  }
}
