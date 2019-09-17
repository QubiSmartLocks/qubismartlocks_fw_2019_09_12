/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad Conversaciones -> Conversación
   [Qubi Smart Locks/Mensajería (Chats)]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class Conversacion {
  Conversacion({
    this.id,
    this.denomConversacion,
    this.ordenPrioridad,
    this.fechaCreacion,
    this.fechaUltimoMensaje,
    this.key,
    this.nota,
  });

  int id;  // Id [Búsqueda: int]
  String denomConversacion;  // Denominación 200 No Nulo [Texto Variable: String]
  int ordenPrioridad;  // Orden [Entero Pequeño: int]
  DateTime fechaCreacion;  // Fecha [Fecha: DateTime]
  DateTime fechaUltimoMensaje;  // Fecha [Fecha: DateTime]
  String key;  // Id/Key [Texto Variable: String]
  String nota;  // Nota [Texto Variable: String]

  fromSnapshot(fb.DataSnapshot data) {
    this.fromKeyValue(data.key, data.val());
  }

  fromKeyValue(String key, Map value) {
    this.id = value[CONVERSACIONES.ID];
    this.denomConversacion = value[CONVERSACIONES.DENOMCONVERSACION];
    this.ordenPrioridad = value[CONVERSACIONES.ORDENPRIORIDAD];
    this.fechaCreacion = LeerFecha(value[CONVERSACIONES.FECHACREACION]);
    this.fechaUltimoMensaje = LeerFecha(value[CONVERSACIONES.FECHAULTIMOMENSAJE]);
    this.key = value[CONVERSACIONES.KEY];
    this.nota = value[CONVERSACIONES.NOTA];
  }

  toJson() {
    return {
      CONVERSACIONES.ID: this.id,
      CONVERSACIONES.DENOMCONVERSACION: this.denomConversacion,
      CONVERSACIONES.ORDENPRIORIDAD: this.ordenPrioridad,
      CONVERSACIONES.FECHACREACION: this.fechaCreacion == null ? null : GuardarFecha(this.fechaCreacion),
      CONVERSACIONES.FECHAULTIMOMENSAJE: this.fechaUltimoMensaje == null ? null : GuardarFecha(this.fechaUltimoMensaje),
      CONVERSACIONES.KEY: this.key,
      CONVERSACIONES.NOTA: this.nota,
    };
  }

  assign(Conversacion conversacion) {

    if (conversacion == null) {
      this.id = null; //0;
      this.denomConversacion = null; //'';
      this.ordenPrioridad = null; //0;
      this.fechaCreacion = null; //DateTime.now();
      this.fechaUltimoMensaje = null; //DateTime.now();
      this.key = null; //'';
      this.nota = null; //'';
    } else {
      this.id = conversacion.id;
      this.denomConversacion = conversacion.denomConversacion;
      this.ordenPrioridad = conversacion.ordenPrioridad;
      this.fechaCreacion = conversacion.fechaCreacion;
      this.fechaUltimoMensaje = conversacion.fechaUltimoMensaje;
      this.key = conversacion.key;
      this.nota = conversacion.nota;
    }
  }

  Map toMap() {
    Map map = {
      CONVERSACIONES.ID: this.id,
      CONVERSACIONES.DENOMCONVERSACION: this.denomConversacion,
      CONVERSACIONES.ORDENPRIORIDAD: this.ordenPrioridad,
      CONVERSACIONES.FECHACREACION: this.fechaCreacion == null ? null : GuardarFecha(this.fechaCreacion),
      CONVERSACIONES.FECHAULTIMOMENSAJE: this.fechaUltimoMensaje == null ? null : GuardarFecha(this.fechaUltimoMensaje),
      CONVERSACIONES.KEY: this.key,
      CONVERSACIONES.NOTA: this.nota,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.id = map[CONVERSACIONES.ID];
    this.denomConversacion = map[CONVERSACIONES.DENOMCONVERSACION];
    this.ordenPrioridad = map[CONVERSACIONES.ORDENPRIORIDAD];
    this.fechaCreacion = map[CONVERSACIONES.FECHACREACION] == null ? null : LeerFecha(map[CONVERSACIONES.FECHACREACION]);
    this.fechaUltimoMensaje = map[CONVERSACIONES.FECHAULTIMOMENSAJE] == null ? null : LeerFecha(map[CONVERSACIONES.FECHAULTIMOMENSAJE]);
    this.key = map[CONVERSACIONES.KEY];
    this.nota = map[CONVERSACIONES.NOTA];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final Conversacion typedOther = other;
    return
        id == typedOther.id &&
        denomConversacion == typedOther.denomConversacion &&
        ordenPrioridad == typedOther.ordenPrioridad &&
        fechaCreacion == typedOther.fechaCreacion &&
        fechaUltimoMensaje == typedOther.fechaUltimoMensaje &&
        key == typedOther.key &&
        nota == typedOther.nota;
  }

  @override
  int get hashCode => hashObjects([
      id.hashCode,
      denomConversacion.hashCode,
      ordenPrioridad.hashCode,
      fechaCreacion.hashCode,
      fechaUltimoMensaje.hashCode,
      key.hashCode,
      nota.hashCode,
  ]);

}

//==============================================================================
class CONVERSACIONES {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Conversaciones';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Conversación';

  // Etiquetas de los Atributos

  static const String ETIQUETA_ID = 'Id';
  static const String ETIQUETA_DENOMCONVERSACION = 'Denominación de la Conversación';
  static const String ETIQUETA_ORDENPRIORIDAD = 'Orden de Prioridad';
  static const String ETIQUETA_FECHACREACION = 'Fecha de Creación';
  static const String ETIQUETA_FECHAULTIMOMENSAJE = 'Fecha de Último Mensaje';
  static const String ETIQUETA_KEY = 'Key';
  static const String ETIQUETA_NOTA = 'Nota';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'Conversaciones';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'Conversacion';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String ID = 'id';
  static const String DENOMCONVERSACION = 'denomConversacion';
  static const String ORDENPRIORIDAD = 'ordenPrioridad';
  static const String FECHACREACION = 'fechaCreacion';
  static const String FECHAULTIMOMENSAJE = 'fechaUltimoMensaje';
  static const String KEY = 'key';
  static const String NOTA = 'nota';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [ ID, DENOMCONVERSACION, ORDENPRIORIDAD, FECHAULTIMOMENSAJE, KEY, NOTA,];
  static const List CAMPOS_DETALLE = [ ID, DENOMCONVERSACION, ORDENPRIORIDAD, FECHACREACION, FECHAULTIMOMENSAJE, KEY, NOTA,];

}
