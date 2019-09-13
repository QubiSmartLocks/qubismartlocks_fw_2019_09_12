/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Bookings
 [Clock PMS (Api Reservaciones)/Clock PMS (Api Reservaciones)/Bookings]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class BookingItem extends StatefulWidget {
  BookingItem({
    this.registro,
    this.lista,
    this.animation,
  });

  final List<Booking> lista;
  final Booking registro;
  final Animation animation;

  @override
  _BookingItemState createState() => _BookingItemState();
}

class _BookingItemState extends State<BookingItem> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          GlobalKey<ScaffoldState> key = Scaffold.of(context).widget.key;

          Resultado _resultado = await  Bookings.registro(widget.registro.id, widget.registro);
          if (_resultado.estado == Co.REGISTRO_BORRADO) {
            mensajeError(key.currentState, Co.MENSAJE_REGISTRO_BORRADO);
            widget.lista.remove(widget.registro);
          }
          if (_resultado.estado == Co.OK) {
            widget.registro.assign(_resultado.objeto);
            Booking registroEnEdicion = Booking();
            registroEnEdicion.assign(widget.registro);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) =>
                FBookingsEdicion(
                  registro: registroEnEdicion,
                ),
              ),
            ).then((resultado) {
              if (resultado != null) {
                if (resultado.estado == Co.OK) {
                  widget.registro.assign(registroEnEdicion);
                }
                if (resultado.estado == Co.REGISTRO_BORRADO) {
                  widget.lista.remove(widget.registro);
                }
              }
              setState(() {});
            });
          }
        },
        child: Container(
          // height: Co.ALTO_ITEMS_LISTADOS,
          width: CD.ancho,
          color: AppRes.appResMap[Co.COLOR_FONDO_ITEM_LISTA],
          margin: const EdgeInsets.symmetric(vertical: Co.MARGEN_ITEMS_LISTADOS_VERTICAL),
          padding: const EdgeInsets.all(Co.PADDING_ITEMS_LISTADOS_VERTICAL),

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.registro.number,
                      style: estiloListados),
                  Text(widget.registro.arrival.toString(),
                      style: estiloListados),
                  Text(widget.registro.departure.toString(),
                      style: estiloListados),
                  Text(widget.registro.arrival_room_type_id.toString(),
                      style: estiloListados),
                  Text(widget.registro.arrival_room_id.toString(),
                      style: estiloListados),
                  Text(widget.registro.adults.toString(),
                      style: estiloListados),
                  Text(widget.registro.children.toString(),
                      style: estiloListados),
                  Text(widget.registro.reference_number,
                      style: estiloListados),
                  Text(widget.registro.reference_date.toString(),
                      style: estiloListados),
                  Text(widget.registro.is_guaranteed.toString(),
                      style: estiloListados),
                  Text(widget.registro.rate_id.toString(),
                      style: estiloListados),
                  Text(widget.registro.source_of_business_company_id.toString(),
                      style: estiloListados),
                  Text(widget.registro.event_id.toString(),
                      style: estiloListados),
                  Text(widget.registro.block_id.toString(),
                      style: estiloListados),
                  Text(widget.registro.status_changed_at.toString(),
                      style: estiloListados),
                  Text(widget.registro.user_created_id.toString(),
                      style: estiloListados),
                  Text(widget.registro.user_updated_id.toString(),
                      style: estiloListados),
                  Text(widget.registro.status,
                      style: estiloListados),
                  Text(widget.registro.created_at.toString(),
                      style: estiloListados),
                  Text(widget.registro.updated_at.toString(),
                      style: estiloListados),
                  Text(widget.registro.marketing_source,
                      style: estiloListados),
                  Text(widget.registro.marketing_channel,
                      style: estiloListados),
                  Text(widget.registro.accept_charge_transfers.toString(),
                      style: estiloListados),
                  Text(widget.registro.guarantee_policy_id.toString(),
                      style: estiloListados),
                  Text(widget.registro.arrival_time,
                      style: estiloListados),
                  Text(widget.registro.transfer_arrival,
                      style: estiloListados),
                  Text(widget.registro.transfer_departure,
                      style: estiloListados),
                  Text(widget.registro.departure_time,
                      style: estiloListados),
                  Text(widget.registro.first_meal_id.toString(),
                      style: estiloListados),
                  Text(widget.registro.eating_object_id.toString(),
                      style: estiloListados),
                  Text(widget.registro.registration_cards_count.toString(),
                      style: estiloListados),
                  Text(widget.registro.confirmation_logs_count.toString(),
                      style: estiloListados),
                  Text(widget.registro.self_service_key,
                      style: estiloListados),
                  Text(widget.registro.self_service_pin,
                      style: estiloListados),
                  Text(widget.registro.source_id.toString(),
                      style: estiloListados),
                  Text(widget.registro.cancel_source_id.toString(),
                      style: estiloListados),
                  Text(widget.registro.links,
                      style: estiloListados),
                  Text(widget.registro.housekeeping_note,
                      style: estiloListados),
                  Text(widget.registro.commission_value_cents.toString(),
                      style: estiloListados),
                  Text(widget.registro.commission_currency,
                      style: estiloListados),
                  Text(widget.registro.commission_payment_date.toString(),
                      style: estiloListados),
                  Text(widget.registro.commission_checked.toString(),
                      style: estiloListados),
                  Text(widget.registro.commission_notes,
                      style: estiloListados),
                  Text(widget.registro.city_tax_mode,
                      style: estiloListados),
                  Text(widget.registro.citytax_adults.toString(),
                      style: estiloListados),
                  Text(widget.registro.citytax_children.toString(),
                      style: estiloListados),
                  Text(widget.registro.disable_room_change.toString(),
                      style: estiloListados),
                  Text(widget.registro.guest_first_name,
                      style: estiloListados),
                  Text(widget.registro.guest_middle_name,
                      style: estiloListados),
                  Text(widget.registro.guest_last_name,
                      style: estiloListados),
                  Text(widget.registro.guest_country,
                      style: estiloListados),
                  Text(widget.registro.guest_city,
                      style: estiloListados),
                  Text(widget.registro.guest_address,
                      style: estiloListados),
                  Text(widget.registro.guest_zip_code,
                      style: estiloListados),
                  Text(widget.registro.guest_phone_number,
                      style: estiloListados),
                  Text(widget.registro.guest_e_mail,
                      style: estiloListados),
                  Text(widget.registro.guest_fax_number,
                      style: estiloListados),
                  Text(widget.registro.guest_language,
                      style: estiloListados),
                  Text(widget.registro.guest_state,
                      style: estiloListados),
                  Text(widget.registro.active_notes,
                      style: estiloListados),
                  Text(widget.registro.active_housekeeping_notes,
                      style: estiloListados),
                  Text(widget.registro.active_meals_notes,
                      style: estiloListados),
                  Text(widget.registro.active_client_requests,
                      style: estiloListados),
                  Text(widget.registro.ota.toString(),
                      style: estiloListados),
                ],
              )
            ],
          )
        ),
    );
  }
}
