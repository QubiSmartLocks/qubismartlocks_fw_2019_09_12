/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad MarcasCerraduras -> Marca de Cerradura
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class MarcaCerradura {
  MarcaCerradura({
    this.key = '',
    this.id,
    this.denomMarcaCerradura,
    this.descMarcaCerradura,
  });

  String key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
  int id;  // Id [Búsqueda: int]
  String denomMarcaCerradura;  // Denominación 200 No Nulo [Texto Variable: String]
  String descMarcaCerradura;  // Descripción 4096 [Texto Variable: String]

  fromSnapshot(fb.DataSnapshot data) {
    this.fromKeyValue(data.key, data.val());
  }

  fromKeyValue(String key, Map value) {
    this.key = key; // Incluido por usar Firebase Database, pero no en Dendrita
    this.id = value[MARCASCERRADURAS.ID];
    this.denomMarcaCerradura = value[MARCASCERRADURAS.DENOMMARCACERRADURA];
    this.descMarcaCerradura = value[MARCASCERRADURAS.DESCMARCACERRADURA];
  }

  toJson() {
    return {
      'key': this.key, // Incluido por usar Firebase Database, pero no en Dendrita
      MARCASCERRADURAS.ID: this.id,
      MARCASCERRADURAS.DENOMMARCACERRADURA: this.denomMarcaCerradura,
      MARCASCERRADURAS.DESCMARCACERRADURA: this.descMarcaCerradura,
    };
  }

  assign(MarcaCerradura marcaCerradura) {

    if (marcaCerradura == null) {
      this.key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
      this.id = null; //0;
      this.denomMarcaCerradura = null; //'';
      this.descMarcaCerradura = null; //'';
    } else {
      this.key = marcaCerradura.key; // Incluido por usar Firebase Database, pero no en Dendrita
      this.id = marcaCerradura.id;
      this.denomMarcaCerradura = marcaCerradura.denomMarcaCerradura;
      this.descMarcaCerradura = marcaCerradura.descMarcaCerradura;
    }
  }

  Map toMap() {
    Map map = {
      MARCASCERRADURAS.KEY: this.key,  // Incluido por usar Firebase Database, pero no en Dendrita
      MARCASCERRADURAS.ID: this.id,
      MARCASCERRADURAS.DENOMMARCACERRADURA: this.denomMarcaCerradura,
      MARCASCERRADURAS.DESCMARCACERRADURA: this.descMarcaCerradura,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.key = map[MARCASCERRADURAS.KEY];  // Incluido por usar Firebase Database, pero no en Dendrita
    this.id = map[MARCASCERRADURAS.ID];
    this.denomMarcaCerradura = map[MARCASCERRADURAS.DENOMMARCACERRADURA];
    this.descMarcaCerradura = map[MARCASCERRADURAS.DESCMARCACERRADURA];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final MarcaCerradura typedOther = other;
    return
        id == typedOther.id &&
        denomMarcaCerradura == typedOther.denomMarcaCerradura &&
        descMarcaCerradura == typedOther.descMarcaCerradura;
  }

  @override
  int get hashCode => hashObjects([
      id.hashCode,
      denomMarcaCerradura.hashCode,
      descMarcaCerradura.hashCode,
  ]);

}

//==============================================================================
class MARCASCERRADURAS {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Marcas de Cerraduras';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Marca de Cerradura';

  // Etiquetas de los Atributos

  static const String ETIQUETA_KEY = 'Key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ETIQUETA_ID = 'Id';
  static const String ETIQUETA_DENOMMARCACERRADURA = 'Denominación del Marca de Cerradura';
  static const String ETIQUETA_DESCMARCACERRADURA = 'Descripción del Marca de Cerradura';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'MarcasCerraduras';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'MarcaCerradura';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String KEY = 'key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ID = 'id';
  static const String DENOMMARCACERRADURA = 'denomMarcaCerradura';
  static const String DESCMARCACERRADURA = 'descMarcaCerradura';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [
 KEY, ID, DENOMMARCACERRADURA,];
  static const List CAMPOS_DETALLE = [
 KEY, ID, DENOMMARCACERRADURA, DESCMARCACERRADURA,];

}
