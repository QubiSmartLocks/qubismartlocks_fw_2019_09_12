/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad ModelosForaneos -> Modelo Foráneo
   [Qubi Smart Locks/Modelos de Campos]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class ModeloForaneo {
  ModeloForaneo({
    this.key = '',
    this.id,
    this.denomModeloForaneo,
    this.descModeloForaneo,
  });

  String key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
  int id;  // Id [Búsqueda: int]
  String denomModeloForaneo;  // Denominación 200 No Nulo [Texto Variable: String]
  String descModeloForaneo;  // Descripción 4096 [Texto Variable: String]

  fromSnapshot(fb.DataSnapshot data) {
    this.fromKeyValue(data.key, data.val());
  }

  fromKeyValue(String key, Map value) {
    this.key = key; // Incluido por usar Firebase Database, pero no en Dendrita
    this.id = value[MODELOSFORANEOS.ID];
    this.denomModeloForaneo = value[MODELOSFORANEOS.DENOMMODELOFORANEO];
    this.descModeloForaneo = value[MODELOSFORANEOS.DESCMODELOFORANEO];
  }

  toJson() {
    return {
      'key': this.key, // Incluido por usar Firebase Database, pero no en Dendrita
      MODELOSFORANEOS.ID: this.id,
      MODELOSFORANEOS.DENOMMODELOFORANEO: this.denomModeloForaneo,
      MODELOSFORANEOS.DESCMODELOFORANEO: this.descModeloForaneo,
    };
  }

  assign(ModeloForaneo modeloForaneo) {

    if (modeloForaneo == null) {
      this.key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
      this.id = null; //0;
      this.denomModeloForaneo = null; //'';
      this.descModeloForaneo = null; //'';
    } else {
      this.key = modeloForaneo.key; // Incluido por usar Firebase Database, pero no en Dendrita
      this.id = modeloForaneo.id;
      this.denomModeloForaneo = modeloForaneo.denomModeloForaneo;
      this.descModeloForaneo = modeloForaneo.descModeloForaneo;
    }
  }

  Map toMap() {
    Map map = {
      MODELOSFORANEOS.KEY: this.key,  // Incluido por usar Firebase Database, pero no en Dendrita
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
    this.key = map[MODELOSFORANEOS.KEY];  // Incluido por usar Firebase Database, pero no en Dendrita
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
      descModeloForaneo.hashCode,
  ]);

}

//==============================================================================
class MODELOSFORANEOS {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Modelos Foráneos';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Modelo Foráneo';

  // Etiquetas de los Atributos

  static const String ETIQUETA_KEY = 'Key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ETIQUETA_ID = 'Id';
  static const String ETIQUETA_DENOMMODELOFORANEO = 'Denominación del Modelo Foraneo';
  static const String ETIQUETA_DESCMODELOFORANEO = 'Descripción del Modelo Foraneo';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'ModelosForaneos';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'ModeloForaneo';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String KEY = 'key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ID = 'id';
  static const String DENOMMODELOFORANEO = 'denomModeloForaneo';
  static const String DESCMODELOFORANEO = 'descModeloForaneo';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [
 KEY, ID, DENOMMODELOFORANEO,];
  static const List CAMPOS_DETALLE = [
 KEY, ID, DENOMMODELOFORANEO, DESCMODELOFORANEO,];

}
