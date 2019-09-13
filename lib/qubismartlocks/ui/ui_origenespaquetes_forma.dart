/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Orígenes de Paquetes
 [Qubi Smart Locks/Qubi Smart Locks/Orígenes de Paquetes]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIOrigenesPaquetesForma extends StatefulWidget {
  static const String ruta = '/ui-origenespaquetes/forma';

  @override
  _UIOrigenesPaquetesFormaState createState() => _UIOrigenesPaquetesFormaState();
}

class _UIOrigenesPaquetesFormaState extends State<UIOrigenesPaquetesForma> {

  _nuevoorigenpaquete() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIOrigenPaqueteEdicion(registro: OrigenPaquete())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return UI_Base(
      factorAlto: AppRes.appResMap[AppCo.FORMA_ORIGENESPAQUETES_FACTOR_ALTO],
      factorAncho: AppRes.appResMap[AppCo.FORMA_ORIGENESPAQUETES_FACTOR_ANCHO],
      icono: AppRes.appResMap[AppCo.FORMA_ORIGENESPAQUETES_IMAGEN_ICONO],
      titulo: AppRes.appResMap[AppCo.FORMA_ORIGENESPAQUETES_TITULO],
      onTapAdd: _nuevoorigenpaquete,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // TODO: Aquí el Widget de Filtrar/Buscar/Releer/Agregar/etc
          // Lista
          UIOrigenesPaquetesLista(),
          // Botones
          UIFormaButtons(onTapAdd: _nuevoorigenpaquete),
        ],
      ),
    );
  }
}
