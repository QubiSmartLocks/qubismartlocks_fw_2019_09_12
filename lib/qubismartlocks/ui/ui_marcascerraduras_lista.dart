/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Marcas de Cerraduras
 [//Marcas de Cerraduras]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIMarcasCerradurasLista extends StatefulWidget {
  static const String ruta = '/ui-clientes/lista';

  @override
  _UIMarcasCerradurasListaState createState() => _UIMarcasCerradurasListaState();
}

class _UIMarcasCerradurasListaState extends State<UIMarcasCerradurasLista> {

  _MarcasCerradurasDataSource _clientesDataSource;

  List<MarcaCerradura> listaMarcasCerraduras = List<MarcaCerradura>();

  int _rowsPerPage = 3; //PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;

  void _sort<T>(
      Comparable<T> getField(MarcaCerradura d), int columnIndex, bool ascending) {
    _clientesDataSource._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  _inicializar() async {
    MarcasCerraduras.todos(listaMarcasCerraduras).then((r) {
      _clientesDataSource.listaMarcasCerraduras.clear();
      _clientesDataSource.listaMarcasCerraduras.addAll(this.listaMarcasCerraduras);
      _clientesDataSource.notifyListeners();
      setState((){});
    });
  }

  @override
  void initState() {
    _clientesDataSource = _MarcasCerradurasDataSource(context, List<MarcaCerradura>());
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
                          label: UI__EtiquetaColumna(MARCASCERRADURAS.ETIQUETA_DENOMMARCACERRADURA),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((MarcaCerradura d) => d.denomMarcaCerradura,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(MARCASCERRADURAS.ETIQUETA_DESCMARCACERRADURA),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((MarcaCerradura d) => d.descMarcaCerradura,
                            columnIndex, ascending,),),
              ],
              source: _clientesDataSource),
        ),
        UI__Mensaje(
          _clientesDataSource.listaMarcasCerraduras.length == 0,
          'Leyendo ${MARCASCERRADURAS.ETIQUETA_ENTIDAD}...',
        ),
      ],
    );
  }
}


class _MarcasCerradurasDataSource extends DataTableSource {
  _MarcasCerradurasDataSource(this.context, this.listaMarcasCerraduras);

  final List<MarcaCerradura> listaMarcasCerraduras; 
  final BuildContext context;

  _editarMarcaCerradura(MarcaCerradura registro) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIMarcaCerraduraEdicion(registro: registro)),
    );
  }

  void _sort<T>(Comparable<T> getField(MarcaCerradura d), bool ascending) {
    listaMarcasCerraduras.sort((MarcaCerradura a, MarcaCerradura b) {
      if (!ascending) {
        final MarcaCerradura c = a;
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
    if (index >= listaMarcasCerraduras.length) return null;
    final MarcaCerradura marcaCerradura = listaMarcasCerraduras[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(
          UI__EtiquetaCelda(marcaCerradura.denomMarcaCerradura == null
              ? ''
              : '${marcaCerradura.denomMarcaCerradura}'),
          onTap: _editarMarcaCerradura(marcaCerradura),
        ),
        DataCell(
          UI__EtiquetaCelda(marcaCerradura.descMarcaCerradura == null
              ? ''
              : '${marcaCerradura.descMarcaCerradura}'),
          onTap: _editarMarcaCerradura(marcaCerradura),
        ),
      ],
    );
  }

  @override
  int get rowCount => listaMarcasCerraduras.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool checked) {
  }
}

