/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad Mensajes -> Mensaje
   [Qubi Smart Locks/Mensajería (Chats)]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


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

  int id;
  Conversacion conversacion;
  Participante participante;
  DateTime momento;
  String mensajeTexto;
  String key;
  String keyConversacion;
  String keyParticipante;

  fromKeyValue(String key, Map value) {
    this.id = value[MENSAJES.ID];
    this.conversacion.fromKeyValue(key, value[MENSAJES.CONVERSACION]);
    this.participante.fromKeyValue(key, value[MENSAJES.PARTICIPANTE]);
    this.momento = DateTime.parse(value[MENSAJES.MOMENTO]);
    this.mensajeTexto = value[MENSAJES.MENSAJETEXTO];
    this.key = value[MENSAJES.KEY];
    this.keyConversacion = value[MENSAJES.KEYCONVERSACION];
    this.keyParticipante = value[MENSAJES.KEYPARTICIPANTE];
  }

  toJson() {
    return {
      MENSAJES.ID: this.id,
      MENSAJES.CONVERSACION: this.conversacion.toJson(),
      MENSAJES.PARTICIPANTE: this.participante.toJson(),
      MENSAJES.MOMENTO: this.momento == null ? null : (this.momento.hour * 60 * 60 * 1000) +
          (this.momento.minute * 60 * 1000) ,
      MENSAJES.MENSAJETEXTO: this.mensajeTexto,
      MENSAJES.KEY: this.key,
      MENSAJES.KEYCONVERSACION: this.keyConversacion,
      MENSAJES.KEYPARTICIPANTE: this.keyParticipante,
    };
  }

  assign(Mensaje mensaje) {

    if (mensaje == null) {
      this.id = null; //0;
      this.conversacion = null; //new Participante();
      this.participante = null; //new Participante();
      this.momento = null; //new DateTime.now();
      this.mensajeTexto = null; //'';
      this.key = null; //'';
      this.keyConversacion = null; //'';
      this.keyParticipante = null; //'';
    } else {
      this.id = mensaje.id;

      if (mensaje.conversacion != null) {
        if (this.conversacion == null) {
          this.conversacion = Conversacion();
        }
        this.conversacion.assign(mensaje.conversacion);
      } else {
        this.conversacion = null;
      }


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
      MENSAJES.MOMENTO: this.momento == null ? null : (this.momento.hour * 60 * 60 * 1000) +
          (this.momento.minute * 60 * 1000) ,
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
    if (map[MENSAJES.CONVERSACION] != null) {
      if (this.conversacion == null) {
        this.conversacion = Conversacion();
      }
      this.conversacion.fromMap(map[MENSAJES.CONVERSACION]);
    } else {
      this.conversacion = null;
    }
    if (map[MENSAJES.PARTICIPANTE] != null) {
      if (this.participante == null) {
        this.participante = Participante();
      }
      this.participante.fromMap(map[MENSAJES.PARTICIPANTE]);
    } else {
      this.participante = null;
    }
    this.momento = map[MENSAJES.MOMENTO];
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
      keyParticipante.hashCode 
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

  static const List CAMPOS_LISTADO = [ID,PARTICIPANTE,MOMENTO,MENSAJETEXTO,KEY,KEYCONVERSACION,KEYPARTICIPANTE,];
  static const List CAMPOS_DETALLE = [ID,CONVERSACION,PARTICIPANTE,MOMENTO,MENSAJETEXTO,KEY,KEYCONVERSACION,KEYPARTICIPANTE,];

}
