/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Cerraduras
 [//Cerraduras]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UICerradurasLista extends StatefulWidget {
  static const String ruta = '/ui-clientes/lista';

  @override
  _UICerradurasListaState createState() => _UICerradurasListaState();
}

class _UICerradurasListaState extends State<UICerradurasLista> {

  _CerradurasDataSource _clientesDataSource;

  List<Cerradura> listaCerraduras = List<Cerradura>();

  int _rowsPerPage = 3; //PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;

  void _sort<T>(
      Comparable<T> getField(Cerradura d), int columnIndex, bool ascending) {
    _clientesDataSource._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  _inicializar() async {
    Cerraduras.todos(listaCerraduras).then((r) {
      _clientesDataSource.listaCerraduras.clear();
      _clientesDataSource.listaCerraduras.addAll(this.listaCerraduras);
      _clientesDataSource.notifyListeners();
      setState((){});
    });
  }

  @override
  void initState() {
    _clientesDataSource = _CerradurasDataSource(context, List<Cerradura>());
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
                          label: UI__EtiquetaColumna(CERRADURAS.ETIQUETA_MODELO),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Cerradura d) => d.modelo.denomModelo,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(CERRADURAS.ETIQUETA_DENOMCERRADURA),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Cerradura d) => d.denomCerradura,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(CERRADURAS.ETIQUETA_UNIDADFUNCIONAL),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Cerradura d) => d.unidadFuncional.denomUnidadFuncional,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(CERRADURAS.ETIQUETA_ESTADOCERRADURA),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Cerradura d) => d.estadoCerradura.denomEstadoCerradura,
                            columnIndex, ascending,),),
              ],
              source: _clientesDataSource),
        ),
        UI__Mensaje(
          _clientesDataSource.listaCerraduras.length == 0,
          'Leyendo ${CERRADURAS.ETIQUETA_ENTIDAD}...',
        ),
      ],
    );
  }
}


class _CerradurasDataSource extends DataTableSource {
  _CerradurasDataSource(this.context, this.listaCerraduras);

  final List<Cerradura> listaCerraduras; 
  final BuildContext context;

  _editarCerradura(Cerradura registro) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UICerraduraEdicion(registro: registro)),
    );
  }

  void _sort<T>(Comparable<T> getField(Cerradura d), bool ascending) {
    listaCerraduras.sort((Cerradura a, Cerradura b) {
      if (!ascending) {
        final Cerradura c = a;
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
    if (index >= listaCerraduras.length) return null;
    final Cerradura cerradura = listaCerraduras[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(
          UI__EtiquetaCelda(cerradura.modelo == null
              ? ''
              : '${cerradura.modelo.denomModelo}'),
          onTap: _editarCerradura(cerradura),
        ),
        DataCell(
          UI__EtiquetaCelda(cerradura.denomCerradura == null
              ? ''
              : '${cerradura.denomCerradura}'),
          onTap: _editarCerradura(cerradura),
        ),
        DataCell(
          UI__EtiquetaCelda(cerradura.unidadFuncional == null
              ? ''
              : '${cerradura.unidadFuncional.denomUnidadFuncional}'),
          onTap: _editarCerradura(cerradura),
        ),
        DataCell(
          UI__EtiquetaCelda(cerradura.estadoCerradura == null
              ? ''
              : '${cerradura.estadoCerradura.denomEstadoCerradura}'),
          onTap: _editarCerradura(cerradura),
        ),
      ],
    );
  }

  @override
  int get rowCount => listaCerraduras.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool checked) {
  }
}

