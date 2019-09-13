/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad MensajesAutomaticos -> Mensaje Automático
   [Qubi Smart Locks/Mensajería (Chats)]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class MensajeAutomatico {
  MensajeAutomatico({
    this.id,
    this.tipoMensaje,
    this.mensaje,
  });

  int id;
  String tipoMensaje;
  String mensaje;

  fromKeyValue(String key, Map value) {
    this.id = value[MENSAJESAUTOMATICOS.ID];
    this.tipoMensaje = value[MENSAJESAUTOMATICOS.TIPOMENSAJE];
    this.mensaje = value[MENSAJESAUTOMATICOS.MENSAJE];
  }

  toJson() {
    return {
      MENSAJESAUTOMATICOS.ID: this.id,
      MENSAJESAUTOMATICOS.TIPOMENSAJE: this.tipoMensaje,
      MENSAJESAUTOMATICOS.MENSAJE: this.mensaje,
    };
  }

  assign(MensajeAutomatico mensajeAutomatico) {

    if (mensajeAutomatico == null) {
      this.id = null; //0;
      this.tipoMensaje = null; //'';
      this.mensaje = null; //'';
    } else {
      this.id = mensajeAutomatico.id;
      this.tipoMensaje = mensajeAutomatico.tipoMensaje;
      this.mensaje = mensajeAutomatico.mensaje;
    }
  }

  Map toMap() {
    Map map = {
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
      mensaje.hashCode 
  ]);

}

//==============================================================================
class MENSAJESAUTOMATICOS {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Mensajes Automáticos';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Mensaje Automático';

  // Etiquetas de los Atributos
  static const String ETIQUETA_ID = 'Id';
  static const String ETIQUETA_TIPOMENSAJE = 'Tipo de Mensaje';
  static const String ETIQUETA_MENSAJE = 'Mensaje';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'MensajesAutomaticos';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'MensajeAutomatico';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String ID = 'id';
  static const String TIPOMENSAJE = 'tipoMensaje';
  static const String MENSAJE = 'mensaje';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [ID,TIPOMENSAJE,MENSAJE,];
  static const List CAMPOS_DETALLE = [ID,TIPOMENSAJE,MENSAJE,];

}
