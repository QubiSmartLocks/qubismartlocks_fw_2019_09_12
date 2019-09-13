/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad ModelosCampos -> Modelo Campo
   [Qubi Smart Locks/Modelos de Campos]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class ModeloCampo {
  ModeloCampo({
    this.id,
    this.denomModelo,
    this.descModelo,
    this.fecha,
    this.hora,
    this.entero,
    this.enteroGrande,
    this.enteroPequeyo,
    this.decimal,
    this.moneda,
    this.logico,
    this.ubicacionGPS,
    this.imagen,
    this.modeloForaneo,
  });

  int id;
  String denomModelo;
  String descModelo;
  DateTime fecha;
  TimeOfDay hora;
  int entero;
  int enteroGrande;
  int enteroPequeyo;
  double decimal;
  double moneda;
  bool logico;
  String ubicacionGPS;
  String imagen;
  ModeloForaneo modeloForaneo;

  fromKeyValue(String key, Map value) {
    this.id = value[MODELOSCAMPOS.ID];
    this.denomModelo = value[MODELOSCAMPOS.DENOMMODELO];
    this.descModelo = value[MODELOSCAMPOS.DESCMODELO];
    this.fecha = new DateTime.fromMillisecondsSinceEpoch(value[MODELOSCAMPOS.FECHA]);
    this.hora = new TimeOfDay.fromDateTime(new DateTime.fromMillisecondsSinceEpoch(value[MODELOSCAMPOS.HORA]));
    this.entero = value[MODELOSCAMPOS.ENTERO];
    this.enteroGrande = value[MODELOSCAMPOS.ENTEROGRANDE];
    this.enteroPequeyo = value[MODELOSCAMPOS.ENTEROPEQUEYO];
    this.decimal = double.parse(value[MODELOSCAMPOS.DECIMAL].toString());
    this.moneda = double.parse(value[MODELOSCAMPOS.MONEDA].toString());
    this.logico = value[MODELOSCAMPOS.LOGICO];
    this.ubicacionGPS = value[MODELOSCAMPOS.UBICACIONGPS];
    this.imagen = value[MODELOSCAMPOS.IMAGEN];
    this.modeloForaneo.fromKeyValue(key, value[MODELOSCAMPOS.MODELOFORANEO]);
  }

  toJson() {
    return {
      MODELOSCAMPOS.ID: this.id,
      MODELOSCAMPOS.DENOMMODELO: this.denomModelo,
      MODELOSCAMPOS.DESCMODELO: this.descModelo,
      MODELOSCAMPOS.FECHA: this.fecha == null ? null : this.fecha.millisecondsSinceEpoch,
      MODELOSCAMPOS.HORA: this.hora == null ? null : (this.hora.hour * 60 * 60 * 1000) +
          (this.hora.minute * 60 * 1000) ,
      MODELOSCAMPOS.ENTERO: this.entero,
      MODELOSCAMPOS.ENTEROGRANDE: this.enteroGrande,
      MODELOSCAMPOS.ENTEROPEQUEYO: this.enteroPequeyo,
      MODELOSCAMPOS.DECIMAL: this.decimal,
      MODELOSCAMPOS.MONEDA: this.moneda,
      MODELOSCAMPOS.LOGICO: this.logico,
      MODELOSCAMPOS.UBICACIONGPS: this.ubicacionGPS,
      MODELOSCAMPOS.IMAGEN: this.imagen,
      MODELOSCAMPOS.MODELOFORANEO: this.modeloForaneo.toJson(),
    };
  }

  assign(ModeloCampo modeloCampo) {

    if (modeloCampo == null) {
      this.id = null; //0;
      this.denomModelo = null; //'';
      this.descModelo = null; //'';
      this.fecha = null; //DateTime.now();
      this.hora = null; //DateTime.now();
      this.entero = null; //0;
      this.enteroGrande = null; //0;
      this.enteroPequeyo = null; //0;
      this.decimal = null; //0.00;
      this.moneda = null; //0.00;
      this.logico = null; //false;
      this.ubicacionGPS = null; //'';
      this.imagen = null; //'';
      this.modeloForaneo = null; //new ModeloForaneo();
    } else {
      this.id = modeloCampo.id;
      this.denomModelo = modeloCampo.denomModelo;
      this.descModelo = modeloCampo.descModelo;
      this.fecha = modeloCampo.fecha;
      this.hora = modeloCampo.hora;
      this.entero = modeloCampo.entero;
      this.enteroGrande = modeloCampo.enteroGrande;
      this.enteroPequeyo = modeloCampo.enteroPequeyo;
      this.decimal = modeloCampo.decimal;
      this.moneda = modeloCampo.moneda;
      this.logico = modeloCampo.logico;
      this.ubicacionGPS = modeloCampo.ubicacionGPS;
      this.imagen = modeloCampo.imagen;

      if (modeloCampo.modeloForaneo != null) {
        if (this.modeloForaneo == null) {
          this.modeloForaneo = ModeloForaneo();
        }
        this.modeloForaneo.assign(modeloCampo.modeloForaneo);
      } else {
        this.modeloForaneo = null;
      }

    }
  }

  Map toMap() {
    Map map = {
      MODELOSCAMPOS.ID: this.id,
      MODELOSCAMPOS.DENOMMODELO: this.denomModelo,
      MODELOSCAMPOS.DESCMODELO: this.descModelo,
      MODELOSCAMPOS.FECHA: this.fecha == null ? null : this.fecha.millisecondsSinceEpoch,
      MODELOSCAMPOS.HORA: this.hora == null ? null : (this.hora.hour * 60 * 60 * 1000) +
          (this.hora.minute * 60 * 1000) ,
      MODELOSCAMPOS.ENTERO: this.entero,
      MODELOSCAMPOS.ENTEROGRANDE: this.enteroGrande,
      MODELOSCAMPOS.ENTEROPEQUEYO: this.enteroPequeyo,
      MODELOSCAMPOS.DECIMAL: this.decimal,
      MODELOSCAMPOS.MONEDA: this.moneda,
      MODELOSCAMPOS.LOGICO: this.logico,
      MODELOSCAMPOS.UBICACIONGPS: this.ubicacionGPS,
      MODELOSCAMPOS.IMAGEN: this.imagen,
      MODELOSCAMPOS.MODELOFORANEO: this.modeloForaneo == null ? null : this.modeloForaneo.toMap(),
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.id = map[MODELOSCAMPOS.ID];
    this.denomModelo = map[MODELOSCAMPOS.DENOMMODELO];
    this.descModelo = map[MODELOSCAMPOS.DESCMODELO];
    this.fecha = map[MODELOSCAMPOS.FECHA];
    this.hora = map[MODELOSCAMPOS.HORA];
    this.entero = map[MODELOSCAMPOS.ENTERO];
    this.enteroGrande = map[MODELOSCAMPOS.ENTEROGRANDE];
    this.enteroPequeyo = map[MODELOSCAMPOS.ENTEROPEQUEYO];
    this.decimal = map[MODELOSCAMPOS.DECIMAL];
    this.moneda = map[MODELOSCAMPOS.MONEDA];
    this.logico = map[MODELOSCAMPOS.LOGICO];
    this.ubicacionGPS = map[MODELOSCAMPOS.UBICACIONGPS];
    this.imagen = map[MODELOSCAMPOS.IMAGEN];
    if (map[MODELOSCAMPOS.MODELOFORANEO] != null) {
      if (this.modeloForaneo == null) {
        this.modeloForaneo = ModeloForaneo();
      }
      this.modeloForaneo.fromMap(map[MODELOSCAMPOS.MODELOFORANEO]);
    } else {
      this.modeloForaneo = null;
    }
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final ModeloCampo typedOther = other;
    return
        id == typedOther.id &&
        denomModelo == typedOther.denomModelo &&
        descModelo == typedOther.descModelo &&
        fecha == typedOther.fecha &&
        hora == typedOther.hora &&
        entero == typedOther.entero &&
        enteroGrande == typedOther.enteroGrande &&
        enteroPequeyo == typedOther.enteroPequeyo &&
        decimal == typedOther.decimal &&
        moneda == typedOther.moneda &&
        logico == typedOther.logico &&
        ubicacionGPS == typedOther.ubicacionGPS &&
        imagen == typedOther.imagen &&
        modeloForaneo == typedOther.modeloForaneo;
  }


  @override
  int get hashCode => hashObjects([
      id.hashCode,
      denomModelo.hashCode,
      descModelo.hashCode,
      fecha.hashCode,
      hora.hashCode,
      entero.hashCode,
      enteroGrande.hashCode,
      enteroPequeyo.hashCode,
      decimal.hashCode,
      moneda.hashCode,
      logico.hashCode,
      ubicacionGPS.hashCode,
      imagen.hashCode,
      modeloForaneo.hashCode 
  ]);

}

//==============================================================================
class MODELOSCAMPOS {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Modelos Campos';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Modelo Campo';

  // Etiquetas de los Atributos
  static const String ETIQUETA_ID = 'Id';
  static const String ETIQUETA_DENOMMODELO = 'Denominación del Modelo';
  static const String ETIQUETA_DESCMODELO = 'Descripción del Modelo';
  static const String ETIQUETA_FECHA = 'Fecha';
  static const String ETIQUETA_HORA = 'Hora';
  static const String ETIQUETA_ENTERO = 'Entero';
  static const String ETIQUETA_ENTEROGRANDE = 'Entero Grande';
  static const String ETIQUETA_ENTEROPEQUEYO = 'Entero Pequeño';
  static const String ETIQUETA_DECIMAL = 'Decimal';
  static const String ETIQUETA_MONEDA = 'Moneda';
  static const String ETIQUETA_LOGICO = 'Lógico';
  static const String ETIQUETA_UBICACIONGPS = 'Ubicación GPS';
  static const String ETIQUETA_IMAGEN = 'Imagen';
  static const String ETIQUETA_MODELOFORANEO = 'Modelo Foraneo';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'ModelosCampos';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'ModeloCampo';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String ID = 'id';
  static const String DENOMMODELO = 'denomModelo';
  static const String DESCMODELO = 'descModelo';
  static const String FECHA = 'fecha';
  static const String HORA = 'hora';
  static const String ENTERO = 'entero';
  static const String ENTEROGRANDE = 'enteroGrande';
  static const String ENTEROPEQUEYO = 'enteroPequeyo';
  static const String DECIMAL = 'decimal';
  static const String MONEDA = 'moneda';
  static const String LOGICO = 'logico';
  static const String UBICACIONGPS = 'ubicacionGPS';
  static const String IMAGEN = 'imagen';
  static const String MODELOFORANEO = 'modeloForaneo';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [ID,DENOMMODELO,FECHA,HORA,ENTERO,LOGICO,MODELOFORANEO,];
  static const List CAMPOS_DETALLE = [ID,DENOMMODELO,DESCMODELO,FECHA,HORA,ENTERO,ENTEROGRANDE,ENTEROPEQUEYO,DECIMAL,MONEDA,LOGICO,UBICACIONGPS,IMAGEN,MODELOFORANEO,];

}
