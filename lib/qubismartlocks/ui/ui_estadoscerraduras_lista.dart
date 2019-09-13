/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Estados de Cerraduras
 [//Estados de Cerraduras]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIEstadosCerradurasLista extends StatefulWidget {
  static const String ruta = '/ui-clientes/lista';

  @override
  _UIEstadosCerradurasListaState createState() => _UIEstadosCerradurasListaState();
}

class _UIEstadosCerradurasListaState extends State<UIEstadosCerradurasLista> {

  _EstadosCerradurasDataSource _clientesDataSource;

  List<EstadoCerradura> listaEstadosCerraduras = List<EstadoCerradura>();

  int _rowsPerPage = 3; //PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;

  void _sort<T>(
      Comparable<T> getField(EstadoCerradura d), int columnIndex, bool ascending) {
    _clientesDataSource._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  _inicializar() async {
    EstadosCerraduras.todos(listaEstadosCerraduras).then((r) {
      _clientesDataSource.listaEstadosCerraduras.clear();
      _clientesDataSource.listaEstadosCerraduras.addAll(this.listaEstadosCerraduras);
      _clientesDataSource.notifyListeners();
      setState((){});
    });
  }

  @override
  void initState() {
    _clientesDataSource = _EstadosCerradurasDataSource(context, List<EstadoCerradura>());
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
                          label: UI__EtiquetaColumna(ESTADOSCERRADURAS.ETIQUETA_DENOMESTADOCERRADURA),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((EstadoCerradura d) => d.denomEstadoCerradura,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(ESTADOSCERRADURAS.ETIQUETA_ACTIVA),),
              ],
              source: _clientesDataSource),
        ),
        UI__Mensaje(
          _clientesDataSource.listaEstadosCerraduras.length == 0,
          'Leyendo ${ESTADOSCERRADURAS.ETIQUETA_ENTIDAD}...',
        ),
      ],
    );
  }
}


class _EstadosCerradurasDataSource extends DataTableSource {
  _EstadosCerradurasDataSource(this.context, this.listaEstadosCerraduras);

  final List<EstadoCerradura> listaEstadosCerraduras; 
  final BuildContext context;

  _editarEstadoCerradura(EstadoCerradura registro) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIEstadoCerraduraEdicion(registro: registro)),
    );
  }

  void _sort<T>(Comparable<T> getField(EstadoCerradura d), bool ascending) {
    listaEstadosCerraduras.sort((EstadoCerradura a, EstadoCerradura b) {
      if (!ascending) {
        final EstadoCerradura c = a;
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
    if (index >= listaEstadosCerraduras.length) return null;
    final EstadoCerradura estadoCerradura = listaEstadosCerraduras[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(
          UI__EtiquetaCelda(estadoCerradura.denomEstadoCerradura == null
              ? ''
              : '${estadoCerradura.denomEstadoCerradura}'),
          onTap: _editarEstadoCerradura(estadoCerradura),
        ),
        DataCell(
          UI__EtiquetaCelda(estadoCerradura.activa == null
              ? ''
              : '${estadoCerradura.activa}'),
          onTap: _editarEstadoCerradura(estadoCerradura),
        ),
      ],
    );
  }

  @override
  int get rowCount => listaEstadosCerraduras.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool checked) {
  }
}

