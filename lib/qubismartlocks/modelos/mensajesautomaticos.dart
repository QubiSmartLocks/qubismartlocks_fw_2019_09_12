/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad MensajesAutomaticos -> Mensaje Automático
   [Qubi Smart Locks/Mensajería (Chats)]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class MensajeAutomatico {
  MensajeAutomatico({
    this.key = '',
    this.id,
    this.tipoMensaje,
    this.mensaje,
  });

  String key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
  int id;  // Id [Búsqueda: int]
  String tipoMensaje;  // Tipo de Mensaje [Texto Variable: String]
  String mensaje;  // Mensaje [Texto Variable: String]

  fromSnapshot(fb.DataSnapshot data) {
    this.fromKeyValue(data.key, data.val());
  }

  fromKeyValue(String key, Map value) {
    this.key = key; // Incluido por usar Firebase Database, pero no en Dendrita
    this.id = value[MENSAJESAUTOMATICOS.ID];
    this.tipoMensaje = value[MENSAJESAUTOMATICOS.TIPOMENSAJE];
    this.mensaje = value[MENSAJESAUTOMATICOS.MENSAJE];
  }

  toJson() {
    return {
      'key': this.key, // Incluido por usar Firebase Database, pero no en Dendrita
      MENSAJESAUTOMATICOS.ID: this.id,
      MENSAJESAUTOMATICOS.TIPOMENSAJE: this.tipoMensaje,
      MENSAJESAUTOMATICOS.MENSAJE: this.mensaje,
    };
  }

  assign(MensajeAutomatico mensajeAutomatico) {

    if (mensajeAutomatico == null) {
      this.key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
      this.id = null; //0;
      this.tipoMensaje = null; //'';
      this.mensaje = null; //'';
    } else {
      this.key = mensajeAutomatico.key; // Incluido por usar Firebase Database, pero no en Dendrita
      this.id = mensajeAutomatico.id;
      this.tipoMensaje = mensajeAutomatico.tipoMensaje;
      this.mensaje = mensajeAutomatico.mensaje;
    }
  }

  Map toMap() {
    Map map = {
      MENSAJESAUTOMATICOS.KEY: this.key,  // Incluido por usar Firebase Database, pero no en Dendrita
      MENSAJESAUTOMATICOS.ID: this.id,
      MENSAJESAUTOMATICOS.TIPOMENSAJE: this.tipoMensaje,
      MENSAJESAUTOMATICOS.MENSAJE: this.mensaje,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.key = map[MENSAJESAUTOMATICOS.KEY];  // Incluido por usar Firebase Database, pero no en Dendrita
    this.id = map[MENSAJESAUTOMATICOS.ID];
    this.tipoMensaje = map[MENSAJESAUTOMATICOS.TIPOMENSAJE];
    this.mensaje = map[MENSAJESAUTOMATICOS.MENSAJE];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final MensajeAutomatico typedOther = other;
    return
        id == typedOther.id &&
        tipoMensaje == typedOther.tipoMensaje &&
        mensaje == typedOther.mensaje;
  }

  @override
  int get hashCode => hashObjects([
      id.hashCode,
      tipoMensaje.hashCode,
      mensaje.hashCode,
  ]);

}

//==============================================================================
class MENSAJESAUTOMATICOS {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Mensajes Automáticos';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Mensaje Automático';

  // Etiquetas de los Atributos

  static const String ETIQUETA_KEY = 'Key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ETIQUETA_ID = 'Id';
  static const String ETIQUETA_TIPOMENSAJE = 'Tipo de Mensaje';
  static const String ETIQUETA_MENSAJE = 'Mensaje';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'MensajesAutomaticos';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'MensajeAutomatico';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String KEY = 'key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ID = 'id';
  static const String TIPOMENSAJE = 'tipoMensaje';
  static const String MENSAJE = 'mensaje';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [
 KEY, ID, TIPOMENSAJE, MENSAJE,];
  static const List CAMPOS_DETALLE = [
 KEY, ID, TIPOMENSAJE, MENSAJE,];

}
