/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Opciones de Mensajería
 [Mensajería (Chats)/Mensajería (Chats)/Opciones de Mensajería]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIOpcionesMensajeriaForma extends StatefulWidget {
  static const String ruta = '/ui-opcionesmensajeria/forma';

  @override
  _UIOpcionesMensajeriaFormaState createState() => _UIOpcionesMensajeriaFormaState();
}

class _UIOpcionesMensajeriaFormaState extends State<UIOpcionesMensajeriaForma> {

  _nuevoopcionmensajeria() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIOpcionMensajeriaEdicion(registro: OpcionMensajeria())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return UI_Base(
      factorAlto: AppRes.appResMap[AppCo.FORMA_OPCIONESMENSAJERIA_FACTOR_ALTO],
      factorAncho: AppRes.appResMap[AppCo.FORMA_OPCIONESMENSAJERIA_FACTOR_ANCHO],
      icono: AppRes.appResMap[AppCo.FORMA_OPCIONESMENSAJERIA_IMAGEN_ICONO],
      titulo: AppRes.appResMap[AppCo.FORMA_OPCIONESMENSAJERIA_TITULO],
      onTapAdd: _nuevoopcionmensajeria,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // TODO: Aquí el Widget de Filtrar/Buscar/Releer/Agregar/etc
          // Lista
          UIOpcionMensajeriaEdicion(),
          // Botones
          UIFormaButtons(onTapAdd: _nuevoopcionmensajeria),
        ],
      ),
    );
  }
}
