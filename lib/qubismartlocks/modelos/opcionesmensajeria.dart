/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad OpcionesMensajeria -> Opción de Mensajería
   [Qubi Smart Locks/Mensajería (Chats)]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class OpcionMensajeria {
  OpcionMensajeria({
    this.id,
    this.participanteAutomatico,
    this.bienvenida,
    this.despedida,
    this.paquete,
    this.proximoCheckIn,
    this.proximoCheckOut,
  });

  int id;
  Participante participanteAutomatico;
  MensajeAutomatico bienvenida;
  MensajeAutomatico despedida;
  MensajeAutomatico paquete;
  MensajeAutomatico proximoCheckIn;
  MensajeAutomatico proximoCheckOut;

  fromKeyValue(String key, Map value) {
    this.id = value[OPCIONESMENSAJERIA.ID];
    this.participanteAutomatico.fromKeyValue(key, value[OPCIONESMENSAJERIA.PARTICIPANTEAUTOMATICO]);
    this.bienvenida.fromKeyValue(key, value[OPCIONESMENSAJERIA.BIENVENIDA]);
    this.despedida.fromKeyValue(key, value[OPCIONESMENSAJERIA.DESPEDIDA]);
    this.paquete.fromKeyValue(key, value[OPCIONESMENSAJERIA.PAQUETE]);
    this.proximoCheckIn.fromKeyValue(key, value[OPCIONESMENSAJERIA.PROXIMOCHECKIN]);
    this.proximoCheckOut.fromKeyValue(key, value[OPCIONESMENSAJERIA.PROXIMOCHECKOUT]);
  }

  toJson() {
    return {
      OPCIONESMENSAJERIA.ID: this.id,
      OPCIONESMENSAJERIA.PARTICIPANTEAUTOMATICO: this.participanteAutomatico.toJson(),
      OPCIONESMENSAJERIA.BIENVENIDA: this.bienvenida.toJson(),
      OPCIONESMENSAJERIA.DESPEDIDA: this.despedida.toJson(),
      OPCIONESMENSAJERIA.PAQUETE: this.paquete.toJson(),
      OPCIONESMENSAJERIA.PROXIMOCHECKIN: this.proximoCheckIn.toJson(),
      OPCIONESMENSAJERIA.PROXIMOCHECKOUT: this.proximoCheckOut.toJson(),
    };
  }

  assign(OpcionMensajeria opcionMensajeria) {

    if (opcionMensajeria == null) {
      this.id = null; //0;
      this.participanteAutomatico = null; //new MensajeAutomatico();
      this.bienvenida = null; //new MensajeAutomatico();
      this.despedida = null; //new MensajeAutomatico();
      this.paquete = null; //new MensajeAutomatico();
      this.proximoCheckIn = null; //new MensajeAutomatico();
      this.proximoCheckOut = null; //new MensajeAutomatico();
    } else {
      this.id = opcionMensajeria.id;

      if (opcionMensajeria.participanteAutomatico != null) {
        if (this.participanteAutomatico == null) {
          this.participanteAutomatico = Participante();
        }
        this.participanteAutomatico.assign(opcionMensajeria.participanteAutomatico);
      } else {
        this.participanteAutomatico = null;
      }


      if (opcionMensajeria.bienvenida != null) {
        if (this.bienvenida == null) {
          this.bienvenida = MensajeAutomatico();
        }
        this.bienvenida.assign(opcionMensajeria.bienvenida);
      } else {
        this.bienvenida = null;
      }


      if (opcionMensajeria.despedida != null) {
        if (this.despedida == null) {
          this.despedida = MensajeAutomatico();
        }
        this.despedida.assign(opcionMensajeria.despedida);
      } else {
        this.despedida = null;
      }


      if (opcionMensajeria.paquete != null) {
        if (this.paquete == null) {
          this.paquete = MensajeAutomatico();
        }
        this.paquete.assign(opcionMensajeria.paquete);
      } else {
        this.paquete = null;
      }


      if (opcionMensajeria.proximoCheckIn != null) {
        if (this.proximoCheckIn == null) {
          this.proximoCheckIn = MensajeAutomatico();
        }
        this.proximoCheckIn.assign(opcionMensajeria.proximoCheckIn);
      } else {
        this.proximoCheckIn = null;
      }


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
    this.id = map[OPCIONESMENSAJERIA.ID];
    if (map[OPCIONESMENSAJERIA.PARTICIPANTEAUTOMATICO] != null) {
      if (this.participanteAutomatico == null) {
        this.participanteAutomatico = Participante();
      }
      this.participanteAutomatico.fromMap(map[OPCIONESMENSAJERIA.PARTICIPANTEAUTOMATICO]);
    } else {
      this.participanteAutomatico = null;
    }
    if (map[OPCIONESMENSAJERIA.BIENVENIDA] != null) {
      if (this.bienvenida == null) {
        this.bienvenida = MensajeAutomatico();
      }
      this.bienvenida.fromMap(map[OPCIONESMENSAJERIA.BIENVENIDA]);
    } else {
      this.bienvenida = null;
    }
    if (map[OPCIONESMENSAJERIA.DESPEDIDA] != null) {
      if (this.despedida == null) {
        this.despedida = MensajeAutomatico();
      }
      this.despedida.fromMap(map[OPCIONESMENSAJERIA.DESPEDIDA]);
    } else {
      this.despedida = null;
    }
    if (map[OPCIONESMENSAJERIA.PAQUETE] != null) {
      if (this.paquete == null) {
        this.paquete = MensajeAutomatico();
      }
      this.paquete.fromMap(map[OPCIONESMENSAJERIA.PAQUETE]);
    } else {
      this.paquete = null;
    }
    if (map[OPCIONESMENSAJERIA.PROXIMOCHECKIN] != null) {
      if (this.proximoCheckIn == null) {
        this.proximoCheckIn = MensajeAutomatico();
      }
      this.proximoCheckIn.fromMap(map[OPCIONESMENSAJERIA.PROXIMOCHECKIN]);
    } else {
      this.proximoCheckIn = null;
    }
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
      proximoCheckOut.hashCode 
  ]);

}

//==============================================================================
class OPCIONESMENSAJERIA {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Opciones de Mensajería';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Opción de Mensajería';

  // Etiquetas de los Atributos
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

  static const List CAMPOS_LISTADO = [];
  static const List CAMPOS_DETALLE = [ID,PARTICIPANTEAUTOMATICO,BIENVENIDA,DESPEDIDA,PAQUETE,PROXIMOCHECKIN,PROXIMOCHECKOUT,];

}
