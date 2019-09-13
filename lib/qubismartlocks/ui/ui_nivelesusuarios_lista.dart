/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Niveles de Usuarios
 [//Niveles de Usuarios]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UINivelesUsuariosLista extends StatefulWidget {
  static const String ruta = '/ui-clientes/lista';

  @override
  _UINivelesUsuariosListaState createState() => _UINivelesUsuariosListaState();
}

class _UINivelesUsuariosListaState extends State<UINivelesUsuariosLista> {

  _NivelesUsuariosDataSource _clientesDataSource;

  List<NivelUsuario> listaNivelesUsuarios = List<NivelUsuario>();

  int _rowsPerPage = 3; //PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;

  void _sort<T>(
      Comparable<T> getField(NivelUsuario d), int columnIndex, bool ascending) {
    _clientesDataSource._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  _inicializar() async {
    NivelesUsuarios.todos(listaNivelesUsuarios).then((r) {
      _clientesDataSource.listaNivelesUsuarios.clear();
      _clientesDataSource.listaNivelesUsuarios.addAll(this.listaNivelesUsuarios);
      _clientesDataSource.notifyListeners();
      setState((){});
    });
  }

  @override
  void initState() {
    _clientesDataSource = _NivelesUsuariosDataSource(context, List<NivelUsuario>());
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
                          label: UI__EtiquetaColumna(NIVELESUSUARIOS.ETIQUETA_DENOMNIVELUSUARIO),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((NivelUsuario d) => d.denomNivelUsuario,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(NIVELESUSUARIOS.ETIQUETA_DETNIVELES),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((NivelUsuario d) => d.detNiveles,
                            columnIndex, ascending,),),
              ],
              source: _clientesDataSource),
        ),
        UI__Mensaje(
          _clientesDataSource.listaNivelesUsuarios.length == 0,
          'Leyendo ${NIVELESUSUARIOS.ETIQUETA_ENTIDAD}...',
        ),
      ],
    );
  }
}


class _NivelesUsuariosDataSource extends DataTableSource {
  _NivelesUsuariosDataSource(this.context, this.listaNivelesUsuarios);

  final List<NivelUsuario> listaNivelesUsuarios; 
  final BuildContext context;

  _editarNivelUsuario(NivelUsuario registro) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UINivelUsuarioEdicion(registro: registro)),
    );
  }

  void _sort<T>(Comparable<T> getField(NivelUsuario d), bool ascending) {
    listaNivelesUsuarios.sort((NivelUsuario a, NivelUsuario b) {
      if (!ascending) {
        final NivelUsuario c = a;
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
    if (index >= listaNivelesUsuarios.length) return null;
    final NivelUsuario nivelUsuario = listaNivelesUsuarios[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(
          UI__EtiquetaCelda(nivelUsuario.denomNivelUsuario == null
              ? ''
              : '${nivelUsuario.denomNivelUsuario}'),
          onTap: _editarNivelUsuario(nivelUsuario),
        ),
        DataCell(
          UI__EtiquetaCelda(nivelUsuario.detNiveles == null
              ? ''
              : '${nivelUsuario.detNiveles}'),
          onTap: _editarNivelUsuario(nivelUsuario),
        ),
      ],
    );
  }

  @override
  int get rowCount => listaNivelesUsuarios.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool checked) {
  }
}

