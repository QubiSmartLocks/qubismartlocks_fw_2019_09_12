/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad Paqueteria -> Paquete
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class Paquete {
  Paquete({
    this.id,
    this.origenPaquete,
    this.numeroRastreo,
    this.destinatario,
    this.fechaHoraRecepcion,
    this.notaRecepcion,
    this.notaDestinatario,
    this.fechaHoraEntregado,
    this.pasajero,
    this.recibidoPasajero,
    this.recepcionista,
    this.mensajeenviado,
  });

  int id;
  OrigenPaquete origenPaquete;
  String numeroRastreo;
  String destinatario;
  String fechaHoraRecepcion;
  String notaRecepcion;
  String notaDestinatario;
  String fechaHoraEntregado;
  Pasajero pasajero;
  String recibidoPasajero;
  int recepcionista;
  bool mensajeenviado;

  fromKeyValue(String key, Map value) {
    this.id = value[PAQUETERIA.ID];
    this.origenPaquete.fromKeyValue(key, value[PAQUETERIA.ORIGENPAQUETE]);
    this.numeroRastreo = value[PAQUETERIA.NUMERORASTREO];
    this.destinatario = value[PAQUETERIA.DESTINATARIO];
    this.fechaHoraRecepcion = value[PAQUETERIA.FECHAHORARECEPCION];
    this.notaRecepcion = value[PAQUETERIA.NOTARECEPCION];
    this.notaDestinatario = value[PAQUETERIA.NOTADESTINATARIO];
    this.fechaHoraEntregado = value[PAQUETERIA.FECHAHORAENTREGADO];
    this.pasajero.fromKeyValue(key, value[PAQUETERIA.PASAJERO]);
    this.recibidoPasajero = value[PAQUETERIA.RECIBIDOPASAJERO];
    this.recepcionista = value[PAQUETERIA.RECEPCIONISTA];
    this.mensajeenviado = value[PAQUETERIA.MENSAJEENVIADO];
  }

  toJson() {
    return {
      PAQUETERIA.ID: this.id,
      PAQUETERIA.ORIGENPAQUETE: this.origenPaquete.toJson(),
      PAQUETERIA.NUMERORASTREO: this.numeroRastreo,
      PAQUETERIA.DESTINATARIO: this.destinatario,
      PAQUETERIA.FECHAHORARECEPCION: this.fechaHoraRecepcion,
      PAQUETERIA.NOTARECEPCION: this.notaRecepcion,
      PAQUETERIA.NOTADESTINATARIO: this.notaDestinatario,
      PAQUETERIA.FECHAHORAENTREGADO: this.fechaHoraEntregado,
      PAQUETERIA.PASAJERO: this.pasajero.toJson(),
      PAQUETERIA.RECIBIDOPASAJERO: this.recibidoPasajero,
      PAQUETERIA.RECEPCIONISTA: this.recepcionista,
      PAQUETERIA.MENSAJEENVIADO: this.mensajeenviado,
    };
  }

  assign(Paquete paquete) {

    if (paquete == null) {
      this.id = null; //0;
      this.origenPaquete = null; //new Pasajero();
      this.numeroRastreo = null; //'';
      this.destinatario = null; //'';
      this.fechaHoraRecepcion = null; //'';
      this.notaRecepcion = null; //'';
      this.notaDestinatario = null; //'';
      this.fechaHoraEntregado = null; //'';
      this.pasajero = null; //new Pasajero();
      this.recibidoPasajero = null; //'';
      this.recepcionista = null; //0;
      this.mensajeenviado = null; //false;
    } else {
      this.id = paquete.id;

      if (paquete.origenPaquete != null) {
        if (this.origenPaquete == null) {
          this.origenPaquete = OrigenPaquete();
        }
        this.origenPaquete.assign(paquete.origenPaquete);
      } else {
        this.origenPaquete = null;
      }

      this.numeroRastreo = paquete.numeroRastreo;
      this.destinatario = paquete.destinatario;
      this.fechaHoraRecepcion = paquete.fechaHoraRecepcion;
      this.notaRecepcion = paquete.notaRecepcion;
      this.notaDestinatario = paquete.notaDestinatario;
      this.fechaHoraEntregado = paquete.fechaHoraEntregado;

      if (paquete.pasajero != null) {
        if (this.pasajero == null) {
          this.pasajero = Pasajero();
        }
        this.pasajero.assign(paquete.pasajero);
      } else {
        this.pasajero = null;
      }

      this.recibidoPasajero = paquete.recibidoPasajero;
      this.recepcionista = paquete.recepcionista;
      this.mensajeenviado = paquete.mensajeenviado;
    }
  }

  Map toMap() {
    Map map = {
      PAQUETERIA.ID: this.id,
      PAQUETERIA.ORIGENPAQUETE: this.origenPaquete == null ? null : this.origenPaquete.toMap(),
      PAQUETERIA.NUMERORASTREO: this.numeroRastreo,
      PAQUETERIA.DESTINATARIO: this.destinatario,
      PAQUETERIA.FECHAHORARECEPCION: this.fechaHoraRecepcion,
      PAQUETERIA.NOTARECEPCION: this.notaRecepcion,
      PAQUETERIA.NOTADESTINATARIO: this.notaDestinatario,
      PAQUETERIA.FECHAHORAENTREGADO: this.fechaHoraEntregado,
      PAQUETERIA.PASAJERO: this.pasajero == null ? null : this.pasajero.toMap(),
      PAQUETERIA.RECIBIDOPASAJERO: this.recibidoPasajero,
      PAQUETERIA.RECEPCIONISTA: this.recepcionista,
      PAQUETERIA.MENSAJEENVIADO: this.mensajeenviado,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.id = map[PAQUETERIA.ID];
    if (map[PAQUETERIA.ORIGENPAQUETE] != null) {
      if (this.origenPaquete == null) {
        this.origenPaquete = OrigenPaquete();
      }
      this.origenPaquete.fromMap(map[PAQUETERIA.ORIGENPAQUETE]);
    } else {
      this.origenPaquete = null;
    }
    this.numeroRastreo = map[PAQUETERIA.NUMERORASTREO];
    this.destinatario = map[PAQUETERIA.DESTINATARIO];
    this.fechaHoraRecepcion = map[PAQUETERIA.FECHAHORARECEPCION];
    this.notaRecepcion = map[PAQUETERIA.NOTARECEPCION];
    this.notaDestinatario = map[PAQUETERIA.NOTADESTINATARIO];
    this.fechaHoraEntregado = map[PAQUETERIA.FECHAHORAENTREGADO];
    if (map[PAQUETERIA.PASAJERO] != null) {
      if (this.pasajero == null) {
        this.pasajero = Pasajero();
      }
      this.pasajero.fromMap(map[PAQUETERIA.PASAJERO]);
    } else {
      this.pasajero = null;
    }
    this.recibidoPasajero = map[PAQUETERIA.RECIBIDOPASAJERO];
    this.recepcionista = map[PAQUETERIA.RECEPCIONISTA];
    this.mensajeenviado = map[PAQUETERIA.MENSAJEENVIADO];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final Paquete typedOther = other;
    return
        id == typedOther.id &&
        origenPaquete == typedOther.origenPaquete &&
        numeroRastreo == typedOther.numeroRastreo &&
        destinatario == typedOther.destinatario &&
        fechaHoraRecepcion == typedOther.fechaHoraRecepcion &&
        notaRecepcion == typedOther.notaRecepcion &&
        notaDestinatario == typedOther.notaDestinatario &&
        fechaHoraEntregado == typedOther.fechaHoraEntregado &&
        pasajero == typedOther.pasajero &&
        recibidoPasajero == typedOther.recibidoPasajero &&
        recepcionista == typedOther.recepcionista &&
        mensajeenviado == typedOther.mensajeenviado;
  }


  @override
  int get hashCode => hashObjects([
      id.hashCode,
      origenPaquete.hashCode,
      numeroRastreo.hashCode,
      destinatario.hashCode,
      fechaHoraRecepcion.hashCode,
      notaRecepcion.hashCode,
      notaDestinatario.hashCode,
      fechaHoraEntregado.hashCode,
      pasajero.hashCode,
      recibidoPasajero.hashCode,
      recepcionista.hashCode,
      mensajeenviado.hashCode 
  ]);

}

//==============================================================================
class PAQUETERIA {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Paquetería';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Paquete';

  // Etiquetas de los Atributos
  static const String ETIQUETA_ID = 'Id';
  static const String ETIQUETA_ORIGENPAQUETE = 'Origen del Paquete';
  static const String ETIQUETA_NUMERORASTREO = 'Número de Rastreo';
  static const String ETIQUETA_DESTINATARIO = 'Destinatario';
  static const String ETIQUETA_FECHAHORARECEPCION = 'Fecha y Hora de Recepción';
  static const String ETIQUETA_NOTARECEPCION = 'Nota de Recepción';
  static const String ETIQUETA_NOTADESTINATARIO = 'Nota del Destinatario';
  static const String ETIQUETA_FECHAHORAENTREGADO = 'Fecha y Hora Entregado';
  static const String ETIQUETA_PASAJERO = 'Pasajero';
  static const String ETIQUETA_RECIBIDOPASAJERO = 'Recibido por Pasajero';
  static const String ETIQUETA_RECEPCIONISTA = 'Recepcionista';
  static const String ETIQUETA_MENSAJEENVIADO = 'Mensaje enviado';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'Paqueteria';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'Paquete';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String ID = 'id';
  static const String ORIGENPAQUETE = 'origenPaquete';
  static const String NUMERORASTREO = 'numeroRastreo';
  static const String DESTINATARIO = 'destinatario';
  static const String FECHAHORARECEPCION = 'fechaHoraRecepcion';
  static const String NOTARECEPCION = 'notaRecepcion';
  static const String NOTADESTINATARIO = 'notaDestinatario';
  static const String FECHAHORAENTREGADO = 'fechaHoraEntregado';
  static const String PASAJERO = 'pasajero';
  static const String RECIBIDOPASAJERO = 'recibidoPasajero';
  static const String RECEPCIONISTA = 'recepcionista';
  static const String MENSAJEENVIADO = 'mensajeenviado';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [ID,ORIGENPAQUETE,NUMERORASTREO,DESTINATARIO,FECHAHORARECEPCION,FECHAHORAENTREGADO,PASAJERO,RECIBIDOPASAJERO,MENSAJEENVIADO,];
  static const List CAMPOS_DETALLE = [ID,ORIGENPAQUETE,NUMERORASTREO,DESTINATARIO,FECHAHORARECEPCION,NOTARECEPCION,NOTADESTINATARIO,FECHAHORAENTREGADO,PASAJERO,RECIBIDOPASAJERO,RECEPCIONISTA,MENSAJEENVIADO,];

}
