/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Propietarios
 [//Propietarios]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIPropietariosLista extends StatefulWidget {
  static const String ruta = '/ui-clientes/lista';

  @override
  _UIPropietariosListaState createState() => _UIPropietariosListaState();
}

class _UIPropietariosListaState extends State<UIPropietariosLista> {

  _PropietariosDataSource _clientesDataSource;

  List<Propietario> listaPropietarios = List<Propietario>();

  int _rowsPerPage = 3; //PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;

  void _sort<T>(
      Comparable<T> getField(Propietario d), int columnIndex, bool ascending) {
    _clientesDataSource._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  _inicializar() async {
    Propietarios.todos(listaPropietarios).then((r) {
      _clientesDataSource.listaPropietarios.clear();
      _clientesDataSource.listaPropietarios.addAll(this.listaPropietarios);
      _clientesDataSource.notifyListeners();
      setState((){});
    });
  }

  @override
  void initState() {
    _clientesDataSource = _PropietariosDataSource(context, List<Propietario>());
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
                          label: UI__EtiquetaColumna(PROPIETARIOS.ETIQUETA_NOMBRECOMPLETOPROPIETARIO),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Propietario d) => d.nombreCompletoPropietario,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(PROPIETARIOS.ETIQUETA_USUARIO),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<num>((Propietario d) => d.usuario,
                            columnIndex, ascending,),),
              ],
              source: _clientesDataSource),
        ),
        UI__Mensaje(
          _clientesDataSource.listaPropietarios.length == 0,
          'Leyendo ${PROPIETARIOS.ETIQUETA_ENTIDAD}...',
        ),
      ],
    );
  }
}


class _PropietariosDataSource extends DataTableSource {
  _PropietariosDataSource(this.context, this.listaPropietarios);

  final List<Propietario> listaPropietarios; 
  final BuildContext context;

  _editarPropietario(Propietario registro) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIPropietarioEdicion(registro: registro)),
    );
  }

  void _sort<T>(Comparable<T> getField(Propietario d), bool ascending) {
    listaPropietarios.sort((Propietario a, Propietario b) {
      if (!ascending) {
        final Propietario c = a;
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
    if (index >= listaPropietarios.length) return null;
    final Propietario propietario = listaPropietarios[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(
          UI__EtiquetaCelda(propietario.nombreCompletoPropietario == null
              ? ''
              : '${propietario.nombreCompletoPropietario}'),
          onTap: _editarPropietario(propietario),
        ),
        DataCell(
          UI__EtiquetaCelda(propietario.usuario == null
              ? ''
              : '${propietario.usuario}'),
          onTap: _editarPropietario(propietario),
        ),
      ],
    );
  }

  @override
  int get rowCount => listaPropietarios.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool checked) {
  }
}

