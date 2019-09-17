/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad Reservaciones -> Reservación
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class Reservacion {
  Reservacion({
    this.key = '',
    this.id,
    this.idEdificacion,
    this.numeroReservacion,
    this.fechaLlegada,
    this.horaLlegada,
    this.fechaSalida,
    this.horaSalida,
    this.tipoUnidadFuncional,
    this.unidadFuncional,
    this.adultos,
    this.niyos,
    this.referenciaNumero,
    this.fechaReferencia,
    this.garantizada,
    this.estadoReservacion,
    this.estadoactualizado,
    this.notasHuesped,
    this.notasReservacion,
    this.notasPersonal,
  });

  String key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
  int id;  // Id [Búsqueda: int]
  Edificacion idEdificacion;  // Id [Búsqueda: int]
  String numeroReservacion;  // Número de Reservación [Texto Variable: String]
  DateTime fechaLlegada;  // Fecha [Fecha: DateTime]
  TimeOfDay horaLlegada;  // Hora [Hora: TimeOfDay]
  DateTime fechaSalida;  // Fecha [Fecha: DateTime]
  TimeOfDay horaSalida;  // Hora [Hora: TimeOfDay]
  TipoUnidadFuncional tipoUnidadFuncional;  // Id [Búsqueda: int]
  UnidadFuncional unidadFuncional;  // Id [Búsqueda: int]
  int adultos;  // Entero Pequeño [Entero Pequeño: int]
  int niyos;  // Entero Pequeño [Entero Pequeño: int]
  String referenciaNumero;  // Referencia Número [Texto Variable: String]
  DateTime fechaReferencia;  // Fecha [Fecha: DateTime]
  bool garantizada;  // Lógico [Lógico: bool]
  EstadoReservacion estadoReservacion;  // Id [Búsqueda: int]
  DateTime estadoactualizado;  // Fecha_Hora [Momento: DateTime]
  String notasHuesped;  // Notas [Texto Variable: String]
  String notasReservacion;  // Notas [Texto Variable: String]
  String notasPersonal;  // Notas [Texto Variable: String]

  fromSnapshot(fb.DataSnapshot data) {
    this.fromKeyValue(data.key, data.val());
  }

  fromKeyValue(String key, Map value) {
    this.key = key; // Incluido por usar Firebase Database, pero no en Dendrita
    this.id = value[RESERVACIONES.ID];

    // Edificaciones
    if (value[RESERVACIONES.IDEDIFICACION] != null) {
      if (this.idEdificacion == null) {
        this.idEdificacion = Edificacion();
      }
      this.idEdificacion.fromKeyValue(key, value[RESERVACIONES.IDEDIFICACION]);
    } else {
      this.idEdificacion = null;
    }

    this.numeroReservacion = value[RESERVACIONES.NUMERORESERVACION];
    this.fechaLlegada = LeerFecha(value[RESERVACIONES.FECHALLEGADA]);
    this.horaLlegada = LeerHora(value[RESERVACIONES.HORALLEGADA]);
    this.fechaSalida = LeerFecha(value[RESERVACIONES.FECHASALIDA]);
    this.horaSalida = LeerHora(value[RESERVACIONES.HORASALIDA]);

    // Tipos de Unidades Funcionales
    if (value[RESERVACIONES.TIPOUNIDADFUNCIONAL] != null) {
      if (this.tipoUnidadFuncional == null) {
        this.tipoUnidadFuncional = TipoUnidadFuncional();
      }
      this.tipoUnidadFuncional.fromKeyValue(key, value[RESERVACIONES.TIPOUNIDADFUNCIONAL]);
    } else {
      this.tipoUnidadFuncional = null;
    }


    // Unidades Funcionales
    if (value[RESERVACIONES.UNIDADFUNCIONAL] != null) {
      if (this.unidadFuncional == null) {
        this.unidadFuncional = UnidadFuncional();
      }
      this.unidadFuncional.fromKeyValue(key, value[RESERVACIONES.UNIDADFUNCIONAL]);
    } else {
      this.unidadFuncional = null;
    }

    this.adultos = value[RESERVACIONES.ADULTOS];
    this.niyos = value[RESERVACIONES.NIYOS];
    this.referenciaNumero = value[RESERVACIONES.REFERENCIANUMERO];
    this.fechaReferencia = LeerFecha(value[RESERVACIONES.FECHAREFERENCIA]);
    this.garantizada = value[RESERVACIONES.GARANTIZADA];

    // Estados de Reservaciones
    if (value[RESERVACIONES.ESTADORESERVACION] != null) {
      if (this.estadoReservacion == null) {
        this.estadoReservacion = EstadoReservacion();
      }
      this.estadoReservacion.fromKeyValue(key, value[RESERVACIONES.ESTADORESERVACION]);
    } else {
      this.estadoReservacion = null;
    }

    this.estadoactualizado = DateTime.parse(value[RESERVACIONES.ESTADOACTUALIZADO]);
    this.notasHuesped = value[RESERVACIONES.NOTASHUESPED];
    this.notasReservacion = value[RESERVACIONES.NOTASRESERVACION];
    this.notasPersonal = value[RESERVACIONES.NOTASPERSONAL];
  }

  toJson() {
    return {
      'key': this.key, // Incluido por usar Firebase Database, pero no en Dendrita
      RESERVACIONES.ID: this.id,
      RESERVACIONES.IDEDIFICACION: this.idEdificacion == null ? null : this.idEdificacion.toJson(),
      RESERVACIONES.NUMERORESERVACION: this.numeroReservacion,
      RESERVACIONES.FECHALLEGADA: this.fechaLlegada == null ? null : GuardarFecha(this.fechaLlegada),
      RESERVACIONES.HORALLEGADA: this.horaLlegada == null ? null : GuardarHora(this.horaLlegada),
      RESERVACIONES.FECHASALIDA: this.fechaSalida == null ? null : GuardarFecha(this.fechaSalida),
      RESERVACIONES.HORASALIDA: this.horaSalida == null ? null : GuardarHora(this.horaSalida),
      RESERVACIONES.TIPOUNIDADFUNCIONAL: this.tipoUnidadFuncional == null ? null : this.tipoUnidadFuncional.toJson(),
      RESERVACIONES.UNIDADFUNCIONAL: this.unidadFuncional == null ? null : this.unidadFuncional.toJson(),
      RESERVACIONES.ADULTOS: this.adultos,
      RESERVACIONES.NIYOS: this.niyos,
      RESERVACIONES.REFERENCIANUMERO: this.referenciaNumero,
      RESERVACIONES.FECHAREFERENCIA: this.fechaReferencia == null ? null : GuardarFecha(this.fechaReferencia),
      RESERVACIONES.GARANTIZADA: this.garantizada,
      RESERVACIONES.ESTADORESERVACION: this.estadoReservacion == null ? null : this.estadoReservacion.toJson(),
      RESERVACIONES.ESTADOACTUALIZADO: this.estadoactualizado == null ? null : GuardarFechaHora(this.estadoactualizado),
      RESERVACIONES.NOTASHUESPED: this.notasHuesped,
      RESERVACIONES.NOTASRESERVACION: this.notasReservacion,
      RESERVACIONES.NOTASPERSONAL: this.notasPersonal,
    };
  }

  assign(Reservacion reservacion) {

    if (reservacion == null) {
      this.key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
      this.id = null; //0;
      this.idEdificacion = null; //EstadoReservacion();
      this.numeroReservacion = null; //'';
      this.fechaLlegada = null; //DateTime.now();
      this.horaLlegada = null; //DateTime.now();
      this.fechaSalida = null; //DateTime.now();
      this.horaSalida = null; //DateTime.now();
      this.tipoUnidadFuncional = null; //EstadoReservacion();
      this.unidadFuncional = null; //EstadoReservacion();
      this.adultos = null; //0;
      this.niyos = null; //0;
      this.referenciaNumero = null; //'';
      this.fechaReferencia = null; //DateTime.now();
      this.garantizada = null; //false;
      this.estadoReservacion = null; //EstadoReservacion();
      this.estadoactualizado = null; //new DateTime.now();
      this.notasHuesped = null; //'';
      this.notasReservacion = null; //'';
      this.notasPersonal = null; //'';
    } else {
      this.key = reservacion.key; // Incluido por usar Firebase Database, pero no en Dendrita
      this.id = reservacion.id;

      // Edificaciones
      if (reservacion.idEdificacion != null) {
        if (this.idEdificacion == null) {
          this.idEdificacion = Edificacion();
        }
        this.idEdificacion.assign(reservacion.idEdificacion);
      } else {
        this.idEdificacion = null;
      }

      this.numeroReservacion = reservacion.numeroReservacion;
      this.fechaLlegada = reservacion.fechaLlegada;
      this.horaLlegada = reservacion.horaLlegada;
      this.fechaSalida = reservacion.fechaSalida;
      this.horaSalida = reservacion.horaSalida;

      // Tipos de Unidades Funcionales
      if (reservacion.tipoUnidadFuncional != null) {
        if (this.tipoUnidadFuncional == null) {
          this.tipoUnidadFuncional = TipoUnidadFuncional();
        }
        this.tipoUnidadFuncional.assign(reservacion.tipoUnidadFuncional);
      } else {
        this.tipoUnidadFuncional = null;
      }


      // Unidades Funcionales
      if (reservacion.unidadFuncional != null) {
        if (this.unidadFuncional == null) {
          this.unidadFuncional = UnidadFuncional();
        }
        this.unidadFuncional.assign(reservacion.unidadFuncional);
      } else {
        this.unidadFuncional = null;
      }

      this.adultos = reservacion.adultos;
      this.niyos = reservacion.niyos;
      this.referenciaNumero = reservacion.referenciaNumero;
      this.fechaReferencia = reservacion.fechaReferencia;
      this.garantizada = reservacion.garantizada;

      // Estados de Reservaciones
      if (reservacion.estadoReservacion != null) {
        if (this.estadoReservacion == null) {
          this.estadoReservacion = EstadoReservacion();
        }
        this.estadoReservacion.assign(reservacion.estadoReservacion);
      } else {
        this.estadoReservacion = null;
      }

      this.estadoactualizado = reservacion.estadoactualizado;
      this.notasHuesped = reservacion.notasHuesped;
      this.notasReservacion = reservacion.notasReservacion;
      this.notasPersonal = reservacion.notasPersonal;
    }
  }

  Map toMap() {
    Map map = {
      RESERVACIONES.KEY: this.key,  // Incluido por usar Firebase Database, pero no en Dendrita
      RESERVACIONES.ID: this.id,
      RESERVACIONES.IDEDIFICACION: this.idEdificacion == null ? null : this.idEdificacion.toMap(),
      RESERVACIONES.NUMERORESERVACION: this.numeroReservacion,
      RESERVACIONES.FECHALLEGADA: this.fechaLlegada == null ? null : GuardarFecha(this.fechaLlegada),
      RESERVACIONES.HORALLEGADA: this.horaLlegada == null ? null : GuardarHora(this.horaLlegada),
      RESERVACIONES.FECHASALIDA: this.fechaSalida == null ? null : GuardarFecha(this.fechaSalida),
      RESERVACIONES.HORASALIDA: this.horaSalida == null ? null : GuardarHora(this.horaSalida),
      RESERVACIONES.TIPOUNIDADFUNCIONAL: this.tipoUnidadFuncional == null ? null : this.tipoUnidadFuncional.toMap(),
      RESERVACIONES.UNIDADFUNCIONAL: this.unidadFuncional == null ? null : this.unidadFuncional.toMap(),
      RESERVACIONES.ADULTOS: this.adultos,
      RESERVACIONES.NIYOS: this.niyos,
      RESERVACIONES.REFERENCIANUMERO: this.referenciaNumero,
      RESERVACIONES.FECHAREFERENCIA: this.fechaReferencia == null ? null : GuardarFecha(this.fechaReferencia),
      RESERVACIONES.GARANTIZADA: this.garantizada,
      RESERVACIONES.ESTADORESERVACION: this.estadoReservacion == null ? null : this.estadoReservacion.toMap(),
      RESERVACIONES.ESTADOACTUALIZADO: this.estadoactualizado == null ? null : GuardarFecha(this.estadoactualizado),
      RESERVACIONES.NOTASHUESPED: this.notasHuesped,
      RESERVACIONES.NOTASRESERVACION: this.notasReservacion,
      RESERVACIONES.NOTASPERSONAL: this.notasPersonal,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.key = map[RESERVACIONES.KEY];  // Incluido por usar Firebase Database, pero no en Dendrita
    this.id = map[RESERVACIONES.ID];

    // Edificaciones
    if (map[RESERVACIONES.IDEDIFICACION] != null) {
      if (this.idEdificacion == null) {
        this.idEdificacion = Edificacion();
      }
      this.idEdificacion.fromMap(map[RESERVACIONES.IDEDIFICACION]);
    } else {
      this.idEdificacion = null;
    }

    this.numeroReservacion = map[RESERVACIONES.NUMERORESERVACION];
    this.fechaLlegada = map[RESERVACIONES.FECHALLEGADA] == null ? null : LeerFecha(map[RESERVACIONES.FECHALLEGADA]);
    this.horaLlegada = map[RESERVACIONES.HORALLEGADA] == null ? null : LeerHora(map[RESERVACIONES.HORALLEGADA]);
    this.fechaSalida = map[RESERVACIONES.FECHASALIDA] == null ? null : LeerFecha(map[RESERVACIONES.FECHASALIDA]);
    this.horaSalida = map[RESERVACIONES.HORASALIDA] == null ? null : LeerHora(map[RESERVACIONES.HORASALIDA]);

    // Tipos de Unidades Funcionales
    if (map[RESERVACIONES.TIPOUNIDADFUNCIONAL] != null) {
      if (this.tipoUnidadFuncional == null) {
        this.tipoUnidadFuncional = TipoUnidadFuncional();
      }
      this.tipoUnidadFuncional.fromMap(map[RESERVACIONES.TIPOUNIDADFUNCIONAL]);
    } else {
      this.tipoUnidadFuncional = null;
    }


    // Unidades Funcionales
    if (map[RESERVACIONES.UNIDADFUNCIONAL] != null) {
      if (this.unidadFuncional == null) {
        this.unidadFuncional = UnidadFuncional();
      }
      this.unidadFuncional.fromMap(map[RESERVACIONES.UNIDADFUNCIONAL]);
    } else {
      this.unidadFuncional = null;
    }

    this.adultos = map[RESERVACIONES.ADULTOS];
    this.niyos = map[RESERVACIONES.NIYOS];
    this.referenciaNumero = map[RESERVACIONES.REFERENCIANUMERO];
    this.fechaReferencia = map[RESERVACIONES.FECHAREFERENCIA] == null ? null : LeerFecha(map[RESERVACIONES.FECHAREFERENCIA]);
    this.garantizada = map[RESERVACIONES.GARANTIZADA];

    // Estados de Reservaciones
    if (map[RESERVACIONES.ESTADORESERVACION] != null) {
      if (this.estadoReservacion == null) {
        this.estadoReservacion = EstadoReservacion();
      }
      this.estadoReservacion.fromMap(map[RESERVACIONES.ESTADORESERVACION]);
    } else {
      this.estadoReservacion = null;
    }

    this.estadoactualizado = map[RESERVACIONES.ESTADOACTUALIZADO] == null ? null : LeerFecha(map[RESERVACIONES.ESTADOACTUALIZADO]);
    this.notasHuesped = map[RESERVACIONES.NOTASHUESPED];
    this.notasReservacion = map[RESERVACIONES.NOTASRESERVACION];
    this.notasPersonal = map[RESERVACIONES.NOTASPERSONAL];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final Reservacion typedOther = other;
    return
        id == typedOther.id &&
        idEdificacion == typedOther.idEdificacion &&
        numeroReservacion == typedOther.numeroReservacion &&
        fechaLlegada == typedOther.fechaLlegada &&
        horaLlegada == typedOther.horaLlegada &&
        fechaSalida == typedOther.fechaSalida &&
        horaSalida == typedOther.horaSalida &&
        tipoUnidadFuncional == typedOther.tipoUnidadFuncional &&
        unidadFuncional == typedOther.unidadFuncional &&
        adultos == typedOther.adultos &&
        niyos == typedOther.niyos &&
        referenciaNumero == typedOther.referenciaNumero &&
        fechaReferencia == typedOther.fechaReferencia &&
        garantizada == typedOther.garantizada &&
        estadoReservacion == typedOther.estadoReservacion &&
        estadoactualizado == typedOther.estadoactualizado &&
        notasHuesped == typedOther.notasHuesped &&
        notasReservacion == typedOther.notasReservacion &&
        notasPersonal == typedOther.notasPersonal;
  }

  @override
  int get hashCode => hashObjects([
      id.hashCode,
      idEdificacion.hashCode,
      numeroReservacion.hashCode,
      fechaLlegada.hashCode,
      horaLlegada.hashCode,
      fechaSalida.hashCode,
      horaSalida.hashCode,
      tipoUnidadFuncional.hashCode,
      unidadFuncional.hashCode,
      adultos.hashCode,
      niyos.hashCode,
      referenciaNumero.hashCode,
      fechaReferencia.hashCode,
      garantizada.hashCode,
      estadoReservacion.hashCode,
      estadoactualizado.hashCode,
      notasHuesped.hashCode,
      notasReservacion.hashCode,
      notasPersonal.hashCode,
  ]);

}

//==============================================================================
class RESERVACIONES {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Reservaciones';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Reservación';

  // Etiquetas de los Atributos

  static const String ETIQUETA_KEY = 'Key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ETIQUETA_ID = 'Id';
  static const String ETIQUETA_IDEDIFICACION = 'Edificación';
  static const String ETIQUETA_NUMERORESERVACION = 'Número de Reservación';
  static const String ETIQUETA_FECHALLEGADA = 'Fecha de Llegada';
  static const String ETIQUETA_HORALLEGADA = 'Hora de Llegada';
  static const String ETIQUETA_FECHASALIDA = 'Fecha de Salida';
  static const String ETIQUETA_HORASALIDA = 'Hora de Salida';
  static const String ETIQUETA_TIPOUNIDADFUNCIONAL = 'Tipo de Habitación';
  static const String ETIQUETA_UNIDADFUNCIONAL = 'Habitación';
  static const String ETIQUETA_ADULTOS = 'Adultos';
  static const String ETIQUETA_NIYOS = 'Niños';
  static const String ETIQUETA_REFERENCIANUMERO = 'Referencia Número';
  static const String ETIQUETA_FECHAREFERENCIA = 'Fecha de Referencia';
  static const String ETIQUETA_GARANTIZADA = 'Garantizada';
  static const String ETIQUETA_ESTADORESERVACION = 'Estado de la Reservación';
  static const String ETIQUETA_ESTADOACTUALIZADO = 'Estado actualizado el';
  static const String ETIQUETA_NOTASHUESPED = 'Notas del Huesped';
  static const String ETIQUETA_NOTASRESERVACION = 'Notas de Reservación';
  static const String ETIQUETA_NOTASPERSONAL = 'Notas de Personal';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'Reservaciones';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'Reservacion';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String KEY = 'key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ID = 'id';
  static const String IDEDIFICACION = 'idEdificacion';
  static const String NUMERORESERVACION = 'numeroReservacion';
  static const String FECHALLEGADA = 'fechaLlegada';
  static const String HORALLEGADA = 'horaLlegada';
  static const String FECHASALIDA = 'fechaSalida';
  static const String HORASALIDA = 'horaSalida';
  static const String TIPOUNIDADFUNCIONAL = 'tipoUnidadFuncional';
  static const String UNIDADFUNCIONAL = 'unidadFuncional';
  static const String ADULTOS = 'adultos';
  static const String NIYOS = 'niyos';
  static const String REFERENCIANUMERO = 'referenciaNumero';
  static const String FECHAREFERENCIA = 'fechaReferencia';
  static const String GARANTIZADA = 'garantizada';
  static const String ESTADORESERVACION = 'estadoReservacion';
  static const String ESTADOACTUALIZADO = 'estadoactualizado';
  static const String NOTASHUESPED = 'notasHuesped';
  static const String NOTASRESERVACION = 'notasReservacion';
  static const String NOTASPERSONAL = 'notasPersonal';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [
 KEY, ID, NUMERORESERVACION, FECHALLEGADA, FECHASALIDA, TIPOUNIDADFUNCIONAL, UNIDADFUNCIONAL, ADULTOS, NIYOS, REFERENCIANUMERO, FECHAREFERENCIA, ESTADORESERVACION,];
  static const List CAMPOS_DETALLE = [
 KEY, ID, IDEDIFICACION, NUMERORESERVACION, FECHALLEGADA, HORALLEGADA, FECHASALIDA, HORASALIDA, TIPOUNIDADFUNCIONAL, UNIDADFUNCIONAL, ADULTOS, NIYOS, REFERENCIANUMERO, FECHAREFERENCIA, GARANTIZADA, ESTADORESERVACION, ESTADOACTUALIZADO, NOTASHUESPED, NOTASRESERVACION, NOTASPERSONAL,];

}
