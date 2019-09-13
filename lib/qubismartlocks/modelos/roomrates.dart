/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad RoomRates -> Room Rate
   [Qubi Smart Locks/Clock PMS (Api Reservaciones)]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class RoomRate {
  RoomRate({
    this.pkid,
    this.id,
    this.name,
    this.room_type_id,
    this.housekeeping_warning,
    this.housekeeping_status,
    this.description,
    this.sort_order,
    this.location_id,
  });

  int pkid;
  int id;
  String name;
  int room_type_id;
  String housekeeping_warning;
  String housekeeping_status;
  String description;
  int sort_order;
  int location_id;

  fromKeyValue(String key, Map value) {
    this.pkid = value[ROOMRATES.PKID];
    this.id = value[ROOMRATES.ID];
    this.name = value[ROOMRATES.NAME];
    this.room_type_id = value[ROOMRATES.ROOM_TYPE_ID];
    this.housekeeping_warning = value[ROOMRATES.HOUSEKEEPING_WARNING];
    this.housekeeping_status = value[ROOMRATES.HOUSEKEEPING_STATUS];
    this.description = value[ROOMRATES.DESCRIPTION];
    this.sort_order = value[ROOMRATES.SORT_ORDER];
    this.location_id = value[ROOMRATES.LOCATION_ID];
  }

  toJson() {
    return {
      ROOMRATES.PKID: this.pkid,
      ROOMRATES.ID: this.id,
      ROOMRATES.NAME: this.name,
      ROOMRATES.ROOM_TYPE_ID: this.room_type_id,
      ROOMRATES.HOUSEKEEPING_WARNING: this.housekeeping_warning,
      ROOMRATES.HOUSEKEEPING_STATUS: this.housekeeping_status,
      ROOMRATES.DESCRIPTION: this.description,
      ROOMRATES.SORT_ORDER: this.sort_order,
      ROOMRATES.LOCATION_ID: this.location_id,
    };
  }

  assign(RoomRate roomRate) {

    if (roomRate == null) {
      this.pkid = null; //0;
      this.id = null; //0;
      this.name = null; //'';
      this.room_type_id = null; //0;
      this.housekeeping_warning = null; //'';
      this.housekeeping_status = null; //'';
      this.description = null; //'';
      this.sort_order = null; //0;
      this.location_id = null; //0;
    } else {
      this.pkid = roomRate.pkid;
      this.id = roomRate.id;
      this.name = roomRate.name;
      this.room_type_id = roomRate.room_type_id;
      this.housekeeping_warning = roomRate.housekeeping_warning;
      this.housekeeping_status = roomRate.housekeeping_status;
      this.description = roomRate.description;
      this.sort_order = roomRate.sort_order;
      this.location_id = roomRate.location_id;
    }
  }

  Map toMap() {
    Map map = {
      ROOMRATES.PKID: this.pkid,
      ROOMRATES.ID: this.id,
      ROOMRATES.NAME: this.name,
      ROOMRATES.ROOM_TYPE_ID: this.room_type_id,
      ROOMRATES.HOUSEKEEPING_WARNING: this.housekeeping_warning,
      ROOMRATES.HOUSEKEEPING_STATUS: this.housekeeping_status,
      ROOMRATES.DESCRIPTION: this.description,
      ROOMRATES.SORT_ORDER: this.sort_order,
      ROOMRATES.LOCATION_ID: this.location_id,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.pkid = map[ROOMRATES.PKID];
    this.id = map[ROOMRATES.ID];
    this.name = map[ROOMRATES.NAME];
    this.room_type_id = map[ROOMRATES.ROOM_TYPE_ID];
    this.housekeeping_warning = map[ROOMRATES.HOUSEKEEPING_WARNING];
    this.housekeeping_status = map[ROOMRATES.HOUSEKEEPING_STATUS];
    this.description = map[ROOMRATES.DESCRIPTION];
    this.sort_order = map[ROOMRATES.SORT_ORDER];
    this.location_id = map[ROOMRATES.LOCATION_ID];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final RoomRate typedOther = other;
    return
        pkid == typedOther.pkid &&
        id == typedOther.id &&
        name == typedOther.name &&
        room_type_id == typedOther.room_type_id &&
        housekeeping_warning == typedOther.housekeeping_warning &&
        housekeeping_status == typedOther.housekeeping_status &&
        description == typedOther.description &&
        sort_order == typedOther.sort_order &&
        location_id == typedOther.location_id;
  }


  @override
  int get hashCode => hashObjects([
      pkid.hashCode,
      id.hashCode,
      name.hashCode,
      room_type_id.hashCode,
      housekeeping_warning.hashCode,
      housekeeping_status.hashCode,
      description.hashCode,
      sort_order.hashCode,
      location_id.hashCode 
  ]);

}

//==============================================================================
class ROOMRATES {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Room Rates';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Room Rate';

  // Etiquetas de los Atributos
  static const String ETIQUETA_PKID = 'pkid';
  static const String ETIQUETA_ID = 'id';
  static const String ETIQUETA_NAME = 'Nombre o Número';
  static const String ETIQUETA_ROOM_TYPE_ID = 'Tipo Habitación';
  static const String ETIQUETA_HOUSEKEEPING_WARNING = 'Adevertencia HouseKeeping';
  static const String ETIQUETA_HOUSEKEEPING_STATUS = 'Estado HouseKeeping';
  static const String ETIQUETA_DESCRIPTION = 'Descripción';
  static const String ETIQUETA_SORT_ORDER = 'Orden';
  static const String ETIQUETA_LOCATION_ID = 'Locación';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'RoomRates';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'RoomRate';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String PKID = 'pkid';
  static const String ID = 'id';
  static const String NAME = 'name';
  static const String ROOM_TYPE_ID = 'room_type_id';
  static const String HOUSEKEEPING_WARNING = 'housekeeping_warning';
  static const String HOUSEKEEPING_STATUS = 'housekeeping_status';
  static const String DESCRIPTION = 'description';
  static const String SORT_ORDER = 'sort_order';
  static const String LOCATION_ID = 'location_id';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [PKID,ID,NAME,ROOM_TYPE_ID,HOUSEKEEPING_WARNING,HOUSEKEEPING_STATUS,DESCRIPTION,SORT_ORDER,LOCATION_ID,];
  static const List CAMPOS_DETALLE = [PKID,ID,NAME,ROOM_TYPE_ID,HOUSEKEEPING_WARNING,HOUSEKEEPING_STATUS,DESCRIPTION,SORT_ORDER,LOCATION_ID,];

}
