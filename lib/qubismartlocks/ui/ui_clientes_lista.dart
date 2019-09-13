/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Clientes
 [//Clientes]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIClientesLista extends StatefulWidget {
  static const String ruta = '/ui-clientes/lista';

  @override
  _UIClientesListaState createState() => _UIClientesListaState();
}

class _UIClientesListaState extends State<UIClientesLista> {

  _ClientesDataSource _clientesDataSource;

  List<Cliente> listaClientes = List<Cliente>();

  int _rowsPerPage = 3; //PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;

  void _sort<T>(
      Comparable<T> getField(Cliente d), int columnIndex, bool ascending) {
    _clientesDataSource._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  _inicializar() async {
    Clientes.todos(listaClientes).then((r) {
      _clientesDataSource.listaClientes.clear();
      _clientesDataSource.listaClientes.addAll(this.listaClientes);
      _clientesDataSource.notifyListeners();
      setState((){});
    });
  }

  @override
  void initState() {
    _clientesDataSource = _ClientesDataSource(context, List<Cliente>());
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
                          label: UI__EtiquetaColumna(CLIENTES.ETIQUETA_NOMBRES),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Cliente d) => d.nombres,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(CLIENTES.ETIQUETA_APELLIDOS),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Cliente d) => d.apellidos,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(CLIENTES.ETIQUETA_TIPOIDENT),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Cliente d) => d.tipoIdent.denomTipoIdent,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(CLIENTES.ETIQUETA_DOCIDENT),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Cliente d) => d.docIdent,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(CLIENTES.ETIQUETA_TELEFONO),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Cliente d) => d.telefono,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(CLIENTES.ETIQUETA_CORREOELECTRONICO),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Cliente d) => d.correoElectronico,
                            columnIndex, ascending,),),
              ],
              source: _clientesDataSource),
        ),
        UI__Mensaje(
          _clientesDataSource.listaClientes.length == 0,
          'Leyendo ${CLIENTES.ETIQUETA_ENTIDAD}...',
        ),
      ],
    );
  }
}


class _ClientesDataSource extends DataTableSource {
  _ClientesDataSource(this.context, this.listaClientes);

  final List<Cliente> listaClientes; 
  final BuildContext context;

  _editarCliente(Cliente registro) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIClienteEdicion(registro: registro)),
    );
  }

  void _sort<T>(Comparable<T> getField(Cliente d), bool ascending) {
    listaClientes.sort((Cliente a, Cliente b) {
      if (!ascending) {
        final Cliente c = a;
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
    if (index >= listaClientes.length) return null;
    final Cliente cliente = listaClientes[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(
          UI__EtiquetaCelda(cliente.nombres == null
              ? ''
              : '${cliente.nombres}'),
          onTap: _editarCliente(cliente),
        ),
        DataCell(
          UI__EtiquetaCelda(cliente.apellidos == null
              ? ''
              : '${cliente.apellidos}'),
          onTap: _editarCliente(cliente),
        ),
        DataCell(
          UI__EtiquetaCelda(cliente.tipoIdent == null
              ? ''
              : '${cliente.tipoIdent.denomTipoIdent}'),
          onTap: _editarCliente(cliente),
        ),
        DataCell(
          UI__EtiquetaCelda(cliente.docIdent == null
              ? ''
              : '${cliente.docIdent}'),
          onTap: _editarCliente(cliente),
        ),
        DataCell(
          UI__EtiquetaCelda(cliente.telefono == null
              ? ''
              : '${cliente.telefono}'),
          onTap: _editarCliente(cliente),
        ),
        DataCell(
          UI__EtiquetaCelda(cliente.correoElectronico == null
              ? ''
              : '${cliente.correoElectronico}'),
          onTap: _editarCliente(cliente),
        ),
      ],
    );
  }

  @override
  int get rowCount => listaClientes.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool checked) {
  }
}

