/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelos Campos -> Inicializar Modelo Campo
 [Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class InicializarModelosCampos {
  static init() async {
    int i = 1;
    ModeloCampo _modeloCampo;

    _modeloCampo = new ModeloCampo();
    _modeloCampo.id = i++;
    _modeloCampo.denomModelo = '';
    _modeloCampo.descModelo = '';
    _modeloCampo.fecha = DateTime.now();
    _modeloCampo.hora = TimeOfDay.now();
    _modeloCampo.entero = 0;
    _modeloCampo.enteroGrande = 0;
    _modeloCampo.enteroPequeyo = 0;
    _modeloCampo.decimal = 0.00;
    _modeloCampo.moneda = 0.00;
    _modeloCampo.logico = false;
    _modeloCampo.ubicacionGPS = '';
    _modeloCampo.imagen = '';
    _modeloCampo.modeloForaneo = DEM.listaModelosForaneos[0];
    // Guarda usando el API
//    await ModelosCampos.guardar(_modeloCampo);
    // Guarda usando Firebase Realtime Database
//    await ModelosCamposFB.guardarModeloCampo(modeloCampo: _modeloCampo);
    DEM.listaModelosCampos.add(_modeloCampo);

  }
}
