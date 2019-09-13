/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad Clientes -> Cliente
   [Qubi Smart Locks/Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class Cliente {
  Cliente({
    this.id,
    this.nombres,
    this.apellidos,
    this.tipoIdent,
    this.docIdent,
    this.telefono,
    this.correoElectronico,
  });

  int id;
  String nombres;
  String apellidos;
  TipoIdent tipoIdent;
  String docIdent;
  String telefono;
  String correoElectronico;

  fromKeyValue(String key, Map value) {
    this.id = value[CLIENTES.ID];
    this.nombres = value[CLIENTES.NOMBRES];
    this.apellidos = value[CLIENTES.APELLIDOS];
    this.tipoIdent.fromKeyValue(key, value[CLIENTES.TIPOIDENT]);
    this.docIdent = value[CLIENTES.DOCIDENT];
    this.telefono = value[CLIENTES.TELEFONO];
    this.correoElectronico = value[CLIENTES.CORREOELECTRONICO];
  }

  toJson() {
    return {
      CLIENTES.ID: this.id,
      CLIENTES.NOMBRES: this.nombres,
      CLIENTES.APELLIDOS: this.apellidos,
      CLIENTES.TIPOIDENT: this.tipoIdent.toJson(),
      CLIENTES.DOCIDENT: this.docIdent,
      CLIENTES.TELEFONO: this.telefono,
      CLIENTES.CORREOELECTRONICO: this.correoElectronico,
    };
  }

  assign(Cliente cliente) {

    if (cliente == null) {
      this.id = null; //0;
      this.nombres = null; //'';
      this.apellidos = null; //'';
      this.tipoIdent = null; //new TipoIdent();
      this.docIdent = null; //'';
      this.telefono = null; //'';
      this.correoElectronico = null; //'';
    } else {
      this.id = cliente.id;
      this.nombres = cliente.nombres;
      this.apellidos = cliente.apellidos;

      if (cliente.tipoIdent != null) {
        if (this.tipoIdent == null) {
          this.tipoIdent = TipoIdent();
        }
        this.tipoIdent.assign(cliente.tipoIdent);
      } else {
        this.tipoIdent = null;
      }

      this.docIdent = cliente.docIdent;
      this.telefono = cliente.telefono;
      this.correoElectronico = cliente.correoElectronico;
    }
  }

  Map toMap() {
    Map map = {
      CLIENTES.ID: this.id,
      CLIENTES.NOMBRES: this.nombres,
      CLIENTES.APELLIDOS: this.apellidos,
      CLIENTES.TIPOIDENT: this.tipoIdent == null ? null : this.tipoIdent.toMap(),
      CLIENTES.DOCIDENT: this.docIdent,
      CLIENTES.TELEFONO: this.telefono,
      CLIENTES.CORREOELECTRONICO: this.correoElectronico,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.id = map[CLIENTES.ID];
    this.nombres = map[CLIENTES.NOMBRES];
    this.apellidos = map[CLIENTES.APELLIDOS];
    if (map[CLIENTES.TIPOIDENT] != null) {
      if (this.tipoIdent == null) {
        this.tipoIdent = TipoIdent();
      }
      this.tipoIdent.fromMap(map[CLIENTES.TIPOIDENT]);
    } else {
      this.tipoIdent = null;
    }
    this.docIdent = map[CLIENTES.DOCIDENT];
    this.telefono = map[CLIENTES.TELEFONO];
    this.correoElectronico = map[CLIENTES.CORREOELECTRONICO];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final Cliente typedOther = other;
    return
        id == typedOther.id &&
        nombres == typedOther.nombres &&
        apellidos == typedOther.apellidos &&
        tipoIdent == typedOther.tipoIdent &&
        docIdent == typedOther.docIdent &&
        telefono == typedOther.telefono &&
        correoElectronico == typedOther.correoElectronico;
  }


  @override
  int get hashCode => hashObjects([
      id.hashCode,
      nombres.hashCode,
      apellidos.hashCode,
      tipoIdent.hashCode,
      docIdent.hashCode,
      telefono.hashCode,
      correoElectronico.hashCode 
  ]);

}

//==============================================================================
class CLIENTES {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Clientes';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Cliente';

  // Etiquetas de los Atributos
  static const String ETIQUETA_ID = 'Id';
  static const String ETIQUETA_NOMBRES = 'Nombres';
  static const String ETIQUETA_APELLIDOS = 'Apellidos';
  static const String ETIQUETA_TIPOIDENT = 'Tipo de Identificación';
  static const String ETIQUETA_DOCIDENT = 'Documento de Identificación';
  static const String ETIQUETA_TELEFONO = 'Teléfono';
  static const String ETIQUETA_CORREOELECTRONICO = 'Correo Electrónico';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'Clientes';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'Cliente';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String ID = 'id';
  static const String NOMBRES = 'nombres';
  static const String APELLIDOS = 'apellidos';
  static const String TIPOIDENT = 'tipoIdent';
  static const String DOCIDENT = 'docIdent';
  static const String TELEFONO = 'telefono';
  static const String CORREOELECTRONICO = 'correoElectronico';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [ID,NOMBRES,APELLIDOS,TIPOIDENT,DOCIDENT,TELEFONO,CORREOELECTRONICO,];
  static const List CAMPOS_DETALLE = [ID,NOMBRES,APELLIDOS,TIPOIDENT,DOCIDENT,TELEFONO,CORREOELECTRONICO,];

}
