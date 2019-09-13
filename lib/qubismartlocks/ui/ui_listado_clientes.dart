import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIClienteDataSource extends DataTableSource {
  UIClienteDataSource(this.listaClientes);

  final List<Cliente> listaClientes; // = List<Cliente>()

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

  _editorCliente() {
//    Navigator.pushNamed(context, routeName)
  }

  int _selectedCount = 0;

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= listaClientes.length) return null;
    final Cliente cliente = listaClientes[index];
    return DataRow.byIndex(index: index,
//        selected: cliente.selected,
//        onSelectChanged: (bool value) {
//          if (cliente.selected != value) {
//            _selectedCount += value ? 1 : -1;
//            assert(_selectedCount >= 0);
//            cliente.selected = value;
//            notifyListeners();
//          }
//        },
        cells: <DataCell>[
          DataCell(Text('${cliente.nombres}')),
          //, placeholder: true, showEditIcon: true, onTap: _editorCliente),
          DataCell(Text('${cliente.apellidos}')),
          //, placeholder: true, showEditIcon: true, onTap: _editorCliente),
          DataCell(Text('${cliente.telefono}')),
          //, placeholder: true, showEditIcon: true, onTap: _editorCliente),
          DataCell(Text('${cliente.correoElectronico}')),
          //, placeholder: true, showEditIcon: true, onTap: _editorCliente),
        ]);
  }

  @override
  int get rowCount => listaClientes.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool checked) {
//    for (Cliente cliente in _clientes) cliente.selected = checked;
//    _selectedCount = checked ? _clientes.length : 0;
//    notifyListeners();
  }
}

class UIListadoClientes extends StatefulWidget {
  static const String ruta = '/vistas-admin/clientes';

  @override
  _UIListadoClientesState createState() => _UIListadoClientesState();
}

class _UIListadoClientesState extends State<UIListadoClientes> {
  List<Cliente> listaClientes = List<Cliente>();
  String filtroNombre = '';
  TextEditingController _controllerNombres = TextEditingController();
  String filtroApellidos = '';

  int _rowsPerPage = 3; //PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;
  UIClienteDataSource _clientesDataSource =
      UIClienteDataSource(List<Cliente>());

  void _sort<T>(
      Comparable<T> getField(Cliente d), int columnIndex, bool ascending) {
    _clientesDataSource._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  _filtrar() {
//    List<Cliente> _lista, _listaApellidos = List<Cliente>();
//    if (filtroNombre.isNotEmpty) {
//      _lista.addAll(listaClientes.where((r) =>
//          r.nombres.toLowerCase().contains(filtroNombre.toLowerCase()))); // .toList()
//    } else {
//      _lista.addAll(listaClientes);
//    }
//    if (filtroApellidos.isNotEmpty) {
//      _listaApellidos.addAll(_lista.where((r) => r.apellidos.toLowerCase().contains(filtroApellidos.toLowerCase()))); // .toList()
//    } else {
//      _listaApellidos.addAll(_lista);
//    }
//    _clientesDataSource.listaClientes.clear();
//    _clientesDataSource.listaClientes.addAll(_listaApellidos);
//    setState(() {
//
//    });
  }

  _inicializar() async {
    Clientes.todos(listaClientes).then((r) {
      _clientesDataSource.listaClientes.clear();
      _clientesDataSource.listaClientes.addAll(this.listaClientes);
      setState(() {});
    });
  }

  @override
  void initState() {
    _inicializar();
    super.initState();
  }

  _listenerNombres() {
    filtroNombre = _controllerNombres.value.toString();
    _filtrar();
  }

  @override
  void dispose() {
    if (_controllerNombres.hasListeners) {
      _controllerNombres.removeListener(_listenerNombres);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controllerNombres.hasListeners) {
      _controllerNombres.addListener(_listenerNombres);
    }
    String titulo = 'Tiutlo';
    if (listaClientes.length > 0) {
      titulo = listaClientes[0].correoElectronico;
    }
    CD.iniciar(context);
    double headerHeight = 50.0;
    double columnSpacing = 5.0;
    double dataRowHeight = 25.0;
    double headingRowHeight = 25.0;
    double altoTotal = CD.alto * .5;
    double anchoTotal = CD.ancho * .7;
    _rowsPerPage =
        ((altoTotal - headerHeight - headingRowHeight - 56) / dataRowHeight)
                .toInt() -
            1;

    List<int> availableRowsPerPage = [_rowsPerPage];
    return
        //Scaffold(
//      appBar: AppBar(
//        title: Text(titulo),
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.refresh),
//            onPressed: _inicializar,
//          ),
//        ],
//      ),
//      body:
//      Center(
//        child:
        listaClientes.length == 0
            ? Container(
                child: Text('Leyendo datos...'),
              )
//            : ListView(padding: const EdgeInsets.all(20.0), children: <Widget>[
            : Container(
                width: anchoTotal,
                height: altoTotal,
//                color: Colors.red,
                padding: EdgeInsets.all(5),
                child: PaginatedDataTable(
//                    header: const Text('Nutrition'),
                    header: Container(
                      height: headerHeight,
                      child: Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              UIEtiqueta('Filtrar Nombres'),
//                            TextField(textCapitalization: TextCapitalization.characters, controller: _controllerNombres,)
                            ],
                          )
                        ],
                      ),
                    ),
/*
                    this.dataRowHeight = 48.0,
                    this.headingRowHeight = 56.0,
                    this.horizontalMargin = 24.0,
                    this.columnSpacing = 56.0,
*/
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
//                    actions: <Widget>[
//                      IconButton(
//                        icon: Icon(Icons.refresh),
//                        onPressed: _inicializar,
//                      ),
//                    ],
                    availableRowsPerPage: availableRowsPerPage,
                    dragStartBehavior: DragStartBehavior.down,
                    columns: <DataColumn>[
                      DataColumn(
                          label: const Text(CLIENTES.ETIQUETA_NOMBRES),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Cliente d) => d.nombres,
                                  columnIndex, ascending)),
                      DataColumn(
                          label: const Text(CLIENTES.ETIQUETA_APELLIDOS),
//                    tooltip:
//                    'The total amount of food energy in the given serving size.',
//                    numeric: true,
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Cliente d) => d.apellidos,
                                  columnIndex, ascending)),
                      DataColumn(
                          label: const Text(CLIENTES.ETIQUETA_TELEFONO),
//                    numeric: true,
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Cliente d) => d.telefono,
                                  columnIndex, ascending)),
                      DataColumn(
                          label:
                              const Text(CLIENTES.ETIQUETA_CORREOELECTRONICO),
//                          numeric: true,
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Cliente d) => d.correoElectronico,
                                  columnIndex, ascending)),
                    ],
                    source: _clientesDataSource),
//        ),
                //  ),
              );
  }
}
