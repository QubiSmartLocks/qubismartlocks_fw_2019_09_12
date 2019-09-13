/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Orígenes de Paquetes
 [//Orígenes de Paquetes]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIOrigenesPaquetesLista extends StatefulWidget {
  static const String ruta = '/ui-clientes/lista';

  @override
  _UIOrigenesPaquetesListaState createState() => _UIOrigenesPaquetesListaState();
}

class _UIOrigenesPaquetesListaState extends State<UIOrigenesPaquetesLista> {

  _OrigenesPaquetesDataSource _clientesDataSource;

  List<OrigenPaquete> listaOrigenesPaquetes = List<OrigenPaquete>();

  int _rowsPerPage = 3; //PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;

  void _sort<T>(
      Comparable<T> getField(OrigenPaquete d), int columnIndex, bool ascending) {
    _clientesDataSource._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  _inicializar() async {
    OrigenesPaquetes.todos(listaOrigenesPaquetes).then((r) {
      _clientesDataSource.listaOrigenesPaquetes.clear();
      _clientesDataSource.listaOrigenesPaquetes.addAll(this.listaOrigenesPaquetes);
      _clientesDataSource.notifyListeners();
      setState((){});
    });
  }

  @override
  void initState() {
    _clientesDataSource = _OrigenesPaquetesDataSource(context, List<OrigenPaquete>());
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
                          label: UI__EtiquetaColumna(ORIGENESPAQUETES.ETIQUETA_DENOMORIGENPAQUETE),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((OrigenPaquete d) => d.denomOrigenPaquete,
                            columnIndex, ascending,),),
              ],
              source: _clientesDataSource),
        ),
        UI__Mensaje(
          _clientesDataSource.listaOrigenesPaquetes.length == 0,
          'Leyendo ${ORIGENESPAQUETES.ETIQUETA_ENTIDAD}...',
        ),
      ],
    );
  }
}


class _OrigenesPaquetesDataSource extends DataTableSource {
  _OrigenesPaquetesDataSource(this.context, this.listaOrigenesPaquetes);

  final List<OrigenPaquete> listaOrigenesPaquetes; 
  final BuildContext context;

  _editarOrigenPaquete(OrigenPaquete registro) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIOrigenPaqueteEdicion(registro: registro)),
    );
  }

  void _sort<T>(Comparable<T> getField(OrigenPaquete d), bool ascending) {
    listaOrigenesPaquetes.sort((OrigenPaquete a, OrigenPaquete b) {
      if (!ascending) {
        final OrigenPaquete c = a;
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
    if (index >= listaOrigenesPaquetes.length) return null;
    final OrigenPaquete origenPaquete = listaOrigenesPaquetes[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(
          UI__EtiquetaCelda(origenPaquete.denomOrigenPaquete == null
              ? ''
              : '${origenPaquete.denomOrigenPaquete}'),
          onTap: _editarOrigenPaquete(origenPaquete),
        ),
      ],
    );
  }

  @override
  int get rowCount => listaOrigenesPaquetes.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool checked) {
  }
}

