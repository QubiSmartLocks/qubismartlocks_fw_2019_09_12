/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad Paqueteria -> Paquete
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class Paquete {
  Paquete({
    this.key = '',
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

  String key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
  int id;  // Id [Búsqueda: int]
  OrigenPaquete origenPaquete;  // Id [Búsqueda: int]
  String numeroRastreo;  // Número de Rastreo [Texto Variable: String]
  String destinatario;  // Destinatario [Texto Variable: String]
  DateTime fechaHoraRecepcion;  // Fecha_Hora [Momento: DateTime]
  String notaRecepcion;  // Nota [Texto Variable: String]
  String notaDestinatario;  // Nota [Texto Variable: String]
  DateTime fechaHoraEntregado;  // Fecha_Hora [Momento: DateTime]
  Pasajero pasajero;  // Id [Búsqueda: int]
  DateTime recibidoPasajero;  // Fecha_Hora [Momento: DateTime]
  int recepcionista;  // Id [Búsqueda: int]
  bool mensajeenviado;  // Lógico [Lógico: bool]

  fromSnapshot(fb.DataSnapshot data) {
    this.fromKeyValue(data.key, data.val());
  }

  fromKeyValue(String key, Map value) {
    this.key = key; // Incluido por usar Firebase Database, pero no en Dendrita
    this.id = value[PAQUETERIA.ID];

    // Orígenes de Paquetes
    if (value[PAQUETERIA.ORIGENPAQUETE] != null) {
      if (this.origenPaquete == null) {
        this.origenPaquete = OrigenPaquete();
      }
      this.origenPaquete.fromKeyValue(key, value[PAQUETERIA.ORIGENPAQUETE]);
    } else {
      this.origenPaquete = null;
    }

    this.numeroRastreo = value[PAQUETERIA.NUMERORASTREO];
    this.destinatario = value[PAQUETERIA.DESTINATARIO];
    this.fechaHoraRecepcion = DateTime.parse(value[PAQUETERIA.FECHAHORARECEPCION]);
    this.notaRecepcion = value[PAQUETERIA.NOTARECEPCION];
    this.notaDestinatario = value[PAQUETERIA.NOTADESTINATARIO];
    this.fechaHoraEntregado = DateTime.parse(value[PAQUETERIA.FECHAHORAENTREGADO]);

    // Pasajeros
    if (value[PAQUETERIA.PASAJERO] != null) {
      if (this.pasajero == null) {
        this.pasajero = Pasajero();
      }
      this.pasajero.fromKeyValue(key, value[PAQUETERIA.PASAJERO]);
    } else {
      this.pasajero = null;
    }

    this.recibidoPasajero = DateTime.parse(value[PAQUETERIA.RECIBIDOPASAJERO]);
    this.recepcionista = value[PAQUETERIA.RECEPCIONISTA];
    this.mensajeenviado = value[PAQUETERIA.MENSAJEENVIADO];
  }

  toJson() {
    return {
      'key': this.key, // Incluido por usar Firebase Database, pero no en Dendrita
      PAQUETERIA.ID: this.id,
      PAQUETERIA.ORIGENPAQUETE: this.origenPaquete == null ? null : this.origenPaquete.toJson(),
      PAQUETERIA.NUMERORASTREO: this.numeroRastreo,
      PAQUETERIA.DESTINATARIO: this.destinatario,
      PAQUETERIA.FECHAHORARECEPCION: this.fechaHoraRecepcion == null ? null : GuardarFechaHora(this.fechaHoraRecepcion),
      PAQUETERIA.NOTARECEPCION: this.notaRecepcion,
      PAQUETERIA.NOTADESTINATARIO: this.notaDestinatario,
      PAQUETERIA.FECHAHORAENTREGADO: this.fechaHoraEntregado == null ? null : GuardarFechaHora(this.fechaHoraEntregado),
      PAQUETERIA.PASAJERO: this.pasajero == null ? null : this.pasajero.toJson(),
      PAQUETERIA.RECIBIDOPASAJERO: this.recibidoPasajero == null ? null : GuardarFechaHora(this.recibidoPasajero),
      PAQUETERIA.RECEPCIONISTA: this.recepcionista,
      PAQUETERIA.MENSAJEENVIADO: this.mensajeenviado,
    };
  }

  assign(Paquete paquete) {

    if (paquete == null) {
      this.key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
      this.id = null; //0;
      this.origenPaquete = null; //Pasajero();
      this.numeroRastreo = null; //'';
      this.destinatario = null; //'';
      this.fechaHoraRecepcion = null; //new DateTime.now();
      this.notaRecepcion = null; //'';
      this.notaDestinatario = null; //'';
      this.fechaHoraEntregado = null; //new DateTime.now();
      this.pasajero = null; //Pasajero();
      this.recibidoPasajero = null; //new DateTime.now();
      this.recepcionista = null; //0;
      this.mensajeenviado = null; //false;
    } else {
      this.key = paquete.key; // Incluido por usar Firebase Database, pero no en Dendrita
      this.id = paquete.id;

      // Orígenes de Paquetes
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

      // Pasajeros
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
      PAQUETERIA.KEY: this.key,  // Incluido por usar Firebase Database, pero no en Dendrita
      PAQUETERIA.ID: this.id,
      PAQUETERIA.ORIGENPAQUETE: this.origenPaquete == null ? null : this.origenPaquete.toMap(),
      PAQUETERIA.NUMERORASTREO: this.numeroRastreo,
      PAQUETERIA.DESTINATARIO: this.destinatario,
      PAQUETERIA.FECHAHORARECEPCION: this.fechaHoraRecepcion == null ? null : GuardarFecha(this.fechaHoraRecepcion),
      PAQUETERIA.NOTARECEPCION: this.notaRecepcion,
      PAQUETERIA.NOTADESTINATARIO: this.notaDestinatario,
      PAQUETERIA.FECHAHORAENTREGADO: this.fechaHoraEntregado == null ? null : GuardarFecha(this.fechaHoraEntregado),
      PAQUETERIA.PASAJERO: this.pasajero == null ? null : this.pasajero.toMap(),
      PAQUETERIA.RECIBIDOPASAJERO: this.recibidoPasajero == null ? null : GuardarFecha(this.recibidoPasajero),
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
    this.key = map[PAQUETERIA.KEY];  // Incluido por usar Firebase Database, pero no en Dendrita
    this.id = map[PAQUETERIA.ID];

    // Orígenes de Paquetes
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
    this.fechaHoraRecepcion = map[PAQUETERIA.FECHAHORARECEPCION] == null ? null : LeerFecha(map[PAQUETERIA.FECHAHORARECEPCION]);
    this.notaRecepcion = map[PAQUETERIA.NOTARECEPCION];
    this.notaDestinatario = map[PAQUETERIA.NOTADESTINATARIO];
    this.fechaHoraEntregado = map[PAQUETERIA.FECHAHORAENTREGADO] == null ? null : LeerFecha(map[PAQUETERIA.FECHAHORAENTREGADO]);

    // Pasajeros
    if (map[PAQUETERIA.PASAJERO] != null) {
      if (this.pasajero == null) {
        this.pasajero = Pasajero();
      }
      this.pasajero.fromMap(map[PAQUETERIA.PASAJERO]);
    } else {
      this.pasajero = null;
    }

    this.recibidoPasajero = map[PAQUETERIA.RECIBIDOPASAJERO] == null ? null : LeerFecha(map[PAQUETERIA.RECIBIDOPASAJERO]);
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
      mensajeenviado.hashCode,
  ]);

}

//==============================================================================
class PAQUETERIA {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Paquetería';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Paquete';

  // Etiquetas de los Atributos

  static const String ETIQUETA_KEY = 'Key'; // Incluido por usar Firebase Database, pero no en Dendrita
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
  static const String KEY = 'key'; // Incluido por usar Firebase Database, pero no en Dendrita
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

  static const List CAMPOS_LISTADO = [
 KEY, ID, ORIGENPAQUETE, NUMERORASTREO, DESTINATARIO, FECHAHORARECEPCION, FECHAHORAENTREGADO, PASAJERO, RECIBIDOPASAJERO, MENSAJEENVIADO,];
  static const List CAMPOS_DETALLE = [
 KEY, ID, ORIGENPAQUETE, NUMERORASTREO, DESTINATARIO, FECHAHORARECEPCION, NOTARECEPCION, NOTADESTINATARIO, FECHAHORAENTREGADO, PASAJERO, RECIBIDOPASAJERO, RECEPCIONISTA, MENSAJEENVIADO,];

}
