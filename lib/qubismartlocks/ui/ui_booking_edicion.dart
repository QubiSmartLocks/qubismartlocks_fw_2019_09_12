// Proyecto: Qubi Smart Locks
// Version: 2019.09.12
// Autor: Abner Hernández
// Unidad: Edicion de Bookings
// Edicion para [//Bookings]

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIBookingEdicion extends StatefulWidget {
  UIBookingEdicion({Key key, this.registro}) : super(key: key);

  final Booking registro;

  @override
  _EstadoBookingEdicion createState() =>
      _EstadoBookingEdicion();
}

class _EstadoBookingEdicion extends State<UIBookingEdicion> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _forma = GlobalKey<FormState>();

  bool _autovalidar = false;
  bool _formaEditada = false;

  void _guardar() async {
    final FormState forma = _forma.currentState;
    if (!forma.validate()) {
      _autovalidar = true; // Iniciar validación en cada cambio
      mensaje(_scaffoldKey.currentState, Co.MENSAJE_CORREGIR_ERRORES);
    } else {
      forma.save();

      // Asignar los datos del mapa en Edición en la Sesión
      // al registro de Bookings en el widget
      widget.registro.fromMap(DEM.mapaBooking);

      // Guardar Bookings
      Resultado _resultado =
          await Bookings.guardar(widget.registro);
      Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
    }
  }

  void _borrar() async {
    // Borrar Bookings
      Resultado _resultado =
          await Bookings.borrar(widget.registro);
    Navigator.of(_scaffoldKey.currentContext).pop(_resultado);
  }

  String _validarnumber(String value) {
    _formaEditada = true;
    if (value.isEmpty)
      return campoObligatorio(BOOKINGS.ETIQUETA_NUMBER);
    widget.registro.number = value;
    return null;
  }

  String _validararrival_room_type_id(int value) {
    _formaEditada = true;
    widget.registro.arrival_room_type_id = value;
    return null;
  }

  String _validaris_guaranteed(bool value) {
    _formaEditada = true;
    widget.registro.is_guaranteed = value;
    return null;
  }

  String _validaruser_created_id(int value) {
    _formaEditada = true;
    widget.registro.user_created_id = value;
    return null;
  }

  String _validaruser_updated_id(int value) {
    _formaEditada = true;
    widget.registro.user_updated_id = value;
    return null;
  }

  String _validarstatus(String value) {
    _formaEditada = true;
    if (value.isEmpty)
      return campoObligatorio(BOOKINGS.ETIQUETA_STATUS);
    widget.registro.status = value;
    return null;
  }

  String _validarcreated_at(DateTime value) {
    _formaEditada = true;
    widget.registro.created_at = value;
    return null;
  }

  String _validarupdated_at(DateTime value) {
    _formaEditada = true;
    widget.registro.updated_at = value;
    return null;
  }

  String _validaraccept_charge_transfers(bool value) {
    _formaEditada = true;
    widget.registro.accept_charge_transfers = value;
    return null;
  }

  String _validarregistration_cards_count(int value) {
    _formaEditada = true;
    widget.registro.registration_cards_count = value;
    return null;
  }

  String _validarconfirmation_logs_count(int value) {
    _formaEditada = true;
    widget.registro.confirmation_logs_count = value;
    return null;
  }



  @override
  Widget build(BuildContext context) {
    DEM.mapaBooking = widget.registro.toMap();

    return Container(
    width: CD.ancho *.5,
        height: CD.alto * .5,
        child: Form(
          key: _forma,
          autovalidate: _autovalidar,
          onWillPop: () async {
            return await advertirDatosInvalidos(
                context, _forma.currentState, _formaEditada);
          },
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: <Widget>[
// Campo: number. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.NUMBER,
              denominacion: BOOKINGS.ETIQUETA_NUMBER,
              etiqueta: BOOKINGS.ETIQUETA_NUMBER,
              componente: 'BDEdicion',
              longitud: 255,
              decimales: 0,

              validatorTexto: _validarnumber,

            ),
// Campo: arrival. Tipo de Componente: BDEdicionFecha
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.ARRIVAL,
              denominacion: BOOKINGS.ETIQUETA_ARRIVAL,
              etiqueta: BOOKINGS.ETIQUETA_ARRIVAL,
              componente: 'BDEdicionFecha',
              longitud: 0,
              decimales: 0,


            ),
// Campo: departure. Tipo de Componente: BDEdicionFecha
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.DEPARTURE,
              denominacion: BOOKINGS.ETIQUETA_DEPARTURE,
              etiqueta: BOOKINGS.ETIQUETA_DEPARTURE,
              componente: 'BDEdicionFecha',
              longitud: 0,
              decimales: 0,


            ),
// Campo: arrival_room_type_id. Tipo de Componente: BDEdicionNumero
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.ARRIVAL_ROOM_TYPE_ID,
              denominacion: BOOKINGS.ETIQUETA_ARRIVAL_ROOM_TYPE_ID,
              etiqueta: BOOKINGS.ETIQUETA_ARRIVAL_ROOM_TYPE_ID,
              componente: 'BDEdicionNumero',
              longitud: 0,
              decimales: 0,


            ),
// Campo: arrival_room_id. Tipo de Componente: BDEdicionNumero
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.ARRIVAL_ROOM_ID,
              denominacion: BOOKINGS.ETIQUETA_ARRIVAL_ROOM_ID,
              etiqueta: BOOKINGS.ETIQUETA_ARRIVAL_ROOM_ID,
              componente: 'BDEdicionNumero',
              longitud: 0,
              decimales: 0,


            ),
// Campo: adults. Tipo de Componente: BDEdicionNumero
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.ADULTS,
              denominacion: BOOKINGS.ETIQUETA_ADULTS,
              etiqueta: BOOKINGS.ETIQUETA_ADULTS,
              componente: 'BDEdicionNumero',
              longitud: 0,
              decimales: 0,


            ),
// Campo: children. Tipo de Componente: BDEdicionNumero
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.CHILDREN,
              denominacion: BOOKINGS.ETIQUETA_CHILDREN,
              etiqueta: BOOKINGS.ETIQUETA_CHILDREN,
              componente: 'BDEdicionNumero',
              longitud: 0,
              decimales: 0,


            ),
// Campo: reference_number. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.REFERENCE_NUMBER,
              denominacion: BOOKINGS.ETIQUETA_REFERENCE_NUMBER,
              etiqueta: BOOKINGS.ETIQUETA_REFERENCE_NUMBER,
              componente: 'BDEdicion',
              longitud: 255,
              decimales: 0,


            ),
// Campo: reference_date. Tipo de Componente: BDEdicionFecha
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.REFERENCE_DATE,
              denominacion: BOOKINGS.ETIQUETA_REFERENCE_DATE,
              etiqueta: BOOKINGS.ETIQUETA_REFERENCE_DATE,
              componente: 'BDEdicionFecha',
              longitud: 0,
              decimales: 0,


            ),
// Campo: is_guaranteed. Tipo de Componente: BDChequeo
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.IS_GUARANTEED,
              denominacion: BOOKINGS.ETIQUETA_IS_GUARANTEED,
              etiqueta: BOOKINGS.ETIQUETA_IS_GUARANTEED,
              componente: 'BDChequeo',
              longitud: 0,
              decimales: 0,


            ),
// Campo: rate_id. Tipo de Componente: BDEdicionNumero
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.RATE_ID,
              denominacion: BOOKINGS.ETIQUETA_RATE_ID,
              etiqueta: BOOKINGS.ETIQUETA_RATE_ID,
              componente: 'BDEdicionNumero',
              longitud: 0,
              decimales: 0,


            ),
// Campo: source_of_business_company_id. Tipo de Componente: BDEdicionNumero
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.SOURCE_OF_BUSINESS_COMPANY_ID,
              denominacion: BOOKINGS.ETIQUETA_SOURCE_OF_BUSINESS_COMPANY_ID,
              etiqueta: BOOKINGS.ETIQUETA_SOURCE_OF_BUSINESS_COMPANY_ID,
              componente: 'BDEdicionNumero',
              longitud: 0,
              decimales: 0,


            ),
// Campo: event_id. Tipo de Componente: BDEdicionNumero
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.EVENT_ID,
              denominacion: BOOKINGS.ETIQUETA_EVENT_ID,
              etiqueta: BOOKINGS.ETIQUETA_EVENT_ID,
              componente: 'BDEdicionNumero',
              longitud: 0,
              decimales: 0,


            ),
// Campo: block_id. Tipo de Componente: BDEdicionNumero
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.BLOCK_ID,
              denominacion: BOOKINGS.ETIQUETA_BLOCK_ID,
              etiqueta: BOOKINGS.ETIQUETA_BLOCK_ID,
              componente: 'BDEdicionNumero',
              longitud: 0,
              decimales: 0,


            ),
// Campo: status_changed_at. Tipo de Componente: BDEdicionFecha
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.STATUS_CHANGED_AT,
              denominacion: BOOKINGS.ETIQUETA_STATUS_CHANGED_AT,
              etiqueta: BOOKINGS.ETIQUETA_STATUS_CHANGED_AT,
              componente: 'BDEdicionFecha',
              longitud: 0,
              decimales: 0,


            ),
// Campo: user_created_id. Tipo de Componente: BDEdicionNumero
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.USER_CREATED_ID,
              denominacion: BOOKINGS.ETIQUETA_USER_CREATED_ID,
              etiqueta: BOOKINGS.ETIQUETA_USER_CREATED_ID,
              componente: 'BDEdicionNumero',
              longitud: 0,
              decimales: 0,


            ),
// Campo: user_updated_id. Tipo de Componente: BDEdicionNumero
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.USER_UPDATED_ID,
              denominacion: BOOKINGS.ETIQUETA_USER_UPDATED_ID,
              etiqueta: BOOKINGS.ETIQUETA_USER_UPDATED_ID,
              componente: 'BDEdicionNumero',
              longitud: 0,
              decimales: 0,


            ),
// Campo: status. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.STATUS,
              denominacion: BOOKINGS.ETIQUETA_STATUS,
              etiqueta: BOOKINGS.ETIQUETA_STATUS,
              componente: 'BDEdicion',
              longitud: 255,
              decimales: 0,

              validatorTexto: _validarstatus,

            ),
// Campo: created_at. Tipo de Componente: BDEdicionFecha
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.CREATED_AT,
              denominacion: BOOKINGS.ETIQUETA_CREATED_AT,
              etiqueta: BOOKINGS.ETIQUETA_CREATED_AT,
              componente: 'BDEdicionFecha',
              longitud: 0,
              decimales: 0,


            ),
// Campo: updated_at. Tipo de Componente: BDEdicionFecha
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.UPDATED_AT,
              denominacion: BOOKINGS.ETIQUETA_UPDATED_AT,
              etiqueta: BOOKINGS.ETIQUETA_UPDATED_AT,
              componente: 'BDEdicionFecha',
              longitud: 0,
              decimales: 0,


            ),
// Campo: marketing_source. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.MARKETING_SOURCE,
              denominacion: BOOKINGS.ETIQUETA_MARKETING_SOURCE,
              etiqueta: BOOKINGS.ETIQUETA_MARKETING_SOURCE,
              componente: 'BDEdicion',
              longitud: 255,
              decimales: 0,


            ),
// Campo: marketing_channel. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.MARKETING_CHANNEL,
              denominacion: BOOKINGS.ETIQUETA_MARKETING_CHANNEL,
              etiqueta: BOOKINGS.ETIQUETA_MARKETING_CHANNEL,
              componente: 'BDEdicion',
              longitud: 255,
              decimales: 0,


            ),
// Campo: accept_charge_transfers. Tipo de Componente: BDChequeo
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.ACCEPT_CHARGE_TRANSFERS,
              denominacion: BOOKINGS.ETIQUETA_ACCEPT_CHARGE_TRANSFERS,
              etiqueta: BOOKINGS.ETIQUETA_ACCEPT_CHARGE_TRANSFERS,
              componente: 'BDChequeo',
              longitud: 0,
              decimales: 0,


            ),
// Campo: guarantee_policy_id. Tipo de Componente: BDEdicionNumero
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.GUARANTEE_POLICY_ID,
              denominacion: BOOKINGS.ETIQUETA_GUARANTEE_POLICY_ID,
              etiqueta: BOOKINGS.ETIQUETA_GUARANTEE_POLICY_ID,
              componente: 'BDEdicionNumero',
              longitud: 0,
              decimales: 0,


            ),
// Campo: arrival_time. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.ARRIVAL_TIME,
              denominacion: BOOKINGS.ETIQUETA_ARRIVAL_TIME,
              etiqueta: BOOKINGS.ETIQUETA_ARRIVAL_TIME,
              componente: 'BDEdicion',
              longitud: 255,
              decimales: 0,


            ),
// Campo: transfer_arrival. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.TRANSFER_ARRIVAL,
              denominacion: BOOKINGS.ETIQUETA_TRANSFER_ARRIVAL,
              etiqueta: BOOKINGS.ETIQUETA_TRANSFER_ARRIVAL,
              componente: 'BDEdicion',
              longitud: 255,
              decimales: 0,


            ),
// Campo: transfer_departure. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.TRANSFER_DEPARTURE,
              denominacion: BOOKINGS.ETIQUETA_TRANSFER_DEPARTURE,
              etiqueta: BOOKINGS.ETIQUETA_TRANSFER_DEPARTURE,
              componente: 'BDEdicion',
              longitud: 255,
              decimales: 0,


            ),
// Campo: departure_time. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.DEPARTURE_TIME,
              denominacion: BOOKINGS.ETIQUETA_DEPARTURE_TIME,
              etiqueta: BOOKINGS.ETIQUETA_DEPARTURE_TIME,
              componente: 'BDEdicion',
              longitud: 255,
              decimales: 0,


            ),
// Campo: first_meal_id. Tipo de Componente: BDEdicionNumero
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.FIRST_MEAL_ID,
              denominacion: BOOKINGS.ETIQUETA_FIRST_MEAL_ID,
              etiqueta: BOOKINGS.ETIQUETA_FIRST_MEAL_ID,
              componente: 'BDEdicionNumero',
              longitud: 0,
              decimales: 0,


            ),
// Campo: eating_object_id. Tipo de Componente: BDEdicionNumero
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.EATING_OBJECT_ID,
              denominacion: BOOKINGS.ETIQUETA_EATING_OBJECT_ID,
              etiqueta: BOOKINGS.ETIQUETA_EATING_OBJECT_ID,
              componente: 'BDEdicionNumero',
              longitud: 0,
              decimales: 0,


            ),
// Campo: registration_cards_count. Tipo de Componente: BDEdicionNumero
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.REGISTRATION_CARDS_COUNT,
              denominacion: BOOKINGS.ETIQUETA_REGISTRATION_CARDS_COUNT,
              etiqueta: BOOKINGS.ETIQUETA_REGISTRATION_CARDS_COUNT,
              componente: 'BDEdicionNumero',
              longitud: 0,
              decimales: 0,


            ),
// Campo: confirmation_logs_count. Tipo de Componente: BDEdicionNumero
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.CONFIRMATION_LOGS_COUNT,
              denominacion: BOOKINGS.ETIQUETA_CONFIRMATION_LOGS_COUNT,
              etiqueta: BOOKINGS.ETIQUETA_CONFIRMATION_LOGS_COUNT,
              componente: 'BDEdicionNumero',
              longitud: 0,
              decimales: 0,


            ),
// Campo: self_service_key. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.SELF_SERVICE_KEY,
              denominacion: BOOKINGS.ETIQUETA_SELF_SERVICE_KEY,
              etiqueta: BOOKINGS.ETIQUETA_SELF_SERVICE_KEY,
              componente: 'BDEdicion',
              longitud: 255,
              decimales: 0,


            ),
// Campo: self_service_pin. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.SELF_SERVICE_PIN,
              denominacion: BOOKINGS.ETIQUETA_SELF_SERVICE_PIN,
              etiqueta: BOOKINGS.ETIQUETA_SELF_SERVICE_PIN,
              componente: 'BDEdicion',
              longitud: 255,
              decimales: 0,


            ),
// Campo: source_id. Tipo de Componente: BDEdicionNumero
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.SOURCE_ID,
              denominacion: BOOKINGS.ETIQUETA_SOURCE_ID,
              etiqueta: BOOKINGS.ETIQUETA_SOURCE_ID,
              componente: 'BDEdicionNumero',
              longitud: 0,
              decimales: 0,


            ),
// Campo: cancel_source_id. Tipo de Componente: BDEdicionNumero
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.CANCEL_SOURCE_ID,
              denominacion: BOOKINGS.ETIQUETA_CANCEL_SOURCE_ID,
              etiqueta: BOOKINGS.ETIQUETA_CANCEL_SOURCE_ID,
              componente: 'BDEdicionNumero',
              longitud: 0,
              decimales: 0,


            ),
// Campo: links. Tipo de Componente: BDMemo
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.LINKS,
              denominacion: BOOKINGS.ETIQUETA_LINKS,
              etiqueta: BOOKINGS.ETIQUETA_LINKS,
              componente: 'BDMemo',
              longitud: 4096,
              decimales: 0,


            ),
// Campo: housekeeping_note. Tipo de Componente: BDMemo
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.HOUSEKEEPING_NOTE,
              denominacion: BOOKINGS.ETIQUETA_HOUSEKEEPING_NOTE,
              etiqueta: BOOKINGS.ETIQUETA_HOUSEKEEPING_NOTE,
              componente: 'BDMemo',
              longitud: 4096,
              decimales: 0,


            ),
// Campo: commission_value_cents. Tipo de Componente: BDEdicionNumero
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.COMMISSION_VALUE_CENTS,
              denominacion: BOOKINGS.ETIQUETA_COMMISSION_VALUE_CENTS,
              etiqueta: BOOKINGS.ETIQUETA_COMMISSION_VALUE_CENTS,
              componente: 'BDEdicionNumero',
              longitud: 0,
              decimales: 0,


            ),
// Campo: commission_currency. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.COMMISSION_CURRENCY,
              denominacion: BOOKINGS.ETIQUETA_COMMISSION_CURRENCY,
              etiqueta: BOOKINGS.ETIQUETA_COMMISSION_CURRENCY,
              componente: 'BDEdicion',
              longitud: 255,
              decimales: 0,


            ),
// Campo: commission_payment_date. Tipo de Componente: BDEdicionFecha
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.COMMISSION_PAYMENT_DATE,
              denominacion: BOOKINGS.ETIQUETA_COMMISSION_PAYMENT_DATE,
              etiqueta: BOOKINGS.ETIQUETA_COMMISSION_PAYMENT_DATE,
              componente: 'BDEdicionFecha',
              longitud: 0,
              decimales: 0,


            ),
// Campo: commission_checked. Tipo de Componente: BDChequeo
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.COMMISSION_CHECKED,
              denominacion: BOOKINGS.ETIQUETA_COMMISSION_CHECKED,
              etiqueta: BOOKINGS.ETIQUETA_COMMISSION_CHECKED,
              componente: 'BDChequeo',
              longitud: 0,
              decimales: 0,


            ),
// Campo: commission_notes. Tipo de Componente: BDMemo
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.COMMISSION_NOTES,
              denominacion: BOOKINGS.ETIQUETA_COMMISSION_NOTES,
              etiqueta: BOOKINGS.ETIQUETA_COMMISSION_NOTES,
              componente: 'BDMemo',
              longitud: 4096,
              decimales: 0,


            ),
// Campo: city_tax_mode. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.CITY_TAX_MODE,
              denominacion: BOOKINGS.ETIQUETA_CITY_TAX_MODE,
              etiqueta: BOOKINGS.ETIQUETA_CITY_TAX_MODE,
              componente: 'BDEdicion',
              longitud: 255,
              decimales: 0,


            ),
// Campo: citytax_adults. Tipo de Componente: BDEdicionNumero
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.CITYTAX_ADULTS,
              denominacion: BOOKINGS.ETIQUETA_CITYTAX_ADULTS,
              etiqueta: BOOKINGS.ETIQUETA_CITYTAX_ADULTS,
              componente: 'BDEdicionNumero',
              longitud: 0,
              decimales: 0,


            ),
// Campo: citytax_children. Tipo de Componente: BDEdicionNumero
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.CITYTAX_CHILDREN,
              denominacion: BOOKINGS.ETIQUETA_CITYTAX_CHILDREN,
              etiqueta: BOOKINGS.ETIQUETA_CITYTAX_CHILDREN,
              componente: 'BDEdicionNumero',
              longitud: 0,
              decimales: 0,


            ),
// Campo: disable_room_change. Tipo de Componente: BDChequeo
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.DISABLE_ROOM_CHANGE,
              denominacion: BOOKINGS.ETIQUETA_DISABLE_ROOM_CHANGE,
              etiqueta: BOOKINGS.ETIQUETA_DISABLE_ROOM_CHANGE,
              componente: 'BDChequeo',
              longitud: 0,
              decimales: 0,


            ),
// Campo: guest_first_name. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.GUEST_FIRST_NAME,
              denominacion: BOOKINGS.ETIQUETA_GUEST_FIRST_NAME,
              etiqueta: BOOKINGS.ETIQUETA_GUEST_FIRST_NAME,
              componente: 'BDEdicion',
              longitud: 255,
              decimales: 0,


            ),
// Campo: guest_middle_name. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.GUEST_MIDDLE_NAME,
              denominacion: BOOKINGS.ETIQUETA_GUEST_MIDDLE_NAME,
              etiqueta: BOOKINGS.ETIQUETA_GUEST_MIDDLE_NAME,
              componente: 'BDEdicion',
              longitud: 255,
              decimales: 0,


            ),
// Campo: guest_last_name. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.GUEST_LAST_NAME,
              denominacion: BOOKINGS.ETIQUETA_GUEST_LAST_NAME,
              etiqueta: BOOKINGS.ETIQUETA_GUEST_LAST_NAME,
              componente: 'BDEdicion',
              longitud: 255,
              decimales: 0,


            ),
// Campo: guest_country. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.GUEST_COUNTRY,
              denominacion: BOOKINGS.ETIQUETA_GUEST_COUNTRY,
              etiqueta: BOOKINGS.ETIQUETA_GUEST_COUNTRY,
              componente: 'BDEdicion',
              longitud: 255,
              decimales: 0,


            ),
// Campo: guest_city. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.GUEST_CITY,
              denominacion: BOOKINGS.ETIQUETA_GUEST_CITY,
              etiqueta: BOOKINGS.ETIQUETA_GUEST_CITY,
              componente: 'BDEdicion',
              longitud: 255,
              decimales: 0,


            ),
// Campo: guest_address. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.GUEST_ADDRESS,
              denominacion: BOOKINGS.ETIQUETA_GUEST_ADDRESS,
              etiqueta: BOOKINGS.ETIQUETA_GUEST_ADDRESS,
              componente: 'BDEdicion',
              longitud: 255,
              decimales: 0,


            ),
// Campo: guest_zip_code. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.GUEST_ZIP_CODE,
              denominacion: BOOKINGS.ETIQUETA_GUEST_ZIP_CODE,
              etiqueta: BOOKINGS.ETIQUETA_GUEST_ZIP_CODE,
              componente: 'BDEdicion',
              longitud: 255,
              decimales: 0,


            ),
// Campo: guest_phone_number. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.GUEST_PHONE_NUMBER,
              denominacion: BOOKINGS.ETIQUETA_GUEST_PHONE_NUMBER,
              etiqueta: BOOKINGS.ETIQUETA_GUEST_PHONE_NUMBER,
              componente: 'BDEdicion',
              longitud: 255,
              decimales: 0,


            ),
// Campo: guest_e_mail. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.GUEST_E_MAIL,
              denominacion: BOOKINGS.ETIQUETA_GUEST_E_MAIL,
              etiqueta: BOOKINGS.ETIQUETA_GUEST_E_MAIL,
              componente: 'BDEdicion',
              longitud: 255,
              decimales: 0,


            ),
// Campo: guest_fax_number. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.GUEST_FAX_NUMBER,
              denominacion: BOOKINGS.ETIQUETA_GUEST_FAX_NUMBER,
              etiqueta: BOOKINGS.ETIQUETA_GUEST_FAX_NUMBER,
              componente: 'BDEdicion',
              longitud: 255,
              decimales: 0,


            ),
// Campo: guest_language. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.GUEST_LANGUAGE,
              denominacion: BOOKINGS.ETIQUETA_GUEST_LANGUAGE,
              etiqueta: BOOKINGS.ETIQUETA_GUEST_LANGUAGE,
              componente: 'BDEdicion',
              longitud: 255,
              decimales: 0,


            ),
// Campo: guest_state. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.GUEST_STATE,
              denominacion: BOOKINGS.ETIQUETA_GUEST_STATE,
              etiqueta: BOOKINGS.ETIQUETA_GUEST_STATE,
              componente: 'BDEdicion',
              longitud: 255,
              decimales: 0,


            ),
// Campo: active_notes. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.ACTIVE_NOTES,
              denominacion: BOOKINGS.ETIQUETA_ACTIVE_NOTES,
              etiqueta: BOOKINGS.ETIQUETA_ACTIVE_NOTES,
              componente: 'BDEdicion',
              longitud: 255,
              decimales: 0,


            ),
// Campo: active_housekeeping_notes. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.ACTIVE_HOUSEKEEPING_NOTES,
              denominacion: BOOKINGS.ETIQUETA_ACTIVE_HOUSEKEEPING_NOTES,
              etiqueta: BOOKINGS.ETIQUETA_ACTIVE_HOUSEKEEPING_NOTES,
              componente: 'BDEdicion',
              longitud: 255,
              decimales: 0,


            ),
// Campo: active_meals_notes. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.ACTIVE_MEALS_NOTES,
              denominacion: BOOKINGS.ETIQUETA_ACTIVE_MEALS_NOTES,
              etiqueta: BOOKINGS.ETIQUETA_ACTIVE_MEALS_NOTES,
              componente: 'BDEdicion',
              longitud: 255,
              decimales: 0,


            ),
// Campo: active_client_requests. Tipo de Componente: BDEdicion
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.ACTIVE_CLIENT_REQUESTS,
              denominacion: BOOKINGS.ETIQUETA_ACTIVE_CLIENT_REQUESTS,
              etiqueta: BOOKINGS.ETIQUETA_ACTIVE_CLIENT_REQUESTS,
              componente: 'BDEdicion',
              longitud: 255,
              decimales: 0,


            ),
// Campo: ota. Tipo de Componente: BDChequeo
            UICampo(
              datos: DEM.mapaBooking,
              tabla: BOOKINGS.ETIQUETA_ENTIDAD,
              campo: BOOKINGS.OTA,
              denominacion: BOOKINGS.ETIQUETA_OTA,
              etiqueta: BOOKINGS.ETIQUETA_OTA,
              componente: 'BDChequeo',
              longitud: 0,
              decimales: 0,


            ),
              // UICamposObligatorios(),
              UIBotonesGuardarBorrar(guardar: _guardar, borrar: widget.registro.id == 0 ? null : _borrar ),
            ],
          ),
        ),
    );
  }
}
