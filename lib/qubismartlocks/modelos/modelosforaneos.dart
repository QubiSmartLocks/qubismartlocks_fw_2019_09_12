/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad ModelosForaneos -> Modelo Foráneo
   [Qubi Smart Locks/Modelos de Campos]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class ModeloForaneo {
  ModeloForaneo({
    this.id,
    this.denomModeloForaneo,
    this.descModeloForaneo,
  });

  int id;
  String denomModeloForaneo;
  String descModeloForaneo;

  fromKeyValue(String key, Map value) {
    this.id = value[MODELOSFORANEOS.ID];
    this.denomModeloForaneo = value[MODELOSFORANEOS.DENOMMODELOFORANEO];
    this.descModeloForaneo = value[MODELOSFORANEOS.DESCMODELOFORANEO];
  }

  toJson() {
    return {
      MODELOSFORANEOS.ID: this.id,
      MODELOSFORANEOS.DENOMMODELOFORANEO: this.denomModeloForaneo,
      MODELOSFORANEOS.DESCMODELOFORANEO: this.descModeloForaneo,
    };
  }

  assign(ModeloForaneo modeloForaneo) {

    if (modeloForaneo == null) {
      this.id = null; //0;
      this.denomModeloForaneo = null; //'';
      this.descModeloForaneo = null; //'';
    } else {
      this.id = modeloForaneo.id;
      this.denomModeloForaneo = modeloForaneo.denomModeloForaneo;
      this.descModeloForaneo = modeloForaneo.descModeloForaneo;
    }
  }

  Map toMap() {
    Map map = {
      MODELOSFORANEOS.ID: this.id,
      MODELOSFORANEOS.DENOMMODELOFORANEO: this.denomModeloForaneo,
      MODELOSFORANEOS.DESCMODELOFORANEO: this.descModeloForaneo,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.id = map[MODELOSFORANEOS.ID];
    this.denomModeloForaneo = map[MODELOSFORANEOS.DENOMMODELOFORANEO];
    this.descModeloForaneo = map[MODELOSFORANEOS.DESCMODELOFORANEO];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final ModeloForaneo typedOther = other;
    return
        id == typedOther.id &&
        denomModeloForaneo == typedOther.denomModeloForaneo &&
        descModeloForaneo == typedOther.descModeloForaneo;
  }


  @override
  int get hashCode => hashObjects([
      id.hashCode,
      denomModeloForaneo.hashCode,
      descModeloForaneo.hashCode 
  ]);

}

//==============================================================================
class MODELOSFORANEOS {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Modelos Foráneos';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Modelo Foráneo';

  // Etiquetas de los Atributos
  static const String ETIQUETA_ID = 'Id';
  static const String ETIQUETA_DENOMMODELOFORANEO = 'Denominación del Modelo Foraneo';
  static const String ETIQUETA_DESCMODELOFORANEO = 'Descripción del Modelo Foraneo';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'ModelosForaneos';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'ModeloForaneo';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String ID = 'id';
  static const String DENOMMODELOFORANEO = 'denomModeloForaneo';
  static const String DESCMODELOFORANEO = 'descModeloForaneo';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [ID,DENOMMODELOFORANEO,];
  static const List CAMPOS_DETALLE = [ID,DENOMMODELOFORANEO,DESCMODELOFORANEO,];

}
