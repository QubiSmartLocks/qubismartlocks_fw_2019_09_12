/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Bookings
 [//Bookings]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIBookingsLista extends StatefulWidget {
  static const String ruta = '/ui-clientes/lista';

  @override
  _UIBookingsListaState createState() => _UIBookingsListaState();
}

class _UIBookingsListaState extends State<UIBookingsLista> {

  _BookingsDataSource _clientesDataSource;

  List<Booking> listaBookings = List<Booking>();

  int _rowsPerPage = 3; //PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;

  void _sort<T>(
      Comparable<T> getField(Booking d), int columnIndex, bool ascending) {
    _clientesDataSource._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  _inicializar() async {
    Bookings.todos(listaBookings).then((r) {
      _clientesDataSource.listaBookings.clear();
      _clientesDataSource.listaBookings.addAll(this.listaBookings);
      _clientesDataSource.notifyListeners();
      setState((){});
    });
  }

  @override
  void initState() {
    _clientesDataSource = _BookingsDataSource(context, List<Booking>());
    _inicializar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    CD.iniciar(context);

    double headerHeight = AppRes.appResMap[Co.LISTA_ALTO_ENCABEZADO];
    double columnSpacing = AppRes.appResMap[Co.LISTA_ESPACIO_ENTRE_COLUMNAS];
    double dataRowHeight = AppRes.appResMap[Co.LISTA_ALTO_FILA];
    double headingRowHeight = AppRes.appResMap[Co.LISTA_ALTO_TITULOS];
    double altoTotal = CD.alto * AppRes.appResMap[Co.LISTA_FACTOR_ALTO_TOTAL];
    double anchoTotal = CD.ancho * AppRes.appResMap[Co.LISTA_FACTOR_ANCHO_TOTAL];
    double footerHeight = AppRes.appResMap[Co.LISTA_ALTO_PIE_PAGINACION];
    _rowsPerPage =
        ((altoTotal
            - headerHeight
            - headingRowHeight
            - footerHeight) / dataRowHeight).toInt() - 1;

    List<int> availableRowsPerPage = [_rowsPerPage];
    return Stack(
      children: <Widget>[
              Container(
                width: anchoTotal,
                height: altoTotal,
                padding: EdgeInsets.all(5),
                child: PaginatedDataTable(
                    header: Container(),
                    columnSpacing: columnSpacing,
                    dataRowHeight: dataRowHeight,
                    headingRowHeight: headingRowHeight,
                    horizontalMargin: 24.0,
                    rowsPerPage: _rowsPerPage,
                    onRowsPerPageChanged: (int value) {
                      setState(() {
                        _rowsPerPage = value;
                      });
                    },
                    sortColumnIndex: _sortColumnIndex,
                    sortAscending: _sortAscending,
                    onSelectAll: _clientesDataSource._selectAll,
                    availableRowsPerPage: availableRowsPerPage,
                    dragStartBehavior: DragStartBehavior.down,
                    columns: <DataColumn>[
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_NUMBER),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Booking d) => d.number,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_ARRIVAL),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<DateTime>((Booking d) => d.arrival,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_DEPARTURE),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<DateTime>((Booking d) => d.departure,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_ARRIVAL_ROOM_TYPE_ID),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<num>((Booking d) => d.arrival_room_type_id,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_ARRIVAL_ROOM_ID),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<num>((Booking d) => d.arrival_room_id,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_ADULTS),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<num>((Booking d) => d.adults,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_CHILDREN),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<num>((Booking d) => d.children,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_REFERENCE_NUMBER),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Booking d) => d.reference_number,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_REFERENCE_DATE),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<DateTime>((Booking d) => d.reference_date,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_IS_GUARANTEED),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_RATE_ID),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<num>((Booking d) => d.rate_id,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_SOURCE_OF_BUSINESS_COMPANY_ID),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<num>((Booking d) => d.source_of_business_company_id,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_EVENT_ID),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<num>((Booking d) => d.event_id,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_BLOCK_ID),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<num>((Booking d) => d.block_id,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_STATUS_CHANGED_AT),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<DateTime>((Booking d) => d.status_changed_at,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_USER_CREATED_ID),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<num>((Booking d) => d.user_created_id,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_USER_UPDATED_ID),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<num>((Booking d) => d.user_updated_id,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_STATUS),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Booking d) => d.status,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_CREATED_AT),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<DateTime>((Booking d) => d.created_at,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_UPDATED_AT),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<DateTime>((Booking d) => d.updated_at,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_MARKETING_SOURCE),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Booking d) => d.marketing_source,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_MARKETING_CHANNEL),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Booking d) => d.marketing_channel,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_ACCEPT_CHARGE_TRANSFERS),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_GUARANTEE_POLICY_ID),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<num>((Booking d) => d.guarantee_policy_id,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_ARRIVAL_TIME),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Booking d) => d.arrival_time,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_TRANSFER_ARRIVAL),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Booking d) => d.transfer_arrival,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_TRANSFER_DEPARTURE),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Booking d) => d.transfer_departure,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_DEPARTURE_TIME),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Booking d) => d.departure_time,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_FIRST_MEAL_ID),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<num>((Booking d) => d.first_meal_id,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_EATING_OBJECT_ID),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<num>((Booking d) => d.eating_object_id,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_REGISTRATION_CARDS_COUNT),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<num>((Booking d) => d.registration_cards_count,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_CONFIRMATION_LOGS_COUNT),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<num>((Booking d) => d.confirmation_logs_count,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_SELF_SERVICE_KEY),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Booking d) => d.self_service_key,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_SELF_SERVICE_PIN),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Booking d) => d.self_service_pin,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_SOURCE_ID),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<num>((Booking d) => d.source_id,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_CANCEL_SOURCE_ID),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<num>((Booking d) => d.cancel_source_id,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_LINKS),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Booking d) => d.links,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_HOUSEKEEPING_NOTE),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Booking d) => d.housekeeping_note,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_COMMISSION_VALUE_CENTS),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<num>((Booking d) => d.commission_value_cents,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_COMMISSION_CURRENCY),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Booking d) => d.commission_currency,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_COMMISSION_PAYMENT_DATE),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<DateTime>((Booking d) => d.commission_payment_date,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_COMMISSION_CHECKED),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_COMMISSION_NOTES),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Booking d) => d.commission_notes,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_CITY_TAX_MODE),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Booking d) => d.city_tax_mode,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_CITYTAX_ADULTS),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<num>((Booking d) => d.citytax_adults,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_CITYTAX_CHILDREN),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<num>((Booking d) => d.citytax_children,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_DISABLE_ROOM_CHANGE),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_GUEST_FIRST_NAME),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Booking d) => d.guest_first_name,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_GUEST_MIDDLE_NAME),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Booking d) => d.guest_middle_name,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_GUEST_LAST_NAME),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Booking d) => d.guest_last_name,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_GUEST_COUNTRY),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Booking d) => d.guest_country,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_GUEST_CITY),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Booking d) => d.guest_city,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_GUEST_ADDRESS),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Booking d) => d.guest_address,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_GUEST_ZIP_CODE),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Booking d) => d.guest_zip_code,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_GUEST_PHONE_NUMBER),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Booking d) => d.guest_phone_number,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_GUEST_E_MAIL),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Booking d) => d.guest_e_mail,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_GUEST_FAX_NUMBER),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Booking d) => d.guest_fax_number,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_GUEST_LANGUAGE),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Booking d) => d.guest_language,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_GUEST_STATE),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Booking d) => d.guest_state,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_ACTIVE_NOTES),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Booking d) => d.active_notes,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_ACTIVE_HOUSEKEEPING_NOTES),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Booking d) => d.active_housekeeping_notes,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_ACTIVE_MEALS_NOTES),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Booking d) => d.active_meals_notes,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_ACTIVE_CLIENT_REQUESTS),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Booking d) => d.active_client_requests,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(BOOKINGS.ETIQUETA_OTA),),
              ],
              source: _clientesDataSource),
        ),
        UI__Mensaje(
          _clientesDataSource.listaBookings.length == 0,
          'Leyendo ${BOOKINGS.ETIQUETA_ENTIDAD}...',
        ),
      ],
    );
  }
}


class _BookingsDataSource extends DataTableSource {
  _BookingsDataSource(this.context, this.listaBookings);

  final List<Booking> listaBookings; 
  final BuildContext context;

  _editarBooking(Booking registro) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIBookingEdicion(registro: registro)),
    );
  }

  void _sort<T>(Comparable<T> getField(Booking d), bool ascending) {
    listaBookings.sort((Booking a, Booking b) {
      if (!ascending) {
        final Booking c = a;
        a = b;
        b = c;
      }
      final Comparable<T> aValue = getField(a);
      final Comparable<T> bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }

  int _selectedCount = 0;

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= listaBookings.length) return null;
    final Booking booking = listaBookings[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(
          UI__EtiquetaCelda(booking.number == null
              ? ''
              : '${booking.number}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.arrival == null
              ? ''
              : '${booking.arrival}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.departure == null
              ? ''
              : '${booking.departure}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.arrival_room_type_id == null
              ? ''
              : '${booking.arrival_room_type_id}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.arrival_room_id == null
              ? ''
              : '${booking.arrival_room_id}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.adults == null
              ? ''
              : '${booking.adults}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.children == null
              ? ''
              : '${booking.children}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.reference_number == null
              ? ''
              : '${booking.reference_number}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.reference_date == null
              ? ''
              : '${booking.reference_date}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.is_guaranteed == null
              ? ''
              : '${booking.is_guaranteed}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.rate_id == null
              ? ''
              : '${booking.rate_id}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.source_of_business_company_id == null
              ? ''
              : '${booking.source_of_business_company_id}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.event_id == null
              ? ''
              : '${booking.event_id}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.block_id == null
              ? ''
              : '${booking.block_id}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.status_changed_at == null
              ? ''
              : '${booking.status_changed_at}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.user_created_id == null
              ? ''
              : '${booking.user_created_id}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.user_updated_id == null
              ? ''
              : '${booking.user_updated_id}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.status == null
              ? ''
              : '${booking.status}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.created_at == null
              ? ''
              : '${booking.created_at}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.updated_at == null
              ? ''
              : '${booking.updated_at}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.marketing_source == null
              ? ''
              : '${booking.marketing_source}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.marketing_channel == null
              ? ''
              : '${booking.marketing_channel}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.accept_charge_transfers == null
              ? ''
              : '${booking.accept_charge_transfers}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.guarantee_policy_id == null
              ? ''
              : '${booking.guarantee_policy_id}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.arrival_time == null
              ? ''
              : '${booking.arrival_time}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.transfer_arrival == null
              ? ''
              : '${booking.transfer_arrival}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.transfer_departure == null
              ? ''
              : '${booking.transfer_departure}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.departure_time == null
              ? ''
              : '${booking.departure_time}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.first_meal_id == null
              ? ''
              : '${booking.first_meal_id}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.eating_object_id == null
              ? ''
              : '${booking.eating_object_id}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.registration_cards_count == null
              ? ''
              : '${booking.registration_cards_count}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.confirmation_logs_count == null
              ? ''
              : '${booking.confirmation_logs_count}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.self_service_key == null
              ? ''
              : '${booking.self_service_key}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.self_service_pin == null
              ? ''
              : '${booking.self_service_pin}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.source_id == null
              ? ''
              : '${booking.source_id}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.cancel_source_id == null
              ? ''
              : '${booking.cancel_source_id}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.links == null
              ? ''
              : '${booking.links}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.housekeeping_note == null
              ? ''
              : '${booking.housekeeping_note}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.commission_value_cents == null
              ? ''
              : '${booking.commission_value_cents}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.commission_currency == null
              ? ''
              : '${booking.commission_currency}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.commission_payment_date == null
              ? ''
              : '${booking.commission_payment_date}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.commission_checked == null
              ? ''
              : '${booking.commission_checked}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.commission_notes == null
              ? ''
              : '${booking.commission_notes}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.city_tax_mode == null
              ? ''
              : '${booking.city_tax_mode}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.citytax_adults == null
              ? ''
              : '${booking.citytax_adults}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.citytax_children == null
              ? ''
              : '${booking.citytax_children}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.disable_room_change == null
              ? ''
              : '${booking.disable_room_change}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.guest_first_name == null
              ? ''
              : '${booking.guest_first_name}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.guest_middle_name == null
              ? ''
              : '${booking.guest_middle_name}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.guest_last_name == null
              ? ''
              : '${booking.guest_last_name}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.guest_country == null
              ? ''
              : '${booking.guest_country}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.guest_city == null
              ? ''
              : '${booking.guest_city}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.guest_address == null
              ? ''
              : '${booking.guest_address}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.guest_zip_code == null
              ? ''
              : '${booking.guest_zip_code}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.guest_phone_number == null
              ? ''
              : '${booking.guest_phone_number}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.guest_e_mail == null
              ? ''
              : '${booking.guest_e_mail}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.guest_fax_number == null
              ? ''
              : '${booking.guest_fax_number}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.guest_language == null
              ? ''
              : '${booking.guest_language}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.guest_state == null
              ? ''
              : '${booking.guest_state}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.active_notes == null
              ? ''
              : '${booking.active_notes}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.active_housekeeping_notes == null
              ? ''
              : '${booking.active_housekeeping_notes}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.active_meals_notes == null
              ? ''
              : '${booking.active_meals_notes}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.active_client_requests == null
              ? ''
              : '${booking.active_client_requests}'),
          onTap: _editarBooking(booking),
        ),
        DataCell(
          UI__EtiquetaCelda(booking.ota == null
              ? ''
              : '${booking.ota}'),
          onTap: _editarBooking(booking),
        ),
      ],
    );
  }

  @override
  int get rowCount => listaBookings.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool checked) {
  }
}

