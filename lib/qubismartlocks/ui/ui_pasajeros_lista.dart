/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Pasajeros
 [//Pasajeros]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIPasajerosLista extends StatefulWidget {
  static const String ruta = '/ui-clientes/lista';

  @override
  _UIPasajerosListaState createState() => _UIPasajerosListaState();
}

class _UIPasajerosListaState extends State<UIPasajerosLista> {

  _PasajerosDataSource _clientesDataSource;

  List<Pasajero> listaPasajeros = List<Pasajero>();

  int _rowsPerPage = 3; //PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;

  void _sort<T>(
      Comparable<T> getField(Pasajero d), int columnIndex, bool ascending) {
    _clientesDataSource._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  _inicializar() async {
    Pasajeros.todos(listaPasajeros).then((r) {
      _clientesDataSource.listaPasajeros.clear();
      _clientesDataSource.listaPasajeros.addAll(this.listaPasajeros);
      _clientesDataSource.notifyListeners();
      setState((){});
    });
  }

  @override
  void initState() {
    _clientesDataSource = _PasajerosDataSource(context, List<Pasajero>());
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
                          label: UI__EtiquetaColumna(PASAJEROS.ETIQUETA_RESERVACION),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<num>((Pasajero d) => d.reservacion,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(PASAJEROS.ETIQUETA_NOMBRES),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Pasajero d) => d.nombres,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(PASAJEROS.ETIQUETA_APELLIDOS),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Pasajero d) => d.apellidos,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(PASAJEROS.ETIQUETA_LLAVEELECTRONICA),),
              ],
              source: _clientesDataSource),
        ),
        UI__Mensaje(
          _clientesDataSource.listaPasajeros.length == 0,
          'Leyendo ${PASAJEROS.ETIQUETA_ENTIDAD}...',
        ),
      ],
    );
  }
}


class _PasajerosDataSource extends DataTableSource {
  _PasajerosDataSource(this.context, this.listaPasajeros);

  final List<Pasajero> listaPasajeros; 
  final BuildContext context;

  _editarPasajero(Pasajero registro) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIPasajeroEdicion(registro: registro)),
    );
  }

  void _sort<T>(Comparable<T> getField(Pasajero d), bool ascending) {
    listaPasajeros.sort((Pasajero a, Pasajero b) {
      if (!ascending) {
        final Pasajero c = a;
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
    if (index >= listaPasajeros.length) return null;
    final Pasajero pasajero = listaPasajeros[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(
          UI__EtiquetaCelda(pasajero.reservacion == null
              ? ''
              : '${pasajero.reservacion}'),
          onTap: _editarPasajero(pasajero),
        ),
        DataCell(
          UI__EtiquetaCelda(pasajero.nombres == null
              ? ''
              : '${pasajero.nombres}'),
          onTap: _editarPasajero(pasajero),
        ),
        DataCell(
          UI__EtiquetaCelda(pasajero.apellidos == null
              ? ''
              : '${pasajero.apellidos}'),
          onTap: _editarPasajero(pasajero),
        ),
        DataCell(
          UI__EtiquetaCelda(pasajero.llaveElectronica == null
              ? ''
              : '${pasajero.llaveElectronica}'),
          onTap: _editarPasajero(pasajero),
        ),
      ],
    );
  }

  @override
  int get rowCount => listaPasajeros.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool checked) {
  }
}

