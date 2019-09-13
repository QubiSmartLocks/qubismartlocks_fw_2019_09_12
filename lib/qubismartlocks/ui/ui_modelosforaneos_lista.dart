/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Modelos Foráneos
 [//Modelos Foráneos]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIModelosForaneosLista extends StatefulWidget {
  static const String ruta = '/ui-clientes/lista';

  @override
  _UIModelosForaneosListaState createState() => _UIModelosForaneosListaState();
}

class _UIModelosForaneosListaState extends State<UIModelosForaneosLista> {

  _ModelosForaneosDataSource _clientesDataSource;

  List<ModeloForaneo> listaModelosForaneos = List<ModeloForaneo>();

  int _rowsPerPage = 3; //PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;

  void _sort<T>(
      Comparable<T> getField(ModeloForaneo d), int columnIndex, bool ascending) {
    _clientesDataSource._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  _inicializar() async {
    ModelosForaneos.todos(listaModelosForaneos).then((r) {
      _clientesDataSource.listaModelosForaneos.clear();
      _clientesDataSource.listaModelosForaneos.addAll(this.listaModelosForaneos);
      _clientesDataSource.notifyListeners();
      setState((){});
    });
  }

  @override
  void initState() {
    _clientesDataSource = _ModelosForaneosDataSource(context, List<ModeloForaneo>());
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
                          label: UI__EtiquetaColumna(MODELOSFORANEOS.ETIQUETA_DENOMMODELOFORANEO),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((ModeloForaneo d) => d.denomModeloForaneo,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(MODELOSFORANEOS.ETIQUETA_DESCMODELOFORANEO),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((ModeloForaneo d) => d.descModeloForaneo,
                            columnIndex, ascending,),),
              ],
              source: _clientesDataSource),
        ),
        UI__Mensaje(
          _clientesDataSource.listaModelosForaneos.length == 0,
          'Leyendo ${MODELOSFORANEOS.ETIQUETA_ENTIDAD}...',
        ),
      ],
    );
  }
}


class _ModelosForaneosDataSource extends DataTableSource {
  _ModelosForaneosDataSource(this.context, this.listaModelosForaneos);

  final List<ModeloForaneo> listaModelosForaneos; 
  final BuildContext context;

  _editarModeloForaneo(ModeloForaneo registro) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIModeloForaneoEdicion(registro: registro)),
    );
  }

  void _sort<T>(Comparable<T> getField(ModeloForaneo d), bool ascending) {
    listaModelosForaneos.sort((ModeloForaneo a, ModeloForaneo b) {
      if (!ascending) {
        final ModeloForaneo c = a;
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
    if (index >= listaModelosForaneos.length) return null;
    final ModeloForaneo modeloForaneo = listaModelosForaneos[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(
          UI__EtiquetaCelda(modeloForaneo.denomModeloForaneo == null
              ? ''
              : '${modeloForaneo.denomModeloForaneo}'),
          onTap: _editarModeloForaneo(modeloForaneo),
        ),
        DataCell(
          UI__EtiquetaCelda(modeloForaneo.descModeloForaneo == null
              ? ''
              : '${modeloForaneo.descModeloForaneo}'),
          onTap: _editarModeloForaneo(modeloForaneo),
        ),
      ],
    );
  }

  @override
  int get rowCount => listaModelosForaneos.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool checked) {
  }
}

