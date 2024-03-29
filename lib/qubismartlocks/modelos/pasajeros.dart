/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad Pasajeros -> Pasajero
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class Pasajero {
  Pasajero({
    this.key = '',
    this.id,
    this.reservacion,
    this.nombres,
    this.apellidos,
    this.tipoIdent,
    this.docIdent,
    this.telefono,
    this.correoElectronico,
    this.llaveElectronica,
  });

  String key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
  int id;  // Id [Búsqueda: int]
  int reservacion;  // Id [Búsqueda: int]
  String nombres;  // Nombre [Texto Variable: String]
  String apellidos;  // Nombre [Texto Variable: String]
  TipoIdent tipoIdent;  // Id [Búsqueda: int]
  String docIdent;  // Identificación Personal [Texto Variable: String]
  String telefono;  // Teléfono [Texto Variable: String]
  String correoElectronico;  // Correo Electrónico [Texto Variable: String]
  bool llaveElectronica;  // Lógico [Lógico: bool]

  fromSnapshot(fb.DataSnapshot data) {
    this.fromKeyValue(data.key, data.val());
  }

  fromKeyValue(String key, Map value) {
    this.key = key; // Incluido por usar Firebase Database, pero no en Dendrita
    this.id = value[PASAJEROS.ID];
    this.reservacion = value[PASAJEROS.RESERVACION];
    this.nombres = value[PASAJEROS.NOMBRES];
    this.apellidos = value[PASAJEROS.APELLIDOS];

    // Tipos de Identificación
    if (value[PASAJEROS.TIPOIDENT] != null) {
      if (this.tipoIdent == null) {
        this.tipoIdent = TipoIdent();
      }
      this.tipoIdent.fromKeyValue(key, value[PASAJEROS.TIPOIDENT]);
    } else {
      this.tipoIdent = null;
    }

    this.docIdent = value[PASAJEROS.DOCIDENT];
    this.telefono = value[PASAJEROS.TELEFONO];
    this.correoElectronico = value[PASAJEROS.CORREOELECTRONICO];
    this.llaveElectronica = value[PASAJEROS.LLAVEELECTRONICA];
  }

  toJson() {
    return {
      'key': this.key, // Incluido por usar Firebase Database, pero no en Dendrita
      PASAJEROS.ID: this.id,
      PASAJEROS.RESERVACION: this.reservacion,
      PASAJEROS.NOMBRES: this.nombres,
      PASAJEROS.APELLIDOS: this.apellidos,
      PASAJEROS.TIPOIDENT: this.tipoIdent == null ? null : this.tipoIdent.toJson(),
      PASAJEROS.DOCIDENT: this.docIdent,
      PASAJEROS.TELEFONO: this.telefono,
      PASAJEROS.CORREOELECTRONICO: this.correoElectronico,
      PASAJEROS.LLAVEELECTRONICA: this.llaveElectronica,
    };
  }

  assign(Pasajero pasajero) {

    if (pasajero == null) {
      this.key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
      this.id = null; //0;
      this.reservacion = null; //0;
      this.nombres = null; //'';
      this.apellidos = null; //'';
      this.tipoIdent = null; //TipoIdent();
      this.docIdent = null; //'';
      this.telefono = null; //'';
      this.correoElectronico = null; //'';
      this.llaveElectronica = null; //false;
    } else {
      this.key = pasajero.key; // Incluido por usar Firebase Database, pero no en Dendrita
      this.id = pasajero.id;
      this.reservacion = pasajero.reservacion;
      this.nombres = pasajero.nombres;
      this.apellidos = pasajero.apellidos;

      // Tipos de Identificación
      if (pasajero.tipoIdent != null) {
        if (this.tipoIdent == null) {
          this.tipoIdent = TipoIdent();
        }
        this.tipoIdent.assign(pasajero.tipoIdent);
      } else {
        this.tipoIdent = null;
      }

      this.docIdent = pasajero.docIdent;
      this.telefono = pasajero.telefono;
      this.correoElectronico = pasajero.correoElectronico;
      this.llaveElectronica = pasajero.llaveElectronica;
    }
  }

  Map toMap() {
    Map map = {
      PASAJEROS.KEY: this.key,  // Incluido por usar Firebase Database, pero no en Dendrita
      PASAJEROS.ID: this.id,
      PASAJEROS.RESERVACION: this.reservacion,
      PASAJEROS.NOMBRES: this.nombres,
      PASAJEROS.APELLIDOS: this.apellidos,
      PASAJEROS.TIPOIDENT: this.tipoIdent == null ? null : this.tipoIdent.toMap(),
      PASAJEROS.DOCIDENT: this.docIdent,
      PASAJEROS.TELEFONO: this.telefono,
      PASAJEROS.CORREOELECTRONICO: this.correoElectronico,
      PASAJEROS.LLAVEELECTRONICA: this.llaveElectronica,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.key = map[PASAJEROS.KEY];  // Incluido por usar Firebase Database, pero no en Dendrita
    this.id = map[PASAJEROS.ID];
    this.reservacion = map[PASAJEROS.RESERVACION];
    this.nombres = map[PASAJEROS.NOMBRES];
    this.apellidos = map[PASAJEROS.APELLIDOS];

    // Tipos de Identificación
    if (map[PASAJEROS.TIPOIDENT] != null) {
      if (this.tipoIdent == null) {
        this.tipoIdent = TipoIdent();
      }
      this.tipoIdent.fromMap(map[PASAJEROS.TIPOIDENT]);
    } else {
      this.tipoIdent = null;
    }

    this.docIdent = map[PASAJEROS.DOCIDENT];
    this.telefono = map[PASAJEROS.TELEFONO];
    this.correoElectronico = map[PASAJEROS.CORREOELECTRONICO];
    this.llaveElectronica = map[PASAJEROS.LLAVEELECTRONICA];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final Pasajero typedOther = other;
    return
        id == typedOther.id &&
        reservacion == typedOther.reservacion &&
        nombres == typedOther.nombres &&
        apellidos == typedOther.apellidos &&
        tipoIdent == typedOther.tipoIdent &&
        docIdent == typedOther.docIdent &&
        telefono == typedOther.telefono &&
        correoElectronico == typedOther.correoElectronico &&
        llaveElectronica == typedOther.llaveElectronica;
  }

  @override
  int get hashCode => hashObjects([
      id.hashCode,
      reservacion.hashCode,
      nombres.hashCode,
      apellidos.hashCode,
      tipoIdent.hashCode,
      docIdent.hashCode,
      telefono.hashCode,
      correoElectronico.hashCode,
      llaveElectronica.hashCode,
  ]);

}

//==============================================================================
class PASAJEROS {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Pasajeros';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Pasajero';

  // Etiquetas de los Atributos

  static const String ETIQUETA_KEY = 'Key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ETIQUETA_ID = 'Id';
  static const String ETIQUETA_RESERVACION = 'Reservación';
  static const String ETIQUETA_NOMBRES = 'Nombres';
  static const String ETIQUETA_APELLIDOS = 'Apellidos';
  static const String ETIQUETA_TIPOIDENT = 'Tipo de Identificación';
  static const String ETIQUETA_DOCIDENT = 'Documento de Identificación';
  static const String ETIQUETA_TELEFONO = 'Teléfono';
  static const String ETIQUETA_CORREOELECTRONICO = 'Correo Electrónico';
  static const String ETIQUETA_LLAVEELECTRONICA = 'Llave Electrónica';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'Pasajeros';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'Pasajero';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String KEY = 'key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ID = 'id';
  static const String RESERVACION = 'reservacion';
  static const String NOMBRES = 'nombres';
  static const String APELLIDOS = 'apellidos';
  static const String TIPOIDENT = 'tipoIdent';
  static const String DOCIDENT = 'docIdent';
  static const String TELEFONO = 'telefono';
  static const String CORREOELECTRONICO = 'correoElectronico';
  static const String LLAVEELECTRONICA = 'llaveElectronica';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [
 KEY, ID, RESERVACION, NOMBRES, APELLIDOS, LLAVEELECTRONICA,];
  static const List CAMPOS_DETALLE = [
 KEY, ID, RESERVACION, NOMBRES, APELLIDOS, TIPOIDENT, DOCIDENT, TELEFONO, CORREOELECTRONICO, LLAVEELECTRONICA,];

}
