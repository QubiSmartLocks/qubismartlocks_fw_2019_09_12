/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Modelos de Cerraduras
 [//Modelos de Cerraduras]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIModelosCerradurasLista extends StatefulWidget {
  static const String ruta = '/ui-clientes/lista';

  @override
  _UIModelosCerradurasListaState createState() => _UIModelosCerradurasListaState();
}

class _UIModelosCerradurasListaState extends State<UIModelosCerradurasLista> {

  _ModelosCerradurasDataSource _clientesDataSource;

  List<ModeloCerradura> listaModelosCerraduras = List<ModeloCerradura>();

  int _rowsPerPage = 3; //PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;

  void _sort<T>(
      Comparable<T> getField(ModeloCerradura d), int columnIndex, bool ascending) {
    _clientesDataSource._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  _inicializar() async {
    ModelosCerraduras.todos(listaModelosCerraduras).then((r) {
      _clientesDataSource.listaModelosCerraduras.clear();
      _clientesDataSource.listaModelosCerraduras.addAll(this.listaModelosCerraduras);
      _clientesDataSource.notifyListeners();
      setState((){});
    });
  }

  @override
  void initState() {
    _clientesDataSource = _ModelosCerradurasDataSource(context, List<ModeloCerradura>());
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
                          label: UI__EtiquetaColumna(MODELOSCERRADURAS.ETIQUETA_DENOMMODELO),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((ModeloCerradura d) => d.denomModelo,
                            columnIndex, ascending,),),
              ],
              source: _clientesDataSource),
        ),
        UI__Mensaje(
          _clientesDataSource.listaModelosCerraduras.length == 0,
          'Leyendo ${MODELOSCERRADURAS.ETIQUETA_ENTIDAD}...',
        ),
      ],
    );
  }
}


class _ModelosCerradurasDataSource extends DataTableSource {
  _ModelosCerradurasDataSource(this.context, this.listaModelosCerraduras);

  final List<ModeloCerradura> listaModelosCerraduras; 
  final BuildContext context;

  _editarModeloCerradura(ModeloCerradura registro) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIModeloCerraduraEdicion(registro: registro)),
    );
  }

  void _sort<T>(Comparable<T> getField(ModeloCerradura d), bool ascending) {
    listaModelosCerraduras.sort((ModeloCerradura a, ModeloCerradura b) {
      if (!ascending) {
        final ModeloCerradura c = a;
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
    if (index >= listaModelosCerraduras.length) return null;
    final ModeloCerradura modeloCerradura = listaModelosCerraduras[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(
          UI__EtiquetaCelda(modeloCerradura.denomModelo == null
              ? ''
              : '${modeloCerradura.denomModelo}'),
          onTap: _editarModeloCerradura(modeloCerradura),
        ),
      ],
    );
  }

  @override
  int get rowCount => listaModelosCerraduras.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool checked) {
  }
}

