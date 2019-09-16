/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Bookings -> Inicializar Booking
 [Qubi Smart Locks]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class InicializarBookings {
  static init() async {
    int i = 1;
    Booking _booking;

    _booking = new Booking();
    _booking.pkid = 0;
    _booking.id = i++;
    _booking.number = '';
    _booking.arrival = DateTime.now();
    _booking.departure = DateTime.now();
    _booking.arrival_room_type_id = 0;
    _booking.arrival_room_id = 0;
    _booking.adults = 0;
    _booking.children = 0;
    _booking.reference_number = '';
    _booking.reference_date = DateTime.now();
    _booking.is_guaranteed = false;
    _booking.rate_id = 0;
    _booking.source_of_business_company_id = 0;
    _booking.event_id = 0;
    _booking.block_id = 0;
    _booking.status_changed_at = new DateTime.now();
    _booking.user_created_id = 0;
    _booking.user_updated_id = 0;
    _booking.status = '';
    _booking.created_at = new DateTime.now();
    _booking.updated_at = new DateTime.now();
    _booking.marketing_source = '';
    _booking.marketing_channel = '';
    _booking.accept_charge_transfers = false;
    _booking.guarantee_policy_id = 0;
    _booking.arrival_time = '';
    _booking.transfer_arrival = '';
    _booking.transfer_departure = '';
    _booking.departure_time = '';
    _booking.first_meal_id = 0;
    _booking.eating_object_id = 0;
    _booking.registration_cards_count = 0;
    _booking.confirmation_logs_count = 0;
    _booking.self_service_key = '';
    _booking.self_service_pin = '';
    _booking.source_id = 0;
    _booking.cancel_source_id = 0;
    _booking.links = '';
    _booking.housekeeping_note = '';
    _booking.commission_value_cents = 0;
    _booking.commission_currency = '';
    _booking.commission_payment_date = DateTime.now();
    _booking.commission_checked = false;
    _booking.commission_notes = '';
    _booking.city_tax_mode = '';
    _booking.citytax_adults = 0;
    _booking.citytax_children = 0;
    _booking.disable_room_change = false;
    _booking.guest_first_name = '';
    _booking.guest_middle_name = '';
    _booking.guest_last_name = '';
    _booking.guest_country = '';
    _booking.guest_city = '';
    _booking.guest_address = '';
    _booking.guest_zip_code = '';
    _booking.guest_phone_number = '';
    _booking.guest_e_mail = '';
    _booking.guest_fax_number = '';
    _booking.guest_language = '';
    _booking.guest_state = '';
    _booking.active_notes = '';
    _booking.active_housekeeping_notes = '';
    _booking.active_meals_notes = '';
    _booking.active_client_requests = '';
    _booking.ota = false;
    // Guarda usando el API
//    await Bookings.guardar(_booking);
    // Guarda usando Firebase Realtime Database
//    await BookingsFB.guardarBooking(booking: _booking);
    DEM.listaBookings.add(_booking);

  }
}
