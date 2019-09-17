/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad Mensajes -> Mensaje
   [Qubi Smart Locks/Mensajería (Chats)]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class Mensaje {
  Mensaje({
    this.id,
    this.conversacion,
    this.participante,
    this.momento,
    this.mensajeTexto,
    this.key,
    this.keyConversacion,
    this.keyParticipante,
  });

  int id;  // Id [Búsqueda: int]
  Conversacion conversacion;  // Id [Búsqueda: int]
  Participante participante;  // Id [Búsqueda: int]
  DateTime momento;  // Momento [Momento: DateTime]
  String mensajeTexto;  // Notas [Texto Variable: String]
  String key;  // Id/Key [Texto Variable: String]
  String keyConversacion;  // Id/Key [Texto Variable: String]
  String keyParticipante;  // Id/Key [Texto Variable: String]

  fromSnapshot(fb.DataSnapshot data) {
    this.fromKeyValue(data.key, data.val());
  }

  fromKeyValue(String key, Map value) {
    this.id = value[MENSAJES.ID];

    // Conversaciones
    if (value[MENSAJES.CONVERSACION] != null) {
      if (this.conversacion == null) {
        this.conversacion = Conversacion();
      }
      this.conversacion.fromKeyValue(key, value[MENSAJES.CONVERSACION]);
    } else {
      this.conversacion = null;
    }


    // Participantes
    if (value[MENSAJES.PARTICIPANTE] != null) {
      if (this.participante == null) {
        this.participante = Participante();
      }
      this.participante.fromKeyValue(key, value[MENSAJES.PARTICIPANTE]);
    } else {
      this.participante = null;
    }

    this.momento = DateTime.parse(value[MENSAJES.MOMENTO]);
    this.mensajeTexto = value[MENSAJES.MENSAJETEXTO];
    this.key = value[MENSAJES.KEY];
    this.keyConversacion = value[MENSAJES.KEYCONVERSACION];
    this.keyParticipante = value[MENSAJES.KEYPARTICIPANTE];
  }

  toJson() {
    return {
      MENSAJES.ID: this.id,
      MENSAJES.CONVERSACION: this.conversacion == null ? null : this.conversacion.toJson(),
      MENSAJES.PARTICIPANTE: this.participante == null ? null : this.participante.toJson(),
      MENSAJES.MOMENTO: this.momento == null ? null : GuardarFechaHora(this.momento),
      MENSAJES.MENSAJETEXTO: this.mensajeTexto,
      MENSAJES.KEY: this.key,
      MENSAJES.KEYCONVERSACION: this.keyConversacion,
      MENSAJES.KEYPARTICIPANTE: this.keyParticipante,
    };
  }

  assign(Mensaje mensaje) {

    if (mensaje == null) {
      this.id = null; //0;
      this.conversacion = null; //Participante();
      this.participante = null; //Participante();
      this.momento = null; //new DateTime.now();
      this.mensajeTexto = null; //'';
      this.key = null; //'';
      this.keyConversacion = null; //'';
      this.keyParticipante = null; //'';
    } else {
      this.id = mensaje.id;

      // Conversaciones
      if (mensaje.conversacion != null) {
        if (this.conversacion == null) {
          this.conversacion = Conversacion();
        }
        this.conversacion.assign(mensaje.conversacion);
      } else {
        this.conversacion = null;
      }


      // Participantes
      if (mensaje.participante != null) {
        if (this.participante == null) {
          this.participante = Participante();
        }
        this.participante.assign(mensaje.participante);
      } else {
        this.participante = null;
      }

      this.momento = mensaje.momento;
      this.mensajeTexto = mensaje.mensajeTexto;
      this.key = mensaje.key;
      this.keyConversacion = mensaje.keyConversacion;
      this.keyParticipante = mensaje.keyParticipante;
    }
  }

  Map toMap() {
    Map map = {
      MENSAJES.ID: this.id,
      MENSAJES.CONVERSACION: this.conversacion == null ? null : this.conversacion.toMap(),
      MENSAJES.PARTICIPANTE: this.participante == null ? null : this.participante.toMap(),
      MENSAJES.MOMENTO: this.momento == null ? null : GuardarFecha(this.momento),
      MENSAJES.MENSAJETEXTO: this.mensajeTexto,
      MENSAJES.KEY: this.key,
      MENSAJES.KEYCONVERSACION: this.keyConversacion,
      MENSAJES.KEYPARTICIPANTE: this.keyParticipante,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.id = map[MENSAJES.ID];

    // Conversaciones
    if (map[MENSAJES.CONVERSACION] != null) {
      if (this.conversacion == null) {
        this.conversacion = Conversacion();
      }
      this.conversacion.fromMap(map[MENSAJES.CONVERSACION]);
    } else {
      this.conversacion = null;
    }


    // Participantes
    if (map[MENSAJES.PARTICIPANTE] != null) {
      if (this.participante == null) {
        this.participante = Participante();
      }
      this.participante.fromMap(map[MENSAJES.PARTICIPANTE]);
    } else {
      this.participante = null;
    }

    this.momento = map[MENSAJES.MOMENTO] == null ? null : LeerFecha(map[MENSAJES.MOMENTO]);
    this.mensajeTexto = map[MENSAJES.MENSAJETEXTO];
    this.key = map[MENSAJES.KEY];
    this.keyConversacion = map[MENSAJES.KEYCONVERSACION];
    this.keyParticipante = map[MENSAJES.KEYPARTICIPANTE];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final Mensaje typedOther = other;
    return
        id == typedOther.id &&
        conversacion == typedOther.conversacion &&
        participante == typedOther.participante &&
        momento == typedOther.momento &&
        mensajeTexto == typedOther.mensajeTexto &&
        key == typedOther.key &&
        keyConversacion == typedOther.keyConversacion &&
        keyParticipante == typedOther.keyParticipante;
  }

  @override
  int get hashCode => hashObjects([
      id.hashCode,
      conversacion.hashCode,
      participante.hashCode,
      momento.hashCode,
      mensajeTexto.hashCode,
      key.hashCode,
      keyConversacion.hashCode,
      keyParticipante.hashCode,
  ]);

}

//==============================================================================
class MENSAJES {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Mensajes';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Mensaje';

  // Etiquetas de los Atributos

  static const String ETIQUETA_ID = 'Id';
  static const String ETIQUETA_CONVERSACION = 'Conversación';
  static const String ETIQUETA_PARTICIPANTE = 'Participante';
  static const String ETIQUETA_MOMENTO = 'Momento';
  static const String ETIQUETA_MENSAJETEXTO = 'Mensaje de Texto';
  static const String ETIQUETA_KEY = 'Key';
  static const String ETIQUETA_KEYCONVERSACION = 'Key Conversación';
  static const String ETIQUETA_KEYPARTICIPANTE = 'Key Participante';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'Mensajes';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'Mensaje';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String ID = 'id';
  static const String CONVERSACION = 'conversacion';
  static const String PARTICIPANTE = 'participante';
  static const String MOMENTO = 'momento';
  static const String MENSAJETEXTO = 'mensajeTexto';
  static const String KEY = 'key';
  static const String KEYCONVERSACION = 'keyConversacion';
  static const String KEYPARTICIPANTE = 'keyParticipante';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [ ID, PARTICIPANTE, MOMENTO, MENSAJETEXTO, KEY, KEYCONVERSACION, KEYPARTICIPANTE,];
  static const List CAMPOS_DETALLE = [ ID, CONVERSACION, PARTICIPANTE, MOMENTO, MENSAJETEXTO, KEY, KEYCONVERSACION, KEYPARTICIPANTE,];

}
