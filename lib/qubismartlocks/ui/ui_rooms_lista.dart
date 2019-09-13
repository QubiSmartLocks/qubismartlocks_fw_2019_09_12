/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Rooms
 [//Rooms]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIRoomsLista extends StatefulWidget {
  static const String ruta = '/ui-clientes/lista';

  @override
  _UIRoomsListaState createState() => _UIRoomsListaState();
}

class _UIRoomsListaState extends State<UIRoomsLista> {

  _RoomsDataSource _clientesDataSource;

  List<Room> listaRooms = List<Room>();

  int _rowsPerPage = 3; //PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;

  void _sort<T>(
      Comparable<T> getField(Room d), int columnIndex, bool ascending) {
    _clientesDataSource._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  _inicializar() async {
    Rooms.todos(listaRooms).then((r) {
      _clientesDataSource.listaRooms.clear();
      _clientesDataSource.listaRooms.addAll(this.listaRooms);
      _clientesDataSource.notifyListeners();
      setState((){});
    });
  }

  @override
  void initState() {
    _clientesDataSource = _RoomsDataSource(context, List<Room>());
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
                          label: UI__EtiquetaColumna(ROOMS.ETIQUETA_NAME),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Room d) => d.name,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(ROOMS.ETIQUETA_ROOM_TYPE_ID),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<num>((Room d) => d.room_type_id,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(ROOMS.ETIQUETA_HOUSEKEEPING_WARNING),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Room d) => d.housekeeping_warning,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(ROOMS.ETIQUETA_HOUSEKEEPING_STATUS),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Room d) => d.housekeeping_status,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(ROOMS.ETIQUETA_DESCRIPTION),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Room d) => d.description,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(ROOMS.ETIQUETA_SORT_ORDER),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<num>((Room d) => d.sort_order,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(ROOMS.ETIQUETA_LOCATION_ID),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<num>((Room d) => d.location_id,
                            columnIndex, ascending,),),
              ],
              source: _clientesDataSource),
        ),
        UI__Mensaje(
          _clientesDataSource.listaRooms.length == 0,
          'Leyendo ${ROOMS.ETIQUETA_ENTIDAD}...',
        ),
      ],
    );
  }
}


class _RoomsDataSource extends DataTableSource {
  _RoomsDataSource(this.context, this.listaRooms);

  final List<Room> listaRooms; 
  final BuildContext context;

  _editarRoom(Room registro) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIRoomEdicion(registro: registro)),
    );
  }

  void _sort<T>(Comparable<T> getField(Room d), bool ascending) {
    listaRooms.sort((Room a, Room b) {
      if (!ascending) {
        final Room c = a;
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
    if (index >= listaRooms.length) return null;
    final Room room = listaRooms[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(
          UI__EtiquetaCelda(room.name == null
              ? ''
              : '${room.name}'),
          onTap: _editarRoom(room),
        ),
        DataCell(
          UI__EtiquetaCelda(room.room_type_id == null
              ? ''
              : '${room.room_type_id}'),
          onTap: _editarRoom(room),
        ),
        DataCell(
          UI__EtiquetaCelda(room.housekeeping_warning == null
              ? ''
              : '${room.housekeeping_warning}'),
          onTap: _editarRoom(room),
        ),
        DataCell(
          UI__EtiquetaCelda(room.housekeeping_status == null
              ? ''
              : '${room.housekeeping_status}'),
          onTap: _editarRoom(room),
        ),
        DataCell(
          UI__EtiquetaCelda(room.description == null
              ? ''
              : '${room.description}'),
          onTap: _editarRoom(room),
        ),
        DataCell(
          UI__EtiquetaCelda(room.sort_order == null
              ? ''
              : '${room.sort_order}'),
          onTap: _editarRoom(room),
        ),
        DataCell(
          UI__EtiquetaCelda(room.location_id == null
              ? ''
              : '${room.location_id}'),
          onTap: _editarRoom(room),
        ),
      ],
    );
  }

  @override
  int get rowCount => listaRooms.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool checked) {
  }
}

