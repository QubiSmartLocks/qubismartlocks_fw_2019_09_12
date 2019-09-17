/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Modelo (MVC) de Entidad Bookings -> Booking
   [Qubi Smart Locks/Clock PMS (Api Reservaciones)]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';
import 'package:firebase/firebase.dart' as fb;


class Booking {
  Booking({
    this.key = '',
    this.pkid,
    this.id,
    this.number,
    this.arrival,
    this.departure,
    this.arrival_room_type_id,
    this.arrival_room_id,
    this.adults,
    this.children,
    this.reference_number,
    this.reference_date,
    this.is_guaranteed,
    this.rate_id,
    this.source_of_business_company_id,
    this.event_id,
    this.block_id,
    this.status_changed_at,
    this.user_created_id,
    this.user_updated_id,
    this.status,
    this.created_at,
    this.updated_at,
    this.marketing_source,
    this.marketing_channel,
    this.accept_charge_transfers,
    this.guarantee_policy_id,
    this.arrival_time,
    this.transfer_arrival,
    this.transfer_departure,
    this.departure_time,
    this.first_meal_id,
    this.eating_object_id,
    this.registration_cards_count,
    this.confirmation_logs_count,
    this.self_service_key,
    this.self_service_pin,
    this.source_id,
    this.cancel_source_id,
    this.links,
    this.housekeeping_note,
    this.commission_value_cents,
    this.commission_currency,
    this.commission_payment_date,
    this.commission_checked,
    this.commission_notes,
    this.city_tax_mode,
    this.citytax_adults,
    this.citytax_children,
    this.disable_room_change,
    this.guest_first_name,
    this.guest_middle_name,
    this.guest_last_name,
    this.guest_country,
    this.guest_city,
    this.guest_address,
    this.guest_zip_code,
    this.guest_phone_number,
    this.guest_e_mail,
    this.guest_fax_number,
    this.guest_language,
    this.guest_state,
    this.active_notes,
    this.active_housekeeping_notes,
    this.active_meals_notes,
    this.active_client_requests,
    this.ota,
  });

  String key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
  int pkid;  // Id [Búsqueda: int]
  int id;  // Id [Búsqueda: int]
  String number;  // Clock PMS STRING [Texto Variable: String]
  DateTime arrival;  // Clock PMS DATE [Fecha: DateTime]
  DateTime departure;  // Clock PMS DATE [Fecha: DateTime]
  int arrival_room_type_id;  // Clock PMS INTEGER [Entero: int]
  int arrival_room_id;  // Clock PMS INTEGER [Entero: int]
  int adults;  // Clock PMS INTEGER [Entero: int]
  int children;  // Clock PMS INTEGER [Entero: int]
  String reference_number;  // Clock PMS STRING [Texto Variable: String]
  DateTime reference_date;  // Clock PMS DATE [Fecha: DateTime]
  bool is_guaranteed;  // Clock PMS BOOLEAN [Booleano: bool]
  int rate_id;  // Clock PMS INTEGER [Entero: int]
  int source_of_business_company_id;  // Clock PMS INTEGER [Entero: int]
  int event_id;  // Clock PMS INTEGER [Entero: int]
  int block_id;  // Clock PMS INTEGER [Entero: int]
  DateTime status_changed_at;  // Clock PMS DATE TIME [Momento: DateTime]
  int user_created_id;  // Clock PMS INTEGER [Entero: int]
  int user_updated_id;  // Clock PMS INTEGER [Entero: int]
  String status;  // Clock PMS STRING [Texto Variable: String]
  DateTime created_at;  // Clock PMS DATETIME [Momento: DateTime]
  DateTime updated_at;  // Clock PMS DATETIME [Momento: DateTime]
  String marketing_source;  // Clock PMS STRING [Texto Variable: String]
  String marketing_channel;  // Clock PMS STRING [Texto Variable: String]
  bool accept_charge_transfers;  // Clock PMS BOOLEAN [Booleano: bool]
  int guarantee_policy_id;  // Clock PMS INTEGER [Entero: int]
  String arrival_time;  // Clock PMS STRING [Texto Variable: String]
  String transfer_arrival;  // Clock PMS STRING [Texto Variable: String]
  String transfer_departure;  // Clock PMS STRING [Texto Variable: String]
  String departure_time;  // Clock PMS STRING [Texto Variable: String]
  int first_meal_id;  // Clock PMS INTEGER [Entero: int]
  int eating_object_id;  // Clock PMS INTEGER [Entero: int]
  int registration_cards_count;  // Clock PMS INTEGER [Entero: int]
  int confirmation_logs_count;  // Clock PMS INTEGER [Entero: int]
  String self_service_key;  // Clock PMS STRING [Texto Variable: String]
  String self_service_pin;  // Clock PMS STRING [Texto Variable: String]
  int source_id;  // Clock PMS INTEGER [Entero: int]
  int cancel_source_id;  // Clock PMS INTEGER [Entero: int]
  String links;  // Clock PMS TEXT [Texto Variable: String]
  String housekeeping_note;  // Clock PMS TEXT [Texto Variable: String]
  int commission_value_cents;  // Clock PMS INTEGER [Entero: int]
  String commission_currency;  // Clock PMS STRING [Texto Variable: String]
  DateTime commission_payment_date;  // Clock PMS DATE [Fecha: DateTime]
  bool commission_checked;  // Clock PMS BOOLEAN [Booleano: bool]
  String commission_notes;  // Clock PMS TEXT [Texto Variable: String]
  String city_tax_mode;  // Clock PMS STRING [Texto Variable: String]
  int citytax_adults;  // Clock PMS INTEGER [Entero: int]
  int citytax_children;  // Clock PMS INTEGER [Entero: int]
  bool disable_room_change;  // Clock PMS BOOLEAN [Booleano: bool]
  String guest_first_name;  // Clock PMS STRING [Texto Variable: String]
  String guest_middle_name;  // Clock PMS STRING [Texto Variable: String]
  String guest_last_name;  // Clock PMS STRING [Texto Variable: String]
  String guest_country;  // Clock PMS STRING [Texto Variable: String]
  String guest_city;  // Clock PMS STRING [Texto Variable: String]
  String guest_address;  // Clock PMS STRING [Texto Variable: String]
  String guest_zip_code;  // Clock PMS STRING [Texto Variable: String]
  String guest_phone_number;  // Clock PMS STRING [Texto Variable: String]
  String guest_e_mail;  // Clock PMS STRING [Texto Variable: String]
  String guest_fax_number;  // Clock PMS STRING [Texto Variable: String]
  String guest_language;  // Clock PMS STRING [Texto Variable: String]
  String guest_state;  // Clock PMS STRING [Texto Variable: String]
  String active_notes;  // Clock PMS STRING [Texto Variable: String]
  String active_housekeeping_notes;  // Clock PMS STRING [Texto Variable: String]
  String active_meals_notes;  // Clock PMS STRING [Texto Variable: String]
  String active_client_requests;  // Clock PMS STRING [Texto Variable: String]
  bool ota;  // Clock PMS BOOLEAN [Booleano: bool]

  fromSnapshot(fb.DataSnapshot data) {
    this.fromKeyValue(data.key, data.val());
  }

  fromKeyValue(String key, Map value) {
    this.key = key; // Incluido por usar Firebase Database, pero no en Dendrita
    this.pkid = value[BOOKINGS.PKID];
    this.id = value[BOOKINGS.ID];
    this.number = value[BOOKINGS.NUMBER];
    this.arrival = LeerFecha(value[BOOKINGS.ARRIVAL]);
    this.departure = LeerFecha(value[BOOKINGS.DEPARTURE]);
    this.arrival_room_type_id = value[BOOKINGS.ARRIVAL_ROOM_TYPE_ID];
    this.arrival_room_id = value[BOOKINGS.ARRIVAL_ROOM_ID];
    this.adults = value[BOOKINGS.ADULTS];
    this.children = value[BOOKINGS.CHILDREN];
    this.reference_number = value[BOOKINGS.REFERENCE_NUMBER];
    this.reference_date = LeerFecha(value[BOOKINGS.REFERENCE_DATE]);
    this.is_guaranteed = value[BOOKINGS.IS_GUARANTEED];
    this.rate_id = value[BOOKINGS.RATE_ID];
    this.source_of_business_company_id = value[BOOKINGS.SOURCE_OF_BUSINESS_COMPANY_ID];
    this.event_id = value[BOOKINGS.EVENT_ID];
    this.block_id = value[BOOKINGS.BLOCK_ID];
    this.status_changed_at = DateTime.parse(value[BOOKINGS.STATUS_CHANGED_AT]);
    this.user_created_id = value[BOOKINGS.USER_CREATED_ID];
    this.user_updated_id = value[BOOKINGS.USER_UPDATED_ID];
    this.status = value[BOOKINGS.STATUS];
    this.created_at = DateTime.parse(value[BOOKINGS.CREATED_AT]);
    this.updated_at = DateTime.parse(value[BOOKINGS.UPDATED_AT]);
    this.marketing_source = value[BOOKINGS.MARKETING_SOURCE];
    this.marketing_channel = value[BOOKINGS.MARKETING_CHANNEL];
    this.accept_charge_transfers = value[BOOKINGS.ACCEPT_CHARGE_TRANSFERS];
    this.guarantee_policy_id = value[BOOKINGS.GUARANTEE_POLICY_ID];
    this.arrival_time = value[BOOKINGS.ARRIVAL_TIME];
    this.transfer_arrival = value[BOOKINGS.TRANSFER_ARRIVAL];
    this.transfer_departure = value[BOOKINGS.TRANSFER_DEPARTURE];
    this.departure_time = value[BOOKINGS.DEPARTURE_TIME];
    this.first_meal_id = value[BOOKINGS.FIRST_MEAL_ID];
    this.eating_object_id = value[BOOKINGS.EATING_OBJECT_ID];
    this.registration_cards_count = value[BOOKINGS.REGISTRATION_CARDS_COUNT];
    this.confirmation_logs_count = value[BOOKINGS.CONFIRMATION_LOGS_COUNT];
    this.self_service_key = value[BOOKINGS.SELF_SERVICE_KEY];
    this.self_service_pin = value[BOOKINGS.SELF_SERVICE_PIN];
    this.source_id = value[BOOKINGS.SOURCE_ID];
    this.cancel_source_id = value[BOOKINGS.CANCEL_SOURCE_ID];
    this.links = value[BOOKINGS.LINKS];
    this.housekeeping_note = value[BOOKINGS.HOUSEKEEPING_NOTE];
    this.commission_value_cents = value[BOOKINGS.COMMISSION_VALUE_CENTS];
    this.commission_currency = value[BOOKINGS.COMMISSION_CURRENCY];
    this.commission_payment_date = LeerFecha(value[BOOKINGS.COMMISSION_PAYMENT_DATE]);
    this.commission_checked = value[BOOKINGS.COMMISSION_CHECKED];
    this.commission_notes = value[BOOKINGS.COMMISSION_NOTES];
    this.city_tax_mode = value[BOOKINGS.CITY_TAX_MODE];
    this.citytax_adults = value[BOOKINGS.CITYTAX_ADULTS];
    this.citytax_children = value[BOOKINGS.CITYTAX_CHILDREN];
    this.disable_room_change = value[BOOKINGS.DISABLE_ROOM_CHANGE];
    this.guest_first_name = value[BOOKINGS.GUEST_FIRST_NAME];
    this.guest_middle_name = value[BOOKINGS.GUEST_MIDDLE_NAME];
    this.guest_last_name = value[BOOKINGS.GUEST_LAST_NAME];
    this.guest_country = value[BOOKINGS.GUEST_COUNTRY];
    this.guest_city = value[BOOKINGS.GUEST_CITY];
    this.guest_address = value[BOOKINGS.GUEST_ADDRESS];
    this.guest_zip_code = value[BOOKINGS.GUEST_ZIP_CODE];
    this.guest_phone_number = value[BOOKINGS.GUEST_PHONE_NUMBER];
    this.guest_e_mail = value[BOOKINGS.GUEST_E_MAIL];
    this.guest_fax_number = value[BOOKINGS.GUEST_FAX_NUMBER];
    this.guest_language = value[BOOKINGS.GUEST_LANGUAGE];
    this.guest_state = value[BOOKINGS.GUEST_STATE];
    this.active_notes = value[BOOKINGS.ACTIVE_NOTES];
    this.active_housekeeping_notes = value[BOOKINGS.ACTIVE_HOUSEKEEPING_NOTES];
    this.active_meals_notes = value[BOOKINGS.ACTIVE_MEALS_NOTES];
    this.active_client_requests = value[BOOKINGS.ACTIVE_CLIENT_REQUESTS];
    this.ota = value[BOOKINGS.OTA];
  }

  toJson() {
    return {
      'key': this.key, // Incluido por usar Firebase Database, pero no en Dendrita
      BOOKINGS.PKID: this.pkid,
      BOOKINGS.ID: this.id,
      BOOKINGS.NUMBER: this.number,
      BOOKINGS.ARRIVAL: this.arrival == null ? null : GuardarFecha(this.arrival),
      BOOKINGS.DEPARTURE: this.departure == null ? null : GuardarFecha(this.departure),
      BOOKINGS.ARRIVAL_ROOM_TYPE_ID: this.arrival_room_type_id,
      BOOKINGS.ARRIVAL_ROOM_ID: this.arrival_room_id,
      BOOKINGS.ADULTS: this.adults,
      BOOKINGS.CHILDREN: this.children,
      BOOKINGS.REFERENCE_NUMBER: this.reference_number,
      BOOKINGS.REFERENCE_DATE: this.reference_date == null ? null : GuardarFecha(this.reference_date),
      BOOKINGS.IS_GUARANTEED: this.is_guaranteed,
      BOOKINGS.RATE_ID: this.rate_id,
      BOOKINGS.SOURCE_OF_BUSINESS_COMPANY_ID: this.source_of_business_company_id,
      BOOKINGS.EVENT_ID: this.event_id,
      BOOKINGS.BLOCK_ID: this.block_id,
      BOOKINGS.STATUS_CHANGED_AT: this.status_changed_at == null ? null : GuardarFechaHora(this.status_changed_at),
      BOOKINGS.USER_CREATED_ID: this.user_created_id,
      BOOKINGS.USER_UPDATED_ID: this.user_updated_id,
      BOOKINGS.STATUS: this.status,
      BOOKINGS.CREATED_AT: this.created_at == null ? null : GuardarFechaHora(this.created_at),
      BOOKINGS.UPDATED_AT: this.updated_at == null ? null : GuardarFechaHora(this.updated_at),
      BOOKINGS.MARKETING_SOURCE: this.marketing_source,
      BOOKINGS.MARKETING_CHANNEL: this.marketing_channel,
      BOOKINGS.ACCEPT_CHARGE_TRANSFERS: this.accept_charge_transfers,
      BOOKINGS.GUARANTEE_POLICY_ID: this.guarantee_policy_id,
      BOOKINGS.ARRIVAL_TIME: this.arrival_time,
      BOOKINGS.TRANSFER_ARRIVAL: this.transfer_arrival,
      BOOKINGS.TRANSFER_DEPARTURE: this.transfer_departure,
      BOOKINGS.DEPARTURE_TIME: this.departure_time,
      BOOKINGS.FIRST_MEAL_ID: this.first_meal_id,
      BOOKINGS.EATING_OBJECT_ID: this.eating_object_id,
      BOOKINGS.REGISTRATION_CARDS_COUNT: this.registration_cards_count,
      BOOKINGS.CONFIRMATION_LOGS_COUNT: this.confirmation_logs_count,
      BOOKINGS.SELF_SERVICE_KEY: this.self_service_key,
      BOOKINGS.SELF_SERVICE_PIN: this.self_service_pin,
      BOOKINGS.SOURCE_ID: this.source_id,
      BOOKINGS.CANCEL_SOURCE_ID: this.cancel_source_id,
      BOOKINGS.LINKS: this.links,
      BOOKINGS.HOUSEKEEPING_NOTE: this.housekeeping_note,
      BOOKINGS.COMMISSION_VALUE_CENTS: this.commission_value_cents,
      BOOKINGS.COMMISSION_CURRENCY: this.commission_currency,
      BOOKINGS.COMMISSION_PAYMENT_DATE: this.commission_payment_date == null ? null : GuardarFecha(this.commission_payment_date),
      BOOKINGS.COMMISSION_CHECKED: this.commission_checked,
      BOOKINGS.COMMISSION_NOTES: this.commission_notes,
      BOOKINGS.CITY_TAX_MODE: this.city_tax_mode,
      BOOKINGS.CITYTAX_ADULTS: this.citytax_adults,
      BOOKINGS.CITYTAX_CHILDREN: this.citytax_children,
      BOOKINGS.DISABLE_ROOM_CHANGE: this.disable_room_change,
      BOOKINGS.GUEST_FIRST_NAME: this.guest_first_name,
      BOOKINGS.GUEST_MIDDLE_NAME: this.guest_middle_name,
      BOOKINGS.GUEST_LAST_NAME: this.guest_last_name,
      BOOKINGS.GUEST_COUNTRY: this.guest_country,
      BOOKINGS.GUEST_CITY: this.guest_city,
      BOOKINGS.GUEST_ADDRESS: this.guest_address,
      BOOKINGS.GUEST_ZIP_CODE: this.guest_zip_code,
      BOOKINGS.GUEST_PHONE_NUMBER: this.guest_phone_number,
      BOOKINGS.GUEST_E_MAIL: this.guest_e_mail,
      BOOKINGS.GUEST_FAX_NUMBER: this.guest_fax_number,
      BOOKINGS.GUEST_LANGUAGE: this.guest_language,
      BOOKINGS.GUEST_STATE: this.guest_state,
      BOOKINGS.ACTIVE_NOTES: this.active_notes,
      BOOKINGS.ACTIVE_HOUSEKEEPING_NOTES: this.active_housekeeping_notes,
      BOOKINGS.ACTIVE_MEALS_NOTES: this.active_meals_notes,
      BOOKINGS.ACTIVE_CLIENT_REQUESTS: this.active_client_requests,
      BOOKINGS.OTA: this.ota,
    };
  }

  assign(Booking booking) {

    if (booking == null) {
      this.key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
      this.pkid = null; //0;
      this.id = null; //0;
      this.number = null; //'';
      this.arrival = null; //DateTime.now();
      this.departure = null; //DateTime.now();
      this.arrival_room_type_id = null; //0;
      this.arrival_room_id = null; //0;
      this.adults = null; //0;
      this.children = null; //0;
      this.reference_number = null; //'';
      this.reference_date = null; //DateTime.now();
      this.is_guaranteed = null; //false;
      this.rate_id = null; //0;
      this.source_of_business_company_id = null; //0;
      this.event_id = null; //0;
      this.block_id = null; //0;
      this.status_changed_at = null; //new DateTime.now();
      this.user_created_id = null; //0;
      this.user_updated_id = null; //0;
      this.status = null; //'';
      this.created_at = null; //new DateTime.now();
      this.updated_at = null; //new DateTime.now();
      this.marketing_source = null; //'';
      this.marketing_channel = null; //'';
      this.accept_charge_transfers = null; //false;
      this.guarantee_policy_id = null; //0;
      this.arrival_time = null; //'';
      this.transfer_arrival = null; //'';
      this.transfer_departure = null; //'';
      this.departure_time = null; //'';
      this.first_meal_id = null; //0;
      this.eating_object_id = null; //0;
      this.registration_cards_count = null; //0;
      this.confirmation_logs_count = null; //0;
      this.self_service_key = null; //'';
      this.self_service_pin = null; //'';
      this.source_id = null; //0;
      this.cancel_source_id = null; //0;
      this.links = null; //'';
      this.housekeeping_note = null; //'';
      this.commission_value_cents = null; //0;
      this.commission_currency = null; //'';
      this.commission_payment_date = null; //DateTime.now();
      this.commission_checked = null; //false;
      this.commission_notes = null; //'';
      this.city_tax_mode = null; //'';
      this.citytax_adults = null; //0;
      this.citytax_children = null; //0;
      this.disable_room_change = null; //false;
      this.guest_first_name = null; //'';
      this.guest_middle_name = null; //'';
      this.guest_last_name = null; //'';
      this.guest_country = null; //'';
      this.guest_city = null; //'';
      this.guest_address = null; //'';
      this.guest_zip_code = null; //'';
      this.guest_phone_number = null; //'';
      this.guest_e_mail = null; //'';
      this.guest_fax_number = null; //'';
      this.guest_language = null; //'';
      this.guest_state = null; //'';
      this.active_notes = null; //'';
      this.active_housekeeping_notes = null; //'';
      this.active_meals_notes = null; //'';
      this.active_client_requests = null; //'';
      this.ota = null; //false;
    } else {
      this.key = booking.key; // Incluido por usar Firebase Database, pero no en Dendrita
      this.pkid = booking.pkid;
      this.id = booking.id;
      this.number = booking.number;
      this.arrival = booking.arrival;
      this.departure = booking.departure;
      this.arrival_room_type_id = booking.arrival_room_type_id;
      this.arrival_room_id = booking.arrival_room_id;
      this.adults = booking.adults;
      this.children = booking.children;
      this.reference_number = booking.reference_number;
      this.reference_date = booking.reference_date;
      this.is_guaranteed = booking.is_guaranteed;
      this.rate_id = booking.rate_id;
      this.source_of_business_company_id = booking.source_of_business_company_id;
      this.event_id = booking.event_id;
      this.block_id = booking.block_id;
      this.status_changed_at = booking.status_changed_at;
      this.user_created_id = booking.user_created_id;
      this.user_updated_id = booking.user_updated_id;
      this.status = booking.status;
      this.created_at = booking.created_at;
      this.updated_at = booking.updated_at;
      this.marketing_source = booking.marketing_source;
      this.marketing_channel = booking.marketing_channel;
      this.accept_charge_transfers = booking.accept_charge_transfers;
      this.guarantee_policy_id = booking.guarantee_policy_id;
      this.arrival_time = booking.arrival_time;
      this.transfer_arrival = booking.transfer_arrival;
      this.transfer_departure = booking.transfer_departure;
      this.departure_time = booking.departure_time;
      this.first_meal_id = booking.first_meal_id;
      this.eating_object_id = booking.eating_object_id;
      this.registration_cards_count = booking.registration_cards_count;
      this.confirmation_logs_count = booking.confirmation_logs_count;
      this.self_service_key = booking.self_service_key;
      this.self_service_pin = booking.self_service_pin;
      this.source_id = booking.source_id;
      this.cancel_source_id = booking.cancel_source_id;
      this.links = booking.links;
      this.housekeeping_note = booking.housekeeping_note;
      this.commission_value_cents = booking.commission_value_cents;
      this.commission_currency = booking.commission_currency;
      this.commission_payment_date = booking.commission_payment_date;
      this.commission_checked = booking.commission_checked;
      this.commission_notes = booking.commission_notes;
      this.city_tax_mode = booking.city_tax_mode;
      this.citytax_adults = booking.citytax_adults;
      this.citytax_children = booking.citytax_children;
      this.disable_room_change = booking.disable_room_change;
      this.guest_first_name = booking.guest_first_name;
      this.guest_middle_name = booking.guest_middle_name;
      this.guest_last_name = booking.guest_last_name;
      this.guest_country = booking.guest_country;
      this.guest_city = booking.guest_city;
      this.guest_address = booking.guest_address;
      this.guest_zip_code = booking.guest_zip_code;
      this.guest_phone_number = booking.guest_phone_number;
      this.guest_e_mail = booking.guest_e_mail;
      this.guest_fax_number = booking.guest_fax_number;
      this.guest_language = booking.guest_language;
      this.guest_state = booking.guest_state;
      this.active_notes = booking.active_notes;
      this.active_housekeeping_notes = booking.active_housekeeping_notes;
      this.active_meals_notes = booking.active_meals_notes;
      this.active_client_requests = booking.active_client_requests;
      this.ota = booking.ota;
    }
  }

  Map toMap() {
    Map map = {
      BOOKINGS.KEY: this.key,  // Incluido por usar Firebase Database, pero no en Dendrita
      BOOKINGS.PKID: this.pkid,
      BOOKINGS.ID: this.id,
      BOOKINGS.NUMBER: this.number,
      BOOKINGS.ARRIVAL: this.arrival == null ? null : GuardarFecha(this.arrival),
      BOOKINGS.DEPARTURE: this.departure == null ? null : GuardarFecha(this.departure),
      BOOKINGS.ARRIVAL_ROOM_TYPE_ID: this.arrival_room_type_id,
      BOOKINGS.ARRIVAL_ROOM_ID: this.arrival_room_id,
      BOOKINGS.ADULTS: this.adults,
      BOOKINGS.CHILDREN: this.children,
      BOOKINGS.REFERENCE_NUMBER: this.reference_number,
      BOOKINGS.REFERENCE_DATE: this.reference_date == null ? null : GuardarFecha(this.reference_date),
      BOOKINGS.IS_GUARANTEED: this.is_guaranteed,
      BOOKINGS.RATE_ID: this.rate_id,
      BOOKINGS.SOURCE_OF_BUSINESS_COMPANY_ID: this.source_of_business_company_id,
      BOOKINGS.EVENT_ID: this.event_id,
      BOOKINGS.BLOCK_ID: this.block_id,
      BOOKINGS.STATUS_CHANGED_AT: this.status_changed_at == null ? null : GuardarFecha(this.status_changed_at),
      BOOKINGS.USER_CREATED_ID: this.user_created_id,
      BOOKINGS.USER_UPDATED_ID: this.user_updated_id,
      BOOKINGS.STATUS: this.status,
      BOOKINGS.CREATED_AT: this.created_at == null ? null : GuardarFecha(this.created_at),
      BOOKINGS.UPDATED_AT: this.updated_at == null ? null : GuardarFecha(this.updated_at),
      BOOKINGS.MARKETING_SOURCE: this.marketing_source,
      BOOKINGS.MARKETING_CHANNEL: this.marketing_channel,
      BOOKINGS.ACCEPT_CHARGE_TRANSFERS: this.accept_charge_transfers,
      BOOKINGS.GUARANTEE_POLICY_ID: this.guarantee_policy_id,
      BOOKINGS.ARRIVAL_TIME: this.arrival_time,
      BOOKINGS.TRANSFER_ARRIVAL: this.transfer_arrival,
      BOOKINGS.TRANSFER_DEPARTURE: this.transfer_departure,
      BOOKINGS.DEPARTURE_TIME: this.departure_time,
      BOOKINGS.FIRST_MEAL_ID: this.first_meal_id,
      BOOKINGS.EATING_OBJECT_ID: this.eating_object_id,
      BOOKINGS.REGISTRATION_CARDS_COUNT: this.registration_cards_count,
      BOOKINGS.CONFIRMATION_LOGS_COUNT: this.confirmation_logs_count,
      BOOKINGS.SELF_SERVICE_KEY: this.self_service_key,
      BOOKINGS.SELF_SERVICE_PIN: this.self_service_pin,
      BOOKINGS.SOURCE_ID: this.source_id,
      BOOKINGS.CANCEL_SOURCE_ID: this.cancel_source_id,
      BOOKINGS.LINKS: this.links,
      BOOKINGS.HOUSEKEEPING_NOTE: this.housekeeping_note,
      BOOKINGS.COMMISSION_VALUE_CENTS: this.commission_value_cents,
      BOOKINGS.COMMISSION_CURRENCY: this.commission_currency,
      BOOKINGS.COMMISSION_PAYMENT_DATE: this.commission_payment_date == null ? null : GuardarFecha(this.commission_payment_date),
      BOOKINGS.COMMISSION_CHECKED: this.commission_checked,
      BOOKINGS.COMMISSION_NOTES: this.commission_notes,
      BOOKINGS.CITY_TAX_MODE: this.city_tax_mode,
      BOOKINGS.CITYTAX_ADULTS: this.citytax_adults,
      BOOKINGS.CITYTAX_CHILDREN: this.citytax_children,
      BOOKINGS.DISABLE_ROOM_CHANGE: this.disable_room_change,
      BOOKINGS.GUEST_FIRST_NAME: this.guest_first_name,
      BOOKINGS.GUEST_MIDDLE_NAME: this.guest_middle_name,
      BOOKINGS.GUEST_LAST_NAME: this.guest_last_name,
      BOOKINGS.GUEST_COUNTRY: this.guest_country,
      BOOKINGS.GUEST_CITY: this.guest_city,
      BOOKINGS.GUEST_ADDRESS: this.guest_address,
      BOOKINGS.GUEST_ZIP_CODE: this.guest_zip_code,
      BOOKINGS.GUEST_PHONE_NUMBER: this.guest_phone_number,
      BOOKINGS.GUEST_E_MAIL: this.guest_e_mail,
      BOOKINGS.GUEST_FAX_NUMBER: this.guest_fax_number,
      BOOKINGS.GUEST_LANGUAGE: this.guest_language,
      BOOKINGS.GUEST_STATE: this.guest_state,
      BOOKINGS.ACTIVE_NOTES: this.active_notes,
      BOOKINGS.ACTIVE_HOUSEKEEPING_NOTES: this.active_housekeeping_notes,
      BOOKINGS.ACTIVE_MEALS_NOTES: this.active_meals_notes,
      BOOKINGS.ACTIVE_CLIENT_REQUESTS: this.active_client_requests,
      BOOKINGS.OTA: this.ota,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.key = map[BOOKINGS.KEY];  // Incluido por usar Firebase Database, pero no en Dendrita
    this.pkid = map[BOOKINGS.PKID];
    this.id = map[BOOKINGS.ID];
    this.number = map[BOOKINGS.NUMBER];
    this.arrival = map[BOOKINGS.ARRIVAL] == null ? null : LeerFecha(map[BOOKINGS.ARRIVAL]);
    this.departure = map[BOOKINGS.DEPARTURE] == null ? null : LeerFecha(map[BOOKINGS.DEPARTURE]);
    this.arrival_room_type_id = map[BOOKINGS.ARRIVAL_ROOM_TYPE_ID];
    this.arrival_room_id = map[BOOKINGS.ARRIVAL_ROOM_ID];
    this.adults = map[BOOKINGS.ADULTS];
    this.children = map[BOOKINGS.CHILDREN];
    this.reference_number = map[BOOKINGS.REFERENCE_NUMBER];
    this.reference_date = map[BOOKINGS.REFERENCE_DATE] == null ? null : LeerFecha(map[BOOKINGS.REFERENCE_DATE]);
    this.is_guaranteed = map[BOOKINGS.IS_GUARANTEED];
    this.rate_id = map[BOOKINGS.RATE_ID];
    this.source_of_business_company_id = map[BOOKINGS.SOURCE_OF_BUSINESS_COMPANY_ID];
    this.event_id = map[BOOKINGS.EVENT_ID];
    this.block_id = map[BOOKINGS.BLOCK_ID];
    this.status_changed_at = map[BOOKINGS.STATUS_CHANGED_AT] == null ? null : LeerFecha(map[BOOKINGS.STATUS_CHANGED_AT]);
    this.user_created_id = map[BOOKINGS.USER_CREATED_ID];
    this.user_updated_id = map[BOOKINGS.USER_UPDATED_ID];
    this.status = map[BOOKINGS.STATUS];
    this.created_at = map[BOOKINGS.CREATED_AT] == null ? null : LeerFecha(map[BOOKINGS.CREATED_AT]);
    this.updated_at = map[BOOKINGS.UPDATED_AT] == null ? null : LeerFecha(map[BOOKINGS.UPDATED_AT]);
    this.marketing_source = map[BOOKINGS.MARKETING_SOURCE];
    this.marketing_channel = map[BOOKINGS.MARKETING_CHANNEL];
    this.accept_charge_transfers = map[BOOKINGS.ACCEPT_CHARGE_TRANSFERS];
    this.guarantee_policy_id = map[BOOKINGS.GUARANTEE_POLICY_ID];
    this.arrival_time = map[BOOKINGS.ARRIVAL_TIME];
    this.transfer_arrival = map[BOOKINGS.TRANSFER_ARRIVAL];
    this.transfer_departure = map[BOOKINGS.TRANSFER_DEPARTURE];
    this.departure_time = map[BOOKINGS.DEPARTURE_TIME];
    this.first_meal_id = map[BOOKINGS.FIRST_MEAL_ID];
    this.eating_object_id = map[BOOKINGS.EATING_OBJECT_ID];
    this.registration_cards_count = map[BOOKINGS.REGISTRATION_CARDS_COUNT];
    this.confirmation_logs_count = map[BOOKINGS.CONFIRMATION_LOGS_COUNT];
    this.self_service_key = map[BOOKINGS.SELF_SERVICE_KEY];
    this.self_service_pin = map[BOOKINGS.SELF_SERVICE_PIN];
    this.source_id = map[BOOKINGS.SOURCE_ID];
    this.cancel_source_id = map[BOOKINGS.CANCEL_SOURCE_ID];
    this.links = map[BOOKINGS.LINKS];
    this.housekeeping_note = map[BOOKINGS.HOUSEKEEPING_NOTE];
    this.commission_value_cents = map[BOOKINGS.COMMISSION_VALUE_CENTS];
    this.commission_currency = map[BOOKINGS.COMMISSION_CURRENCY];
    this.commission_payment_date = map[BOOKINGS.COMMISSION_PAYMENT_DATE] == null ? null : LeerFecha(map[BOOKINGS.COMMISSION_PAYMENT_DATE]);
    this.commission_checked = map[BOOKINGS.COMMISSION_CHECKED];
    this.commission_notes = map[BOOKINGS.COMMISSION_NOTES];
    this.city_tax_mode = map[BOOKINGS.CITY_TAX_MODE];
    this.citytax_adults = map[BOOKINGS.CITYTAX_ADULTS];
    this.citytax_children = map[BOOKINGS.CITYTAX_CHILDREN];
    this.disable_room_change = map[BOOKINGS.DISABLE_ROOM_CHANGE];
    this.guest_first_name = map[BOOKINGS.GUEST_FIRST_NAME];
    this.guest_middle_name = map[BOOKINGS.GUEST_MIDDLE_NAME];
    this.guest_last_name = map[BOOKINGS.GUEST_LAST_NAME];
    this.guest_country = map[BOOKINGS.GUEST_COUNTRY];
    this.guest_city = map[BOOKINGS.GUEST_CITY];
    this.guest_address = map[BOOKINGS.GUEST_ADDRESS];
    this.guest_zip_code = map[BOOKINGS.GUEST_ZIP_CODE];
    this.guest_phone_number = map[BOOKINGS.GUEST_PHONE_NUMBER];
    this.guest_e_mail = map[BOOKINGS.GUEST_E_MAIL];
    this.guest_fax_number = map[BOOKINGS.GUEST_FAX_NUMBER];
    this.guest_language = map[BOOKINGS.GUEST_LANGUAGE];
    this.guest_state = map[BOOKINGS.GUEST_STATE];
    this.active_notes = map[BOOKINGS.ACTIVE_NOTES];
    this.active_housekeeping_notes = map[BOOKINGS.ACTIVE_HOUSEKEEPING_NOTES];
    this.active_meals_notes = map[BOOKINGS.ACTIVE_MEALS_NOTES];
    this.active_client_requests = map[BOOKINGS.ACTIVE_CLIENT_REQUESTS];
    this.ota = map[BOOKINGS.OTA];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final Booking typedOther = other;
    return
        pkid == typedOther.pkid &&
        id == typedOther.id &&
        number == typedOther.number &&
        arrival == typedOther.arrival &&
        departure == typedOther.departure &&
        arrival_room_type_id == typedOther.arrival_room_type_id &&
        arrival_room_id == typedOther.arrival_room_id &&
        adults == typedOther.adults &&
        children == typedOther.children &&
        reference_number == typedOther.reference_number &&
        reference_date == typedOther.reference_date &&
        is_guaranteed == typedOther.is_guaranteed &&
        rate_id == typedOther.rate_id &&
        source_of_business_company_id == typedOther.source_of_business_company_id &&
        event_id == typedOther.event_id &&
        block_id == typedOther.block_id &&
        status_changed_at == typedOther.status_changed_at &&
        user_created_id == typedOther.user_created_id &&
        user_updated_id == typedOther.user_updated_id &&
        status == typedOther.status &&
        created_at == typedOther.created_at &&
        updated_at == typedOther.updated_at &&
        marketing_source == typedOther.marketing_source &&
        marketing_channel == typedOther.marketing_channel &&
        accept_charge_transfers == typedOther.accept_charge_transfers &&
        guarantee_policy_id == typedOther.guarantee_policy_id &&
        arrival_time == typedOther.arrival_time &&
        transfer_arrival == typedOther.transfer_arrival &&
        transfer_departure == typedOther.transfer_departure &&
        departure_time == typedOther.departure_time &&
        first_meal_id == typedOther.first_meal_id &&
        eating_object_id == typedOther.eating_object_id &&
        registration_cards_count == typedOther.registration_cards_count &&
        confirmation_logs_count == typedOther.confirmation_logs_count &&
        self_service_key == typedOther.self_service_key &&
        self_service_pin == typedOther.self_service_pin &&
        source_id == typedOther.source_id &&
        cancel_source_id == typedOther.cancel_source_id &&
        links == typedOther.links &&
        housekeeping_note == typedOther.housekeeping_note &&
        commission_value_cents == typedOther.commission_value_cents &&
        commission_currency == typedOther.commission_currency &&
        commission_payment_date == typedOther.commission_payment_date &&
        commission_checked == typedOther.commission_checked &&
        commission_notes == typedOther.commission_notes &&
        city_tax_mode == typedOther.city_tax_mode &&
        citytax_adults == typedOther.citytax_adults &&
        citytax_children == typedOther.citytax_children &&
        disable_room_change == typedOther.disable_room_change &&
        guest_first_name == typedOther.guest_first_name &&
        guest_middle_name == typedOther.guest_middle_name &&
        guest_last_name == typedOther.guest_last_name &&
        guest_country == typedOther.guest_country &&
        guest_city == typedOther.guest_city &&
        guest_address == typedOther.guest_address &&
        guest_zip_code == typedOther.guest_zip_code &&
        guest_phone_number == typedOther.guest_phone_number &&
        guest_e_mail == typedOther.guest_e_mail &&
        guest_fax_number == typedOther.guest_fax_number &&
        guest_language == typedOther.guest_language &&
        guest_state == typedOther.guest_state &&
        active_notes == typedOther.active_notes &&
        active_housekeeping_notes == typedOther.active_housekeeping_notes &&
        active_meals_notes == typedOther.active_meals_notes &&
        active_client_requests == typedOther.active_client_requests &&
        ota == typedOther.ota;
  }

  @override
  int get hashCode => hashObjects([
      pkid.hashCode,
      id.hashCode,
      number.hashCode,
      arrival.hashCode,
      departure.hashCode,
      arrival_room_type_id.hashCode,
      arrival_room_id.hashCode,
      adults.hashCode,
      children.hashCode,
      reference_number.hashCode,
      reference_date.hashCode,
      is_guaranteed.hashCode,
      rate_id.hashCode,
      source_of_business_company_id.hashCode,
      event_id.hashCode,
      block_id.hashCode,
      status_changed_at.hashCode,
      user_created_id.hashCode,
      user_updated_id.hashCode,
      status.hashCode,
      created_at.hashCode,
      updated_at.hashCode,
      marketing_source.hashCode,
      marketing_channel.hashCode,
      accept_charge_transfers.hashCode,
      guarantee_policy_id.hashCode,
      arrival_time.hashCode,
      transfer_arrival.hashCode,
      transfer_departure.hashCode,
      departure_time.hashCode,
      first_meal_id.hashCode,
      eating_object_id.hashCode,
      registration_cards_count.hashCode,
      confirmation_logs_count.hashCode,
      self_service_key.hashCode,
      self_service_pin.hashCode,
      source_id.hashCode,
      cancel_source_id.hashCode,
      links.hashCode,
      housekeeping_note.hashCode,
      commission_value_cents.hashCode,
      commission_currency.hashCode,
      commission_payment_date.hashCode,
      commission_checked.hashCode,
      commission_notes.hashCode,
      city_tax_mode.hashCode,
      citytax_adults.hashCode,
      citytax_children.hashCode,
      disable_room_change.hashCode,
      guest_first_name.hashCode,
      guest_middle_name.hashCode,
      guest_last_name.hashCode,
      guest_country.hashCode,
      guest_city.hashCode,
      guest_address.hashCode,
      guest_zip_code.hashCode,
      guest_phone_number.hashCode,
      guest_e_mail.hashCode,
      guest_fax_number.hashCode,
      guest_language.hashCode,
      guest_state.hashCode,
      active_notes.hashCode,
      active_housekeeping_notes.hashCode,
      active_meals_notes.hashCode,
      active_client_requests.hashCode,
      ota.hashCode,
  ]);

}

//==============================================================================
class BOOKINGS {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Bookings';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Booking';

  // Etiquetas de los Atributos

  static const String ETIQUETA_KEY = 'Key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ETIQUETA_PKID = 'pkid';
  static const String ETIQUETA_ID = 'id';
  static const String ETIQUETA_NUMBER = 'Número';
  static const String ETIQUETA_ARRIVAL = 'Llegada';
  static const String ETIQUETA_DEPARTURE = 'Salida';
  static const String ETIQUETA_ARRIVAL_ROOM_TYPE_ID = 'Tipo Habitación';
  static const String ETIQUETA_ARRIVAL_ROOM_ID = 'Habitación';
  static const String ETIQUETA_ADULTS = 'Adultos';
  static const String ETIQUETA_CHILDREN = 'Niños';
  static const String ETIQUETA_REFERENCE_NUMBER = 'Referencia';
  static const String ETIQUETA_REFERENCE_DATE = 'Fecha de Referencia';
  static const String ETIQUETA_IS_GUARANTEED = 'Garantizada';
  static const String ETIQUETA_RATE_ID = 'Precio';
  static const String ETIQUETA_SOURCE_OF_BUSINESS_COMPANY_ID = 'Compañía';
  static const String ETIQUETA_EVENT_ID = 'Evento';
  static const String ETIQUETA_BLOCK_ID = 'Bloque';
  static const String ETIQUETA_STATUS_CHANGED_AT = 'Estado Cambiado en';
  static const String ETIQUETA_USER_CREATED_ID = 'Creado por';
  static const String ETIQUETA_USER_UPDATED_ID = 'Actualizado por';
  static const String ETIQUETA_STATUS = 'Estado';
  static const String ETIQUETA_CREATED_AT = 'Creado';
  static const String ETIQUETA_UPDATED_AT = 'Actualizado';
  static const String ETIQUETA_MARKETING_SOURCE = 'Fuente Mercadeo';
  static const String ETIQUETA_MARKETING_CHANNEL = 'Canal de Mercadeo';
  static const String ETIQUETA_ACCEPT_CHARGE_TRANSFERS = 'Aceptar Cargos';
  static const String ETIQUETA_GUARANTEE_POLICY_ID = 'Política de Garantía';
  static const String ETIQUETA_ARRIVAL_TIME = 'Hora de llegada';
  static const String ETIQUETA_TRANSFER_ARRIVAL = 'Transfer Llegada';
  static const String ETIQUETA_TRANSFER_DEPARTURE = 'Transfer Salida';
  static const String ETIQUETA_DEPARTURE_TIME = 'Hora de Salida';
  static const String ETIQUETA_FIRST_MEAL_ID = 'Primera Comida';
  static const String ETIQUETA_EATING_OBJECT_ID = 'Objeto Comida';
  static const String ETIQUETA_REGISTRATION_CARDS_COUNT = 'Cant. Tarjetas Registro';
  static const String ETIQUETA_CONFIRMATION_LOGS_COUNT = 'Cant Logs Confirmación';
  static const String ETIQUETA_SELF_SERVICE_KEY = 'Clave Autoservicio';
  static const String ETIQUETA_SELF_SERVICE_PIN = 'PIN Autoservicio';
  static const String ETIQUETA_SOURCE_ID = 'Fuente';
  static const String ETIQUETA_CANCEL_SOURCE_ID = 'Cancelar Fuente';
  static const String ETIQUETA_LINKS = 'Enlaces';
  static const String ETIQUETA_HOUSEKEEPING_NOTE = 'Nota de Housekeeping';
  static const String ETIQUETA_COMMISSION_VALUE_CENTS = 'Centavos Valor Comisión';
  static const String ETIQUETA_COMMISSION_CURRENCY = 'Moneda Comisión';
  static const String ETIQUETA_COMMISSION_PAYMENT_DATE = 'Fecha Pago Comisión';
  static const String ETIQUETA_COMMISSION_CHECKED = 'Comisión Chequeada';
  static const String ETIQUETA_COMMISSION_NOTES = 'Notas Comisión';
  static const String ETIQUETA_CITY_TAX_MODE = 'Modo Tax Ciudad';
  static const String ETIQUETA_CITYTAX_ADULTS = 'Ciudad Tax Adultos';
  static const String ETIQUETA_CITYTAX_CHILDREN = 'Ciudad Tax Niños';
  static const String ETIQUETA_DISABLE_ROOM_CHANGE = 'Cambio de Habitación Deshabilitado';
  static const String ETIQUETA_GUEST_FIRST_NAME = 'Primer Nombre';
  static const String ETIQUETA_GUEST_MIDDLE_NAME = 'Segundo Nombre';
  static const String ETIQUETA_GUEST_LAST_NAME = 'Apellidos';
  static const String ETIQUETA_GUEST_COUNTRY = 'País';
  static const String ETIQUETA_GUEST_CITY = 'Ciudad';
  static const String ETIQUETA_GUEST_ADDRESS = 'Dirección';
  static const String ETIQUETA_GUEST_ZIP_CODE = 'Código Postal';
  static const String ETIQUETA_GUEST_PHONE_NUMBER = 'Teléfono';
  static const String ETIQUETA_GUEST_E_MAIL = 'Correo Electrónico';
  static const String ETIQUETA_GUEST_FAX_NUMBER = 'Fax';
  static const String ETIQUETA_GUEST_LANGUAGE = 'Idioma';
  static const String ETIQUETA_GUEST_STATE = 'Estado';
  static const String ETIQUETA_ACTIVE_NOTES = 'Notas';
  static const String ETIQUETA_ACTIVE_HOUSEKEEPING_NOTES = 'Notas Housekeeping';
  static const String ETIQUETA_ACTIVE_MEALS_NOTES = 'Notas Comidas';
  static const String ETIQUETA_ACTIVE_CLIENT_REQUESTS = 'Requerimientos del Cliente';
  static const String ETIQUETA_OTA = 'OTA';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'Bookings';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'Booking';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String KEY = 'key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String PKID = 'pkid';
  static const String ID = 'id';
  static const String NUMBER = 'number';
  static const String ARRIVAL = 'arrival';
  static const String DEPARTURE = 'departure';
  static const String ARRIVAL_ROOM_TYPE_ID = 'arrival_room_type_id';
  static const String ARRIVAL_ROOM_ID = 'arrival_room_id';
  static const String ADULTS = 'adults';
  static const String CHILDREN = 'children';
  static const String REFERENCE_NUMBER = 'reference_number';
  static const String REFERENCE_DATE = 'reference_date';
  static const String IS_GUARANTEED = 'is_guaranteed';
  static const String RATE_ID = 'rate_id';
  static const String SOURCE_OF_BUSINESS_COMPANY_ID = 'source_of_business_company_id';
  static const String EVENT_ID = 'event_id';
  static const String BLOCK_ID = 'block_id';
  static const String STATUS_CHANGED_AT = 'status_changed_at';
  static const String USER_CREATED_ID = 'user_created_id';
  static const String USER_UPDATED_ID = 'user_updated_id';
  static const String STATUS = 'status';
  static const String CREATED_AT = 'created_at';
  static const String UPDATED_AT = 'updated_at';
  static const String MARKETING_SOURCE = 'marketing_source';
  static const String MARKETING_CHANNEL = 'marketing_channel';
  static const String ACCEPT_CHARGE_TRANSFERS = 'accept_charge_transfers';
  static const String GUARANTEE_POLICY_ID = 'guarantee_policy_id';
  static const String ARRIVAL_TIME = 'arrival_time';
  static const String TRANSFER_ARRIVAL = 'transfer_arrival';
  static const String TRANSFER_DEPARTURE = 'transfer_departure';
  static const String DEPARTURE_TIME = 'departure_time';
  static const String FIRST_MEAL_ID = 'first_meal_id';
  static const String EATING_OBJECT_ID = 'eating_object_id';
  static const String REGISTRATION_CARDS_COUNT = 'registration_cards_count';
  static const String CONFIRMATION_LOGS_COUNT = 'confirmation_logs_count';
  static const String SELF_SERVICE_KEY = 'self_service_key';
  static const String SELF_SERVICE_PIN = 'self_service_pin';
  static const String SOURCE_ID = 'source_id';
  static const String CANCEL_SOURCE_ID = 'cancel_source_id';
  static const String LINKS = 'links';
  static const String HOUSEKEEPING_NOTE = 'housekeeping_note';
  static const String COMMISSION_VALUE_CENTS = 'commission_value_cents';
  static const String COMMISSION_CURRENCY = 'commission_currency';
  static const String COMMISSION_PAYMENT_DATE = 'commission_payment_date';
  static const String COMMISSION_CHECKED = 'commission_checked';
  static const String COMMISSION_NOTES = 'commission_notes';
  static const String CITY_TAX_MODE = 'city_tax_mode';
  static const String CITYTAX_ADULTS = 'citytax_adults';
  static const String CITYTAX_CHILDREN = 'citytax_children';
  static const String DISABLE_ROOM_CHANGE = 'disable_room_change';
  static const String GUEST_FIRST_NAME = 'guest_first_name';
  static const String GUEST_MIDDLE_NAME = 'guest_middle_name';
  static const String GUEST_LAST_NAME = 'guest_last_name';
  static const String GUEST_COUNTRY = 'guest_country';
  static const String GUEST_CITY = 'guest_city';
  static const String GUEST_ADDRESS = 'guest_address';
  static const String GUEST_ZIP_CODE = 'guest_zip_code';
  static const String GUEST_PHONE_NUMBER = 'guest_phone_number';
  static const String GUEST_E_MAIL = 'guest_e_mail';
  static const String GUEST_FAX_NUMBER = 'guest_fax_number';
  static const String GUEST_LANGUAGE = 'guest_language';
  static const String GUEST_STATE = 'guest_state';
  static const String ACTIVE_NOTES = 'active_notes';
  static const String ACTIVE_HOUSEKEEPING_NOTES = 'active_housekeeping_notes';
  static const String ACTIVE_MEALS_NOTES = 'active_meals_notes';
  static const String ACTIVE_CLIENT_REQUESTS = 'active_client_requests';
  static const String OTA = 'ota';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [
 KEY, PKID, ID, NUMBER, ARRIVAL, DEPARTURE, ARRIVAL_ROOM_TYPE_ID, ARRIVAL_ROOM_ID, ADULTS, CHILDREN, REFERENCE_NUMBER, REFERENCE_DATE, IS_GUARANTEED, RATE_ID, SOURCE_OF_BUSINESS_COMPANY_ID, EVENT_ID, BLOCK_ID, STATUS_CHANGED_AT, USER_CREATED_ID, USER_UPDATED_ID, STATUS, CREATED_AT, UPDATED_AT, MARKETING_SOURCE, MARKETING_CHANNEL, ACCEPT_CHARGE_TRANSFERS, GUARANTEE_POLICY_ID, ARRIVAL_TIME, TRANSFER_ARRIVAL, TRANSFER_DEPARTURE, DEPARTURE_TIME, FIRST_MEAL_ID, EATING_OBJECT_ID, REGISTRATION_CARDS_COUNT, CONFIRMATION_LOGS_COUNT, SELF_SERVICE_KEY, SELF_SERVICE_PIN, SOURCE_ID, CANCEL_SOURCE_ID, LINKS, HOUSEKEEPING_NOTE, COMMISSION_VALUE_CENTS, COMMISSION_CURRENCY, COMMISSION_PAYMENT_DATE, COMMISSION_CHECKED, COMMISSION_NOTES, CITY_TAX_MODE, CITYTAX_ADULTS, CITYTAX_CHILDREN, DISABLE_ROOM_CHANGE, GUEST_FIRST_NAME, GUEST_MIDDLE_NAME, GUEST_LAST_NAME, GUEST_COUNTRY, GUEST_CITY, GUEST_ADDRESS, GUEST_ZIP_CODE, GUEST_PHONE_NUMBER, GUEST_E_MAIL, GUEST_FAX_NUMBER, GUEST_LANGUAGE, GUEST_STATE, ACTIVE_NOTES, ACTIVE_HOUSEKEEPING_NOTES, ACTIVE_MEALS_NOTES, ACTIVE_CLIENT_REQUESTS, OTA,];
  static const List CAMPOS_DETALLE = [
 KEY, PKID, ID, NUMBER, ARRIVAL, DEPARTURE, ARRIVAL_ROOM_TYPE_ID, ARRIVAL_ROOM_ID, ADULTS, CHILDREN, REFERENCE_NUMBER, REFERENCE_DATE, IS_GUARANTEED, RATE_ID, SOURCE_OF_BUSINESS_COMPANY_ID, EVENT_ID, BLOCK_ID, STATUS_CHANGED_AT, USER_CREATED_ID, USER_UPDATED_ID, STATUS, CREATED_AT, UPDATED_AT, MARKETING_SOURCE, MARKETING_CHANNEL, ACCEPT_CHARGE_TRANSFERS, GUARANTEE_POLICY_ID, ARRIVAL_TIME, TRANSFER_ARRIVAL, TRANSFER_DEPARTURE, DEPARTURE_TIME, FIRST_MEAL_ID, EATING_OBJECT_ID, REGISTRATION_CARDS_COUNT, CONFIRMATION_LOGS_COUNT, SELF_SERVICE_KEY, SELF_SERVICE_PIN, SOURCE_ID, CANCEL_SOURCE_ID, LINKS, HOUSEKEEPING_NOTE, COMMISSION_VALUE_CENTS, COMMISSION_CURRENCY, COMMISSION_PAYMENT_DATE, COMMISSION_CHECKED, COMMISSION_NOTES, CITY_TAX_MODE, CITYTAX_ADULTS, CITYTAX_CHILDREN, DISABLE_ROOM_CHANGE, GUEST_FIRST_NAME, GUEST_MIDDLE_NAME, GUEST_LAST_NAME, GUEST_COUNTRY, GUEST_CITY, GUEST_ADDRESS, GUEST_ZIP_CODE, GUEST_PHONE_NUMBER, GUEST_E_MAIL, GUEST_FAX_NUMBER, GUEST_LANGUAGE, GUEST_STATE, ACTIVE_NOTES, ACTIVE_HOUSEKEEPING_NOTES, ACTIVE_MEALS_NOTES, ACTIVE_CLIENT_REQUESTS, OTA,];

}
