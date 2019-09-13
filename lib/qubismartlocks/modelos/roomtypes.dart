/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad RoomTypes -> Room Type
   [Qubi Smart Locks/Clock PMS (Api Reservaciones)]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class RoomType {
  RoomType({
    this.pkid,
    this.id,
    this.name,
    this.location_id,
  });

  int pkid;
  int id;
  String name;
  int location_id;

  fromKeyValue(String key, Map value) {
    this.pkid = value[ROOMTYPES.PKID];
    this.id = value[ROOMTYPES.ID];
    this.name = value[ROOMTYPES.NAME];
    this.location_id = value[ROOMTYPES.LOCATION_ID];
  }

  toJson() {
    return {
      ROOMTYPES.PKID: this.pkid,
      ROOMTYPES.ID: this.id,
      ROOMTYPES.NAME: this.name,
      ROOMTYPES.LOCATION_ID: this.location_id,
    };
  }

  assign(RoomType roomType) {

    if (roomType == null) {
      this.pkid = null; //0;
      this.id = null; //0;
      this.name = null; //'';
      this.location_id = null; //0;
    } else {
      this.pkid = roomType.pkid;
      this.id = roomType.id;
      this.name = roomType.name;
      this.location_id = roomType.location_id;
    }
  }

  Map toMap() {
    Map map = {
      ROOMTYPES.PKID: this.pkid,
      ROOMTYPES.ID: this.id,
      ROOMTYPES.NAME: this.name,
      ROOMTYPES.LOCATION_ID: this.location_id,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.pkid = map[ROOMTYPES.PKID];
    this.id = map[ROOMTYPES.ID];
    this.name = map[ROOMTYPES.NAME];
    this.location_id = map[ROOMTYPES.LOCATION_ID];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final RoomType typedOther = other;
    return
        pkid == typedOther.pkid &&
        id == typedOther.id &&
        name == typedOther.name &&
        location_id == typedOther.location_id;
  }


  @override
  int get hashCode => hashObjects([
      pkid.hashCode,
      id.hashCode,
      name.hashCode,
      location_id.hashCode 
  ]);

}

//==============================================================================
class ROOMTYPES {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Room Types';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Room Type';

  // Etiquetas de los Atributos
  static const String ETIQUETA_PKID = 'pkid';
  static const String ETIQUETA_ID = 'id';
  static const String ETIQUETA_NAME = 'Nombre';
  static const String ETIQUETA_LOCATION_ID = 'Locación';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'RoomTypes';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'RoomType';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String PKID = 'pkid';
  static const String ID = 'id';
  static const String NAME = 'name';
  static const String LOCATION_ID = 'location_id';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [PKID,ID,NAME,LOCATION_ID,];
  static const List CAMPOS_DETALLE = [PKID,ID,NAME,LOCATION_ID,];

}
