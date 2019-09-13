/*
 Proyecto: Qubi Smart Locks
 Version: 0.0.2
 Autor: Abner Hernández
 Unidad: segun-modelo.dart
    String campoSegunModelo(Object e, String campo)
     => Dado un objeto, y un campo, retorna el valor del campo en tipo String
    Map<String, dinamic> mapaSegunModelo(Object e)
     => Dado un objeto, retorna el toMap() de la instancia

*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


String campoSegunModelo(Object e, String campo) {
  String tipo = e.runtimeType.toString();
  switch (tipo) {

//  Base de Datos: Qubi Smart Locks    =>  123
//  -------------

    case 'Cerradura':
      return (e as Cerradura).toMap()[campo].toString();
      break;
    case 'Cliente':
      return (e as Cliente).toMap()[campo].toString();
      break;
    case 'Edificacion':
      return (e as Edificacion).toMap()[campo].toString();
      break;
    case 'EstadoCerradura':
      return (e as EstadoCerradura).toMap()[campo].toString();
      break;
    case 'EstadoReservacion':
      return (e as EstadoReservacion).toMap()[campo].toString();
      break;
    case 'HistoricoCerradura':
      return (e as HistoricoCerradura).toMap()[campo].toString();
      break;
    case 'LogCerradura':
      return (e as LogCerradura).toMap()[campo].toString();
      break;
    case 'MarcaCerradura':
      return (e as MarcaCerradura).toMap()[campo].toString();
      break;
    case 'ModeloCerradura':
      return (e as ModeloCerradura).toMap()[campo].toString();
      break;
    case 'OrigenPaquete':
      return (e as OrigenPaquete).toMap()[campo].toString();
      break;
    case 'Paquete':
      return (e as Paquete).toMap()[campo].toString();
      break;
    case 'Pasajero':
      return (e as Pasajero).toMap()[campo].toString();
      break;
    case 'Propietario':
      return (e as Propietario).toMap()[campo].toString();
      break;
    case 'Reservacion':
      return (e as Reservacion).toMap()[campo].toString();
      break;
    case 'TipoEdificacion':
      return (e as TipoEdificacion).toMap()[campo].toString();
      break;
    case 'TipoIdent':
      return (e as TipoIdent).toMap()[campo].toString();
      break;
    case 'TipoUnidadFuncional':
      return (e as TipoUnidadFuncional).toMap()[campo].toString();
      break;
    case 'UnidadFuncional':
      return (e as UnidadFuncional).toMap()[campo].toString();
      break;
    case 'ZonaEdificacion':
      return (e as ZonaEdificacion).toMap()[campo].toString();
      break;

//  Sub-Proyecto: Seguridad    =>  120
//  ============


//  Base de Datos: Seguridad    =>  120
//  -------------

    case 'NivelUsuario':
      return (e as NivelUsuario).toMap()[campo].toString();
      break;
    case 'Usuario':
      return (e as Usuario).toMap()[campo].toString();
      break;

//  Sub-Proyecto: Modelos de Campos    =>  125
//  ============


//  Base de Datos: Modelos de Campos    =>  125
//  -------------

    case 'ModeloCampo':
      return (e as ModeloCampo).toMap()[campo].toString();
      break;
    case 'ModeloForaneo':
      return (e as ModeloForaneo).toMap()[campo].toString();
      break;

//  Sub-Proyecto: Clock PMS (Api Reservaciones)    =>  127
//  ============


//  Base de Datos: Clock PMS (Api Reservaciones)    =>  127
//  -------------

    case 'Booking':
      return (e as Booking).toMap()[campo].toString();
      break;
    case 'RoomRate':
      return (e as RoomRate).toMap()[campo].toString();
      break;
    case 'RoomType':
      return (e as RoomType).toMap()[campo].toString();
      break;
    case 'Room':
      return (e as Room).toMap()[campo].toString();
      break;

//  Sub-Proyecto: Mensajería (Chats)    =>  126
//  ============


//  Base de Datos: Mensajería (Chats)    =>  126
//  -------------

    case 'Conversacion':
      return (e as Conversacion).toMap()[campo].toString();
      break;
    case 'Mensaje':
      return (e as Mensaje).toMap()[campo].toString();
      break;
    case 'MensajeAutomatico':
      return (e as MensajeAutomatico).toMap()[campo].toString();
      break;
    case 'OpcionMensajeria':
      return (e as OpcionMensajeria).toMap()[campo].toString();
      break;
    case 'Participante':
      return (e as Participante).toMap()[campo].toString();
      break;

    default:
      return '*** desconocido ***';
      break;
  }
}

Map<String, dynamic> mapaSegunModelo(Object e) {
  String tipo = e.runtimeType.toString();
  switch (tipo) {

//  Base de Datos: Qubi Smart Locks    =>  123
//  -------------

    case 'Cerradura':
      return (e as Cerradura).toMap();
      break;
    case 'Cliente':
      return (e as Cliente).toMap();
      break;
    case 'Edificacion':
      return (e as Edificacion).toMap();
      break;
    case 'EstadoCerradura':
      return (e as EstadoCerradura).toMap();
      break;
    case 'EstadoReservacion':
      return (e as EstadoReservacion).toMap();
      break;
    case 'HistoricoCerradura':
      return (e as HistoricoCerradura).toMap();
      break;
    case 'LogCerradura':
      return (e as LogCerradura).toMap();
      break;
    case 'MarcaCerradura':
      return (e as MarcaCerradura).toMap();
      break;
    case 'ModeloCerradura':
      return (e as ModeloCerradura).toMap();
      break;
    case 'OrigenPaquete':
      return (e as OrigenPaquete).toMap();
      break;
    case 'Paquete':
      return (e as Paquete).toMap();
      break;
    case 'Pasajero':
      return (e as Pasajero).toMap();
      break;
    case 'Propietario':
      return (e as Propietario).toMap();
      break;
    case 'Reservacion':
      return (e as Reservacion).toMap();
      break;
    case 'TipoEdificacion':
      return (e as TipoEdificacion).toMap();
      break;
    case 'TipoIdent':
      return (e as TipoIdent).toMap();
      break;
    case 'TipoUnidadFuncional':
      return (e as TipoUnidadFuncional).toMap();
      break;
    case 'UnidadFuncional':
      return (e as UnidadFuncional).toMap();
      break;
    case 'ZonaEdificacion':
      return (e as ZonaEdificacion).toMap();
      break;

//  Sub-Proyecto: Seguridad    =>  120
//  ============


//  Base de Datos: Seguridad    =>  120
//  -------------

    case 'NivelUsuario':
      return (e as NivelUsuario).toMap();
      break;
    case 'Usuario':
      return (e as Usuario).toMap();
      break;

//  Sub-Proyecto: Modelos de Campos    =>  125
//  ============


//  Base de Datos: Modelos de Campos    =>  125
//  -------------

    case 'ModeloCampo':
      return (e as ModeloCampo).toMap();
      break;
    case 'ModeloForaneo':
      return (e as ModeloForaneo).toMap();
      break;

//  Sub-Proyecto: Clock PMS (Api Reservaciones)    =>  127
//  ============


//  Base de Datos: Clock PMS (Api Reservaciones)    =>  127
//  -------------

    case 'Booking':
      return (e as Booking).toMap();
      break;
    case 'RoomRate':
      return (e as RoomRate).toMap();
      break;
    case 'RoomType':
      return (e as RoomType).toMap();
      break;
    case 'Room':
      return (e as Room).toMap();
      break;

//  Sub-Proyecto: Mensajería (Chats)    =>  126
//  ============


//  Base de Datos: Mensajería (Chats)    =>  126
//  -------------

    case 'Conversacion':
      return (e as Conversacion).toMap();
      break;
    case 'Mensaje':
      return (e as Mensaje).toMap();
      break;
    case 'MensajeAutomatico':
      return (e as MensajeAutomatico).toMap();
      break;
    case 'OpcionMensajeria':
      return (e as OpcionMensajeria).toMap();
      break;
    case 'Participante':
      return (e as Participante).toMap();
      break;

    default:
      return {};
      break;
  }
}


List<DataColumCellFieldBase> columnasSegunModelo(Object e) {
  String tipo = e.runtimeType.toString();
  switch (tipo) {

//  Base de Datos: Qubi Smart Locks    =>  123
//  -------------

//    case 'Cerradura':
//      return  (e as TipoEdificacion).columnsFrom(e as TipoEdificacion);
//      break;
//    case 'Cliente':
//      return (e as Cliente).toMap();
//      break;
//    case 'Edificacion':
//      return (e as Edificacion).toMap();
//      break;
//    case 'EstadoCerradura':
//      return (e as EstadoCerradura).toMap();
//      break;
//    case 'EstadoReservacion':
//      return (e as EstadoReservacion).toMap();
//      break;
//    case 'HistoricoCerradura':
//      return (e as HistoricoCerradura).toMap();
//      break;
//    case 'LogCerradura':
//      return (e as LogCerradura).toMap();
//      break;
//    case 'MarcaCerradura':
//      return (e as MarcaCerradura).toMap();
//      break;
//    case 'ModeloCerradura':
//      return (e as ModeloCerradura).toMap();
//      break;
//    case 'OrigenPaquete':
//      return (e as OrigenPaquete).toMap();
//      break;
//    case 'Paquete':
//      return (e as Paquete).toMap();
//      break;
//    case 'Pasajero':
//      return (e as Pasajero).toMap();
//      break;
//    case 'Propietario':
//      return (e as Propietario).toMap();
//      break;
//    case 'Reservacion':
//      return (e as Reservacion).toMap();
//      break;
//    case 'TipoEdificacion':
//      return  (e as TipoEdificacion).columnsFrom(e as TipoEdificacion);
//      break;
//    case 'TipoIdent':
//      return (e as TipoIdent).toMap();
//      break;
//    case 'TipoUnidadFuncional':
//      return (e as TipoUnidadFuncional).toMap();
//      break;
//    case 'UnidadFuncional':
//      return (e as UnidadFuncional).toMap();
//      break;
//    case 'ZonaEdificacion':
//      return (e as ZonaEdificacion).toMap();
//      break;
//
////  Sub-Proyecto: Seguridad    =>  120
////  ============
//
//
////  Base de Datos: Seguridad    =>  120
////  -------------
//
//    case 'NivelUsuario':
//      return (e as NivelUsuario).toMap();
//      break;
//    case 'Usuario':
//      return (e as Usuario).toMap();
//      break;
//
////  Sub-Proyecto: Modelos de Campos    =>  125
////  ============
//
//
////  Base de Datos: Modelos de Campos    =>  125
////  -------------
//
//    case 'ModeloCampo':
//      return (e as ModeloCampo).toMap();
//      break;
//    case 'ModeloForaneo':
//      return (e as ModeloForaneo).toMap();
//      break;
//
////  Sub-Proyecto: Clock PMS (Api Reservaciones)    =>  127
////  ============
//
//
////  Base de Datos: Clock PMS (Api Reservaciones)    =>  127
////  -------------
//
//    case 'Booking':
//      return (e as Booking).toMap();
//      break;
//    case 'RoomRate':
//      return (e as RoomRate).toMap();
//      break;
//    case 'RoomType':
//      return (e as RoomType).toMap();
//      break;
//    case 'Room':
//      return (e as Room).toMap();
//      break;
//
////  Sub-Proyecto: Mensajería (Chats)    =>  126
////  ============
//
//
////  Base de Datos: Mensajería (Chats)    =>  126
////  -------------
//
//    case 'Conversacion':
//      return (e as Conversacion).toMap();
//      break;
//    case 'Mensaje':
//      return (e as Mensaje).toMap();
//      break;
//    case 'MensajeAutomatico':
//      return (e as MensajeAutomatico).toMap();
//      break;
//    case 'OpcionMensajeria':
//      return (e as OpcionMensajeria).toMap();
//      break;
//    case 'Participante':
//      return (e as Participante).toMap();
//      break;

    default:
      return [];
      break;
  }
}



