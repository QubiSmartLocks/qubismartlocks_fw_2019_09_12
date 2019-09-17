/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad Participantes -> Participante
   [Qubi Smart Locks/Mensajería (Chats)]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class Participante {
  Participante({
    this.id,
    this.conversacion,
    this.usuario,
    this.nombre,
    this.key,
    this.nota,
    this.keyConversacion,
  });

  int id;  // Id [Búsqueda: int]
  Conversacion conversacion;  // Id [Búsqueda: int]
  int usuario;  // Id [Búsqueda: int]
  String nombre;  // Nombre [Texto Variable: String]
  String key;  // Id/Key [Texto Variable: String]
  String nota;  // Nota [Texto Variable: String]
  String keyConversacion;  // Id/Key [Texto Variable: String]

  fromSnapshot(fb.DataSnapshot data) {
    this.fromKeyValue(data.key, data.val());
  }

  fromKeyValue(String key, Map value) {
    this.id = value[PARTICIPANTES.ID];

    // Conversaciones
    if (value[PARTICIPANTES.CONVERSACION] != null) {
      if (this.conversacion == null) {
        this.conversacion = Conversacion();
      }
      this.conversacion.fromKeyValue(key, value[PARTICIPANTES.CONVERSACION]);
    } else {
      this.conversacion = null;
    }

    this.usuario = value[PARTICIPANTES.USUARIO];
    this.nombre = value[PARTICIPANTES.NOMBRE];
    this.key = value[PARTICIPANTES.KEY];
    this.nota = value[PARTICIPANTES.NOTA];
    this.keyConversacion = value[PARTICIPANTES.KEYCONVERSACION];
  }

  toJson() {
    return {
      PARTICIPANTES.ID: this.id,
      PARTICIPANTES.CONVERSACION: this.conversacion == null ? null : this.conversacion.toJson(),
      PARTICIPANTES.USUARIO: this.usuario,
      PARTICIPANTES.NOMBRE: this.nombre,
      PARTICIPANTES.KEY: this.key,
      PARTICIPANTES.NOTA: this.nota,
      PARTICIPANTES.KEYCONVERSACION: this.keyConversacion,
    };
  }

  assign(Participante participante) {

    if (participante == null) {
      this.id = null; //0;
      this.conversacion = null; //Conversacion();
      this.usuario = null; //0;
      this.nombre = null; //'';
      this.key = null; //'';
      this.nota = null; //'';
      this.keyConversacion = null; //'';
    } else {
      this.id = participante.id;

      // Conversaciones
      if (participante.conversacion != null) {
        if (this.conversacion == null) {
          this.conversacion = Conversacion();
        }
        this.conversacion.assign(participante.conversacion);
      } else {
        this.conversacion = null;
      }

      this.usuario = participante.usuario;
      this.nombre = participante.nombre;
      this.key = participante.key;
      this.nota = participante.nota;
      this.keyConversacion = participante.keyConversacion;
    }
  }

  Map toMap() {
    Map map = {
      PARTICIPANTES.ID: this.id,
      PARTICIPANTES.CONVERSACION: this.conversacion == null ? null : this.conversacion.toMap(),
      PARTICIPANTES.USUARIO: this.usuario,
      PARTICIPANTES.NOMBRE: this.nombre,
      PARTICIPANTES.KEY: this.key,
      PARTICIPANTES.NOTA: this.nota,
      PARTICIPANTES.KEYCONVERSACION: this.keyConversacion,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.id = map[PARTICIPANTES.ID];

    // Conversaciones
    if (map[PARTICIPANTES.CONVERSACION] != null) {
      if (this.conversacion == null) {
        this.conversacion = Conversacion();
      }
      this.conversacion.fromMap(map[PARTICIPANTES.CONVERSACION]);
    } else {
      this.conversacion = null;
    }

    this.usuario = map[PARTICIPANTES.USUARIO];
    this.nombre = map[PARTICIPANTES.NOMBRE];
    this.key = map[PARTICIPANTES.KEY];
    this.nota = map[PARTICIPANTES.NOTA];
    this.keyConversacion = map[PARTICIPANTES.KEYCONVERSACION];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final Participante typedOther = other;
    return
        id == typedOther.id &&
        conversacion == typedOther.conversacion &&
        usuario == typedOther.usuario &&
        nombre == typedOther.nombre &&
        key == typedOther.key &&
        nota == typedOther.nota &&
        keyConversacion == typedOther.keyConversacion;
  }

  @override
  int get hashCode => hashObjects([
      id.hashCode,
      conversacion.hashCode,
      usuario.hashCode,
      nombre.hashCode,
      key.hashCode,
      nota.hashCode,
      keyConversacion.hashCode,
  ]);

}

//==============================================================================
class PARTICIPANTES {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Participantes';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Participante';

  // Etiquetas de los Atributos

  static const String ETIQUETA_ID = 'Id';
  static const String ETIQUETA_CONVERSACION = 'Conversación';
  static const String ETIQUETA_USUARIO = 'Usuario';
  static const String ETIQUETA_NOMBRE = 'Nombre';
  static const String ETIQUETA_KEY = 'Key';
  static const String ETIQUETA_NOTA = 'Nota';
  static const String ETIQUETA_KEYCONVERSACION = 'Key Conversación';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'Participantes';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'Participante';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String ID = 'id';
  static const String CONVERSACION = 'conversacion';
  static const String USUARIO = 'usuario';
  static const String NOMBRE = 'nombre';
  static const String KEY = 'key';
  static const String NOTA = 'nota';
  static const String KEYCONVERSACION = 'keyConversacion';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [ ID, USUARIO, NOMBRE, KEY, NOTA, KEYCONVERSACION,];
  static const List CAMPOS_DETALLE = [ ID, CONVERSACION, USUARIO, NOMBRE, KEY, NOTA, KEYCONVERSACION,];

}
