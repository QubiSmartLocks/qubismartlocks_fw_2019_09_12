/*
 Proyecto: Qubi Smart Locks
 Version: 0.0.2
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Opciones de Mensajería
 [Mensajería (Chats)/Mensajería (Chats)/Opciones de Mensajería]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIOpcionesMensajeriaLista extends StatefulWidget {
  static const String ruta = '/ui-clientes/lista';

  @override
  _UIOpcionesMensajeriaListaState createState() => _UIOpcionesMensajeriaListaState();
}

class _UIOpcionesMensajeriaListaState extends State<UIOpcionesMensajeriaLista> {

  _OpcionesMensajeriaDataSource _clientesDataSource =
      _OpcionesMensajeriaDataSource(List<OpcionMensajeria>());

  List<OpcionMensajeria> listaOpcionesMensajeria = List<OpcionMensajeria>();

  int _rowsPerPage = 3; //PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;

  void _sort<T>(
      Comparable<T> getField(OpcionMensajeria d), int columnIndex, bool ascending) {
    _clientesDataSource._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  _inicializar() async {
    OpcionesMensajeria.todos(listaOpcionesMensajeria).then((r) {
      _clientesDataSource.listaOpcionesMensajeria.clear();
      _clientesDataSource.listaOpcionesMensajeria.addAll(this.listaOpcionesMensajeria);
      _clientesDataSource.notifyListeners();
    });
  }

  @override
  void initState() {
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
              ],
              source: _clientesDataSource),
        ),
        listaOpcionesMensajeria.length == 0
            ? Center(
                child: Card(
                  child: Text('Leyendo datos...'),
                ),
              )
            : Container(),
      ],
    );
  }
}


class _OpcionesMensajeriaDataSource extends DataTableSource {
  _OpcionesMensajeriaDataSource(this.listaOpcionesMensajeria);

  final List<OpcionMensajeria> listaOpcionesMensajeria; 

  void _sort<T>(Comparable<T> getField(OpcionMensajeria d), bool ascending) {
    listaOpcionesMensajeria.sort((OpcionMensajeria a, OpcionMensajeria b) {
      if (!ascending) {
        final OpcionMensajeria c = a;
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
    if (index >= listaOpcionesMensajeria.length) return null;
    final OpcionMensajeria opcionMensajeria = listaOpcionesMensajeria[index];
    return DataRow.byIndex(index: index,
        cells: <DataCell>[
        ]);
  }

  @override
  int get rowCount => listaOpcionesMensajeria.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool checked) {
  }
}

