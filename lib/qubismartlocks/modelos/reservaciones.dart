/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad Reservaciones -> Reservación
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class Reservacion {
  Reservacion({
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

  int id;
  Edificacion idEdificacion;
  String numeroReservacion;
  DateTime fechaLlegada;
  TimeOfDay horaLlegada;
  DateTime fechaSalida;
  TimeOfDay horaSalida;
  TipoUnidadFuncional tipoUnidadFuncional;
  UnidadFuncional unidadFuncional;
  int adultos;
  int niyos;
  String referenciaNumero;
  DateTime fechaReferencia;
  bool garantizada;
  EstadoReservacion estadoReservacion;
  String estadoactualizado;
  String notasHuesped;
  String notasReservacion;
  String notasPersonal;

  fromKeyValue(String key, Map value) {
    this.id = value[RESERVACIONES.ID];
    this.idEdificacion.fromKeyValue(key, value[RESERVACIONES.IDEDIFICACION]);
    this.numeroReservacion = value[RESERVACIONES.NUMERORESERVACION];
    this.fechaLlegada = new DateTime.fromMillisecondsSinceEpoch(value[RESERVACIONES.FECHALLEGADA]);
    this.horaLlegada = new TimeOfDay.fromDateTime(new DateTime.fromMillisecondsSinceEpoch(value[RESERVACIONES.HORALLEGADA]));
    this.fechaSalida = new DateTime.fromMillisecondsSinceEpoch(value[RESERVACIONES.FECHASALIDA]);
    this.horaSalida = new TimeOfDay.fromDateTime(new DateTime.fromMillisecondsSinceEpoch(value[RESERVACIONES.HORASALIDA]));
    this.tipoUnidadFuncional.fromKeyValue(key, value[RESERVACIONES.TIPOUNIDADFUNCIONAL]);
    this.unidadFuncional.fromKeyValue(key, value[RESERVACIONES.UNIDADFUNCIONAL]);
    this.adultos = value[RESERVACIONES.ADULTOS];
    this.niyos = value[RESERVACIONES.NIYOS];
    this.referenciaNumero = value[RESERVACIONES.REFERENCIANUMERO];
    this.fechaReferencia = new DateTime.fromMillisecondsSinceEpoch(value[RESERVACIONES.FECHAREFERENCIA]);
    this.garantizada = value[RESERVACIONES.GARANTIZADA];
    this.estadoReservacion.fromKeyValue(key, value[RESERVACIONES.ESTADORESERVACION]);
    this.estadoactualizado = value[RESERVACIONES.ESTADOACTUALIZADO];
    this.notasHuesped = value[RESERVACIONES.NOTASHUESPED];
    this.notasReservacion = value[RESERVACIONES.NOTASRESERVACION];
    this.notasPersonal = value[RESERVACIONES.NOTASPERSONAL];
  }

  toJson() {
    return {
      RESERVACIONES.ID: this.id,
      RESERVACIONES.IDEDIFICACION: this.idEdificacion.toJson(),
      RESERVACIONES.NUMERORESERVACION: this.numeroReservacion,
      RESERVACIONES.FECHALLEGADA: this.fechaLlegada == null ? null : this.fechaLlegada.millisecondsSinceEpoch,
      RESERVACIONES.HORALLEGADA: this.horaLlegada == null ? null : (this.horaLlegada.hour * 60 * 60 * 1000) +
          (this.horaLlegada.minute * 60 * 1000) ,
      RESERVACIONES.FECHASALIDA: this.fechaSalida == null ? null : this.fechaSalida.millisecondsSinceEpoch,
      RESERVACIONES.HORASALIDA: this.horaSalida == null ? null : (this.horaSalida.hour * 60 * 60 * 1000) +
          (this.horaSalida.minute * 60 * 1000) ,
      RESERVACIONES.TIPOUNIDADFUNCIONAL: this.tipoUnidadFuncional.toJson(),
      RESERVACIONES.UNIDADFUNCIONAL: this.unidadFuncional.toJson(),
      RESERVACIONES.ADULTOS: this.adultos,
      RESERVACIONES.NIYOS: this.niyos,
      RESERVACIONES.REFERENCIANUMERO: this.referenciaNumero,
      RESERVACIONES.FECHAREFERENCIA: this.fechaReferencia == null ? null : this.fechaReferencia.millisecondsSinceEpoch,
      RESERVACIONES.GARANTIZADA: this.garantizada,
      RESERVACIONES.ESTADORESERVACION: this.estadoReservacion.toJson(),
      RESERVACIONES.ESTADOACTUALIZADO: this.estadoactualizado,
      RESERVACIONES.NOTASHUESPED: this.notasHuesped,
      RESERVACIONES.NOTASRESERVACION: this.notasReservacion,
      RESERVACIONES.NOTASPERSONAL: this.notasPersonal,
    };
  }

  assign(Reservacion reservacion) {

    if (reservacion == null) {
      this.id = null; //0;
      this.idEdificacion = null; //new EstadoReservacion();
      this.numeroReservacion = null; //'';
      this.fechaLlegada = null; //DateTime.now();
      this.horaLlegada = null; //DateTime.now();
      this.fechaSalida = null; //DateTime.now();
      this.horaSalida = null; //DateTime.now();
      this.tipoUnidadFuncional = null; //new EstadoReservacion();
      this.unidadFuncional = null; //new EstadoReservacion();
      this.adultos = null; //0;
      this.niyos = null; //0;
      this.referenciaNumero = null; //'';
      this.fechaReferencia = null; //DateTime.now();
      this.garantizada = null; //false;
      this.estadoReservacion = null; //new EstadoReservacion();
      this.estadoactualizado = null; //'';
      this.notasHuesped = null; //'';
      this.notasReservacion = null; //'';
      this.notasPersonal = null; //'';
    } else {
      this.id = reservacion.id;

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

      if (reservacion.tipoUnidadFuncional != null) {
        if (this.tipoUnidadFuncional == null) {
          this.tipoUnidadFuncional = TipoUnidadFuncional();
        }
        this.tipoUnidadFuncional.assign(reservacion.tipoUnidadFuncional);
      } else {
        this.tipoUnidadFuncional = null;
      }


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
      RESERVACIONES.ID: this.id,
      RESERVACIONES.IDEDIFICACION: this.idEdificacion == null ? null : this.idEdificacion.toMap(),
      RESERVACIONES.NUMERORESERVACION: this.numeroReservacion,
      RESERVACIONES.FECHALLEGADA: this.fechaLlegada == null ? null : this.fechaLlegada.millisecondsSinceEpoch,
      RESERVACIONES.HORALLEGADA: this.horaLlegada == null ? null : (this.horaLlegada.hour * 60 * 60 * 1000) +
          (this.horaLlegada.minute * 60 * 1000) ,
      RESERVACIONES.FECHASALIDA: this.fechaSalida == null ? null : this.fechaSalida.millisecondsSinceEpoch,
      RESERVACIONES.HORASALIDA: this.horaSalida == null ? null : (this.horaSalida.hour * 60 * 60 * 1000) +
          (this.horaSalida.minute * 60 * 1000) ,
      RESERVACIONES.TIPOUNIDADFUNCIONAL: this.tipoUnidadFuncional == null ? null : this.tipoUnidadFuncional.toMap(),
      RESERVACIONES.UNIDADFUNCIONAL: this.unidadFuncional == null ? null : this.unidadFuncional.toMap(),
      RESERVACIONES.ADULTOS: this.adultos,
      RESERVACIONES.NIYOS: this.niyos,
      RESERVACIONES.REFERENCIANUMERO: this.referenciaNumero,
      RESERVACIONES.FECHAREFERENCIA: this.fechaReferencia == null ? null : this.fechaReferencia.millisecondsSinceEpoch,
      RESERVACIONES.GARANTIZADA: this.garantizada,
      RESERVACIONES.ESTADORESERVACION: this.estadoReservacion == null ? null : this.estadoReservacion.toMap(),
      RESERVACIONES.ESTADOACTUALIZADO: this.estadoactualizado,
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
    this.id = map[RESERVACIONES.ID];
    if (map[RESERVACIONES.IDEDIFICACION] != null) {
      if (this.idEdificacion == null) {
        this.idEdificacion = Edificacion();
      }
      this.idEdificacion.fromMap(map[RESERVACIONES.IDEDIFICACION]);
    } else {
      this.idEdificacion = null;
    }
    this.numeroReservacion = map[RESERVACIONES.NUMERORESERVACION];
    this.fechaLlegada = map[RESERVACIONES.FECHALLEGADA];
    this.horaLlegada = map[RESERVACIONES.HORALLEGADA];
    this.fechaSalida = map[RESERVACIONES.FECHASALIDA];
    this.horaSalida = map[RESERVACIONES.HORASALIDA];
    if (map[RESERVACIONES.TIPOUNIDADFUNCIONAL] != null) {
      if (this.tipoUnidadFuncional == null) {
        this.tipoUnidadFuncional = TipoUnidadFuncional();
      }
      this.tipoUnidadFuncional.fromMap(map[RESERVACIONES.TIPOUNIDADFUNCIONAL]);
    } else {
      this.tipoUnidadFuncional = null;
    }
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
    this.fechaReferencia = map[RESERVACIONES.FECHAREFERENCIA];
    this.garantizada = map[RESERVACIONES.GARANTIZADA];
    if (map[RESERVACIONES.ESTADORESERVACION] != null) {
      if (this.estadoReservacion == null) {
        this.estadoReservacion = EstadoReservacion();
      }
      this.estadoReservacion.fromMap(map[RESERVACIONES.ESTADORESERVACION]);
    } else {
      this.estadoReservacion = null;
    }
    this.estadoactualizado = map[RESERVACIONES.ESTADOACTUALIZADO];
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
      notasPersonal.hashCode 
  ]);

}

//==============================================================================
class RESERVACIONES {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Reservaciones';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Reservación';

  // Etiquetas de los Atributos
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

  static const List CAMPOS_LISTADO = [ID,NUMERORESERVACION,FECHALLEGADA,FECHASALIDA,TIPOUNIDADFUNCIONAL,UNIDADFUNCIONAL,ADULTOS,NIYOS,REFERENCIANUMERO,FECHAREFERENCIA,ESTADORESERVACION,];
  static const List CAMPOS_DETALLE = [ID,IDEDIFICACION,NUMERORESERVACION,FECHALLEGADA,HORALLEGADA,FECHASALIDA,HORASALIDA,TIPOUNIDADFUNCIONAL,UNIDADFUNCIONAL,ADULTOS,NIYOS,REFERENCIANUMERO,FECHAREFERENCIA,GARANTIZADA,ESTADORESERVACION,ESTADOACTUALIZADO,NOTASHUESPED,NOTASRESERVACION,NOTASPERSONAL,];

}
