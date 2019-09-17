/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad OpcionesMensajeria -> Opción de Mensajería
   [Qubi Smart Locks/Mensajería (Chats)]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class OpcionMensajeria {
  OpcionMensajeria({
    this.key = '',
    this.id,
    this.participanteAutomatico,
    this.bienvenida,
    this.despedida,
    this.paquete,
    this.proximoCheckIn,
    this.proximoCheckOut,
  });

  String key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
  int id;  // Id [Búsqueda: int]
  Participante participanteAutomatico;  // Id [Búsqueda: int]
  MensajeAutomatico bienvenida;  // Id [Búsqueda: int]
  MensajeAutomatico despedida;  // Id [Búsqueda: int]
  MensajeAutomatico paquete;  // Id [Búsqueda: int]
  MensajeAutomatico proximoCheckIn;  // Id [Búsqueda: int]
  MensajeAutomatico proximoCheckOut;  // Id [Búsqueda: int]

  fromSnapshot(fb.DataSnapshot data) {
    this.fromKeyValue(data.key, data.val());
  }

  fromKeyValue(String key, Map value) {
    this.key = key; // Incluido por usar Firebase Database, pero no en Dendrita
    this.id = value[OPCIONESMENSAJERIA.ID];

    // Participantes
    if (value[OPCIONESMENSAJERIA.PARTICIPANTEAUTOMATICO] != null) {
      if (this.participanteAutomatico == null) {
        this.participanteAutomatico = Participante();
      }
      this.participanteAutomatico.fromKeyValue(key, value[OPCIONESMENSAJERIA.PARTICIPANTEAUTOMATICO]);
    } else {
      this.participanteAutomatico = null;
    }


    // Mensajes Automáticos
    if (value[OPCIONESMENSAJERIA.BIENVENIDA] != null) {
      if (this.bienvenida == null) {
        this.bienvenida = MensajeAutomatico();
      }
      this.bienvenida.fromKeyValue(key, value[OPCIONESMENSAJERIA.BIENVENIDA]);
    } else {
      this.bienvenida = null;
    }


    // Mensajes Automáticos
    if (value[OPCIONESMENSAJERIA.DESPEDIDA] != null) {
      if (this.despedida == null) {
        this.despedida = MensajeAutomatico();
      }
      this.despedida.fromKeyValue(key, value[OPCIONESMENSAJERIA.DESPEDIDA]);
    } else {
      this.despedida = null;
    }


    // Mensajes Automáticos
    if (value[OPCIONESMENSAJERIA.PAQUETE] != null) {
      if (this.paquete == null) {
        this.paquete = MensajeAutomatico();
      }
      this.paquete.fromKeyValue(key, value[OPCIONESMENSAJERIA.PAQUETE]);
    } else {
      this.paquete = null;
    }


    // Mensajes Automáticos
    if (value[OPCIONESMENSAJERIA.PROXIMOCHECKIN] != null) {
      if (this.proximoCheckIn == null) {
        this.proximoCheckIn = MensajeAutomatico();
      }
      this.proximoCheckIn.fromKeyValue(key, value[OPCIONESMENSAJERIA.PROXIMOCHECKIN]);
    } else {
      this.proximoCheckIn = null;
    }


    // Mensajes Automáticos
    if (value[OPCIONESMENSAJERIA.PROXIMOCHECKOUT] != null) {
      if (this.proximoCheckOut == null) {
        this.proximoCheckOut = MensajeAutomatico();
      }
      this.proximoCheckOut.fromKeyValue(key, value[OPCIONESMENSAJERIA.PROXIMOCHECKOUT]);
    } else {
      this.proximoCheckOut = null;
    }

  }

  toJson() {
    return {
      'key': this.key, // Incluido por usar Firebase Database, pero no en Dendrita
      OPCIONESMENSAJERIA.ID: this.id,
      OPCIONESMENSAJERIA.PARTICIPANTEAUTOMATICO: this.participanteAutomatico == null ? null : this.participanteAutomatico.toJson(),
      OPCIONESMENSAJERIA.BIENVENIDA: this.bienvenida == null ? null : this.bienvenida.toJson(),
      OPCIONESMENSAJERIA.DESPEDIDA: this.despedida == null ? null : this.despedida.toJson(),
      OPCIONESMENSAJERIA.PAQUETE: this.paquete == null ? null : this.paquete.toJson(),
      OPCIONESMENSAJERIA.PROXIMOCHECKIN: this.proximoCheckIn == null ? null : this.proximoCheckIn.toJson(),
      OPCIONESMENSAJERIA.PROXIMOCHECKOUT: this.proximoCheckOut == null ? null : this.proximoCheckOut.toJson(),
    };
  }

  assign(OpcionMensajeria opcionMensajeria) {

    if (opcionMensajeria == null) {
      this.key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
      this.id = null; //0;
      this.participanteAutomatico = null; //MensajeAutomatico();
      this.bienvenida = null; //MensajeAutomatico();
      this.despedida = null; //MensajeAutomatico();
      this.paquete = null; //MensajeAutomatico();
      this.proximoCheckIn = null; //MensajeAutomatico();
      this.proximoCheckOut = null; //MensajeAutomatico();
    } else {
      this.key = opcionMensajeria.key; // Incluido por usar Firebase Database, pero no en Dendrita
      this.id = opcionMensajeria.id;

      // Participantes
      if (opcionMensajeria.participanteAutomatico != null) {
        if (this.participanteAutomatico == null) {
          this.participanteAutomatico = Participante();
        }
        this.participanteAutomatico.assign(opcionMensajeria.participanteAutomatico);
      } else {
        this.participanteAutomatico = null;
      }


      // Mensajes Automáticos
      if (opcionMensajeria.bienvenida != null) {
        if (this.bienvenida == null) {
          this.bienvenida = MensajeAutomatico();
        }
        this.bienvenida.assign(opcionMensajeria.bienvenida);
      } else {
        this.bienvenida = null;
      }


      // Mensajes Automáticos
      if (opcionMensajeria.despedida != null) {
        if (this.despedida == null) {
          this.despedida = MensajeAutomatico();
        }
        this.despedida.assign(opcionMensajeria.despedida);
      } else {
        this.despedida = null;
      }


      // Mensajes Automáticos
      if (opcionMensajeria.paquete != null) {
        if (this.paquete == null) {
          this.paquete = MensajeAutomatico();
        }
        this.paquete.assign(opcionMensajeria.paquete);
      } else {
        this.paquete = null;
      }


      // Mensajes Automáticos
      if (opcionMensajeria.proximoCheckIn != null) {
        if (this.proximoCheckIn == null) {
          this.proximoCheckIn = MensajeAutomatico();
        }
        this.proximoCheckIn.assign(opcionMensajeria.proximoCheckIn);
      } else {
        this.proximoCheckIn = null;
      }


      // Mensajes Automáticos
      if (opcionMensajeria.proximoCheckOut != null) {
        if (this.proximoCheckOut == null) {
          this.proximoCheckOut = MensajeAutomatico();
        }
        this.proximoCheckOut.assign(opcionMensajeria.proximoCheckOut);
      } else {
        this.proximoCheckOut = null;
      }

    }
  }

  Map toMap() {
    Map map = {
      OPCIONESMENSAJERIA.KEY: this.key,  // Incluido por usar Firebase Database, pero no en Dendrita
      OPCIONESMENSAJERIA.ID: this.id,
      OPCIONESMENSAJERIA.PARTICIPANTEAUTOMATICO: this.participanteAutomatico == null ? null : this.participanteAutomatico.toMap(),
      OPCIONESMENSAJERIA.BIENVENIDA: this.bienvenida == null ? null : this.bienvenida.toMap(),
      OPCIONESMENSAJERIA.DESPEDIDA: this.despedida == null ? null : this.despedida.toMap(),
      OPCIONESMENSAJERIA.PAQUETE: this.paquete == null ? null : this.paquete.toMap(),
      OPCIONESMENSAJERIA.PROXIMOCHECKIN: this.proximoCheckIn == null ? null : this.proximoCheckIn.toMap(),
      OPCIONESMENSAJERIA.PROXIMOCHECKOUT: this.proximoCheckOut == null ? null : this.proximoCheckOut.toMap(),
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.key = map[OPCIONESMENSAJERIA.KEY];  // Incluido por usar Firebase Database, pero no en Dendrita
    this.id = map[OPCIONESMENSAJERIA.ID];

    // Participantes
    if (map[OPCIONESMENSAJERIA.PARTICIPANTEAUTOMATICO] != null) {
      if (this.participanteAutomatico == null) {
        this.participanteAutomatico = Participante();
      }
      this.participanteAutomatico.fromMap(map[OPCIONESMENSAJERIA.PARTICIPANTEAUTOMATICO]);
    } else {
      this.participanteAutomatico = null;
    }


    // Mensajes Automáticos
    if (map[OPCIONESMENSAJERIA.BIENVENIDA] != null) {
      if (this.bienvenida == null) {
        this.bienvenida = MensajeAutomatico();
      }
      this.bienvenida.fromMap(map[OPCIONESMENSAJERIA.BIENVENIDA]);
    } else {
      this.bienvenida = null;
    }


    // Mensajes Automáticos
    if (map[OPCIONESMENSAJERIA.DESPEDIDA] != null) {
      if (this.despedida == null) {
        this.despedida = MensajeAutomatico();
      }
      this.despedida.fromMap(map[OPCIONESMENSAJERIA.DESPEDIDA]);
    } else {
      this.despedida = null;
    }


    // Mensajes Automáticos
    if (map[OPCIONESMENSAJERIA.PAQUETE] != null) {
      if (this.paquete == null) {
        this.paquete = MensajeAutomatico();
      }
      this.paquete.fromMap(map[OPCIONESMENSAJERIA.PAQUETE]);
    } else {
      this.paquete = null;
    }


    // Mensajes Automáticos
    if (map[OPCIONESMENSAJERIA.PROXIMOCHECKIN] != null) {
      if (this.proximoCheckIn == null) {
        this.proximoCheckIn = MensajeAutomatico();
      }
      this.proximoCheckIn.fromMap(map[OPCIONESMENSAJERIA.PROXIMOCHECKIN]);
    } else {
      this.proximoCheckIn = null;
    }


    // Mensajes Automáticos
    if (map[OPCIONESMENSAJERIA.PROXIMOCHECKOUT] != null) {
      if (this.proximoCheckOut == null) {
        this.proximoCheckOut = MensajeAutomatico();
      }
      this.proximoCheckOut.fromMap(map[OPCIONESMENSAJERIA.PROXIMOCHECKOUT]);
    } else {
      this.proximoCheckOut = null;
    }

  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final OpcionMensajeria typedOther = other;
    return
        id == typedOther.id &&
        participanteAutomatico == typedOther.participanteAutomatico &&
        bienvenida == typedOther.bienvenida &&
        despedida == typedOther.despedida &&
        paquete == typedOther.paquete &&
        proximoCheckIn == typedOther.proximoCheckIn &&
        proximoCheckOut == typedOther.proximoCheckOut;
  }

  @override
  int get hashCode => hashObjects([
      id.hashCode,
      participanteAutomatico.hashCode,
      bienvenida.hashCode,
      despedida.hashCode,
      paquete.hashCode,
      proximoCheckIn.hashCode,
      proximoCheckOut.hashCode,
  ]);

}

//==============================================================================
class OPCIONESMENSAJERIA {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Opciones de Mensajería';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Opción de Mensajería';

  // Etiquetas de los Atributos

  static const String ETIQUETA_KEY = 'Key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ETIQUETA_ID = 'Id';
  static const String ETIQUETA_PARTICIPANTEAUTOMATICO = 'Participante Automático';
  static const String ETIQUETA_BIENVENIDA = 'Bienvenida';
  static const String ETIQUETA_DESPEDIDA = 'Despedida';
  static const String ETIQUETA_PAQUETE = 'Paquete';
  static const String ETIQUETA_PROXIMOCHECKIN = 'Próximo Check In';
  static const String ETIQUETA_PROXIMOCHECKOUT = 'Próximo Check Out';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'OpcionesMensajeria';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'OpcionMensajeria';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String KEY = 'key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ID = 'id';
  static const String PARTICIPANTEAUTOMATICO = 'participanteAutomatico';
  static const String BIENVENIDA = 'bienvenida';
  static const String DESPEDIDA = 'despedida';
  static const String PAQUETE = 'paquete';
  static const String PROXIMOCHECKIN = 'proximoCheckIn';
  static const String PROXIMOCHECKOUT = 'proximoCheckOut';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [
 KEY,];
  static const List CAMPOS_DETALLE = [
 KEY, ID, PARTICIPANTEAUTOMATICO, BIENVENIDA, DESPEDIDA, PAQUETE, PROXIMOCHECKIN, PROXIMOCHECKOUT,];

}
