/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Clientes
 [Qubi Smart Locks/Qubi Smart Locks/Clientes]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIClientesForma extends StatefulWidget {
  static const String ruta = '/ui-clientes/forma';

  @override
  _UIClientesFormaState createState() => _UIClientesFormaState();
}

class _UIClientesFormaState extends State<UIClientesForma> {

  _nuevocliente() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIClienteEdicion(registro: Cliente())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return UI_Base(
      factorAlto: AppRes.appResMap[AppCo.FORMA_CLIENTES_FACTOR_ALTO],
      factorAncho: AppRes.appResMap[AppCo.FORMA_CLIENTES_FACTOR_ANCHO],
      icono: AppRes.appResMap[AppCo.FORMA_CLIENTES_IMAGEN_ICONO],
      titulo: AppRes.appResMap[AppCo.FORMA_CLIENTES_TITULO],
      onTapAdd: _nuevocliente,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // TODO: Aquí el Widget de Filtrar/Buscar/Releer/Agregar/etc
          // Lista
          UIClientesLista(),
          // Botones
          UIFormaButtons(onTapAdd: _nuevocliente),
        ],
      ),
    );
  }
}
