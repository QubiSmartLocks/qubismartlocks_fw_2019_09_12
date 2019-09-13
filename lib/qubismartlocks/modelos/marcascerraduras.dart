/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad MarcasCerraduras -> Marca de Cerradura
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class MarcaCerradura {
  MarcaCerradura({
    this.id,
    this.denomMarcaCerradura,
    this.descMarcaCerradura,
  });

  int id;
  String denomMarcaCerradura;
  String descMarcaCerradura;

  fromKeyValue(String key, Map value) {
    this.id = value[MARCASCERRADURAS.ID];
    this.denomMarcaCerradura = value[MARCASCERRADURAS.DENOMMARCACERRADURA];
    this.descMarcaCerradura = value[MARCASCERRADURAS.DESCMARCACERRADURA];
  }

  toJson() {
    return {
      MARCASCERRADURAS.ID: this.id,
      MARCASCERRADURAS.DENOMMARCACERRADURA: this.denomMarcaCerradura,
      MARCASCERRADURAS.DESCMARCACERRADURA: this.descMarcaCerradura,
    };
  }

  assign(MarcaCerradura marcaCerradura) {

    if (marcaCerradura == null) {
      this.id = null; //0;
      this.denomMarcaCerradura = null; //'';
      this.descMarcaCerradura = null; //'';
    } else {
      this.id = marcaCerradura.id;
      this.denomMarcaCerradura = marcaCerradura.denomMarcaCerradura;
      this.descMarcaCerradura = marcaCerradura.descMarcaCerradura;
    }
  }

  Map toMap() {
    Map map = {
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
      descMarcaCerradura.hashCode 
  ]);

}

//==============================================================================
class MARCASCERRADURAS {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Marcas de Cerraduras';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Marca de Cerradura';

  // Etiquetas de los Atributos
  static const String ETIQUETA_ID = 'Id';
  static const String ETIQUETA_DENOMMARCACERRADURA = 'Denominación del Marca de Cerradura';
  static const String ETIQUETA_DESCMARCACERRADURA = 'Descripción del Marca de Cerradura';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'MarcasCerraduras';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'MarcaCerradura';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String ID = 'id';
  static const String DENOMMARCACERRADURA = 'denomMarcaCerradura';
  static const String DESCMARCACERRADURA = 'descMarcaCerradura';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [ID,DENOMMARCACERRADURA,];
  static const List CAMPOS_DETALLE = [ID,DENOMMARCACERRADURA,DESCMARCACERRADURA,];

}
