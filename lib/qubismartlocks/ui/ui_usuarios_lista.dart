/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Usuarios
 [//Usuarios]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIUsuariosLista extends StatefulWidget {
  static const String ruta = '/ui-clientes/lista';

  @override
  _UIUsuariosListaState createState() => _UIUsuariosListaState();
}

class _UIUsuariosListaState extends State<UIUsuariosLista> {

  _UsuariosDataSource _clientesDataSource;

  List<Usuario> listaUsuarios = List<Usuario>();

  int _rowsPerPage = 3; //PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;

  void _sort<T>(
      Comparable<T> getField(Usuario d), int columnIndex, bool ascending) {
    _clientesDataSource._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  _inicializar() async {
    Usuarios.todos(listaUsuarios).then((r) {
      _clientesDataSource.listaUsuarios.clear();
      _clientesDataSource.listaUsuarios.addAll(this.listaUsuarios);
      _clientesDataSource.notifyListeners();
      setState((){});
    });
  }

  @override
  void initState() {
    _clientesDataSource = _UsuariosDataSource(context, List<Usuario>());
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
                          label: UI__EtiquetaColumna(USUARIOS.ETIQUETA_NOMBRES),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Usuario d) => d.nombres,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(USUARIOS.ETIQUETA_APELLIDOS),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Usuario d) => d.apellidos,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(USUARIOS.ETIQUETA_CORREOELECTRONICO),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Usuario d) => d.correoElectronico,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(USUARIOS.ETIQUETA_CELULAR),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Usuario d) => d.celular,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(USUARIOS.ETIQUETA_NIVELUSUARIO),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Usuario d) => d.nivelUsuario.denomNivelUsuario,
                            columnIndex, ascending,),),
              ],
              source: _clientesDataSource),
        ),
        UI__Mensaje(
          _clientesDataSource.listaUsuarios.length == 0,
          'Leyendo ${USUARIOS.ETIQUETA_ENTIDAD}...',
        ),
      ],
    );
  }
}


class _UsuariosDataSource extends DataTableSource {
  _UsuariosDataSource(this.context, this.listaUsuarios);

  final List<Usuario> listaUsuarios; 
  final BuildContext context;

  _editarUsuario(Usuario registro) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIUsuarioEdicion(registro: registro)),
    );
  }

  void _sort<T>(Comparable<T> getField(Usuario d), bool ascending) {
    listaUsuarios.sort((Usuario a, Usuario b) {
      if (!ascending) {
        final Usuario c = a;
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
    if (index >= listaUsuarios.length) return null;
    final Usuario usuario = listaUsuarios[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(
          UI__EtiquetaCelda(usuario.nombres == null
              ? ''
              : '${usuario.nombres}'),
          onTap: _editarUsuario(usuario),
        ),
        DataCell(
          UI__EtiquetaCelda(usuario.apellidos == null
              ? ''
              : '${usuario.apellidos}'),
          onTap: _editarUsuario(usuario),
        ),
        DataCell(
          UI__EtiquetaCelda(usuario.correoElectronico == null
              ? ''
              : '${usuario.correoElectronico}'),
          onTap: _editarUsuario(usuario),
        ),
        DataCell(
          UI__EtiquetaCelda(usuario.celular == null
              ? ''
              : '${usuario.celular}'),
          onTap: _editarUsuario(usuario),
        ),
        DataCell(
          UI__EtiquetaCelda(usuario.nivelUsuario == null
              ? ''
              : '${usuario.nivelUsuario.denomNivelUsuario}'),
          onTap: _editarUsuario(usuario),
        ),
      ],
    );
  }

  @override
  int get rowCount => listaUsuarios.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool checked) {
  }
}

