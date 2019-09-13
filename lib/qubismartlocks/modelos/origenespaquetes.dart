/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad OrigenesPaquetes -> Orígen de Paquete
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class OrigenPaquete {
  OrigenPaquete({
    this.id,
    this.denomOrigenPaquete,
  });

  int id;
  String denomOrigenPaquete;

  fromKeyValue(String key, Map value) {
    this.id = value[ORIGENESPAQUETES.ID];
    this.denomOrigenPaquete = value[ORIGENESPAQUETES.DENOMORIGENPAQUETE];
  }

  toJson() {
    return {
      ORIGENESPAQUETES.ID: this.id,
      ORIGENESPAQUETES.DENOMORIGENPAQUETE: this.denomOrigenPaquete,
    };
  }

  assign(OrigenPaquete origenPaquete) {

    if (origenPaquete == null) {
      this.id = null; //0;
      this.denomOrigenPaquete = null; //'';
    } else {
      this.id = origenPaquete.id;
      this.denomOrigenPaquete = origenPaquete.denomOrigenPaquete;
    }
  }

  Map toMap() {
    Map map = {
      ORIGENESPAQUETES.ID: this.id,
      ORIGENESPAQUETES.DENOMORIGENPAQUETE: this.denomOrigenPaquete,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.id = map[ORIGENESPAQUETES.ID];
    this.denomOrigenPaquete = map[ORIGENESPAQUETES.DENOMORIGENPAQUETE];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final OrigenPaquete typedOther = other;
    return
        id == typedOther.id &&
        denomOrigenPaquete == typedOther.denomOrigenPaquete;
  }


  @override
  int get hashCode => hashObjects([
      id.hashCode,
      denomOrigenPaquete.hashCode 
  ]);

}

//==============================================================================
class ORIGENESPAQUETES {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Orígenes de Paquetes';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Orígen de Paquete';

  // Etiquetas de los Atributos
  static const String ETIQUETA_ID = 'Id';
  static const String ETIQUETA_DENOMORIGENPAQUETE = 'Denominación del Orígen de Paquete';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'OrigenesPaquetes';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'OrigenPaquete';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String ID = 'id';
  static const String DENOMORIGENPAQUETE = 'denomOrigenPaquete';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [ID,DENOMORIGENPAQUETE,];
  static const List CAMPOS_DETALLE = [ID,DENOMORIGENPAQUETE,];

}
