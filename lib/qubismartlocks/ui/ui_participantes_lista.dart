/*
 Proyecto: Qubi Smart Locks
 Version: 2019.09.12
 Autor: Abner Hernández
 Unidad: Interface de Usuario para Lista de Participantes
 [//Participantes]
*/

import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UIParticipantesLista extends StatefulWidget {
  static const String ruta = '/ui-clientes/lista';

  @override
  _UIParticipantesListaState createState() => _UIParticipantesListaState();
}

class _UIParticipantesListaState extends State<UIParticipantesLista> {

  _ParticipantesDataSource _clientesDataSource;

  List<Participante> listaParticipantes = List<Participante>();

  int _rowsPerPage = 3; //PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;

  void _sort<T>(
      Comparable<T> getField(Participante d), int columnIndex, bool ascending) {
    _clientesDataSource._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  _inicializar() async {
    Participantes.todos(listaParticipantes).then((r) {
      _clientesDataSource.listaParticipantes.clear();
      _clientesDataSource.listaParticipantes.addAll(this.listaParticipantes);
      _clientesDataSource.notifyListeners();
      setState((){});
    });
  }

  @override
  void initState() {
    _clientesDataSource = _ParticipantesDataSource(context, List<Participante>());
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
                          label: UI__EtiquetaColumna(PARTICIPANTES.ETIQUETA_USUARIO),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<num>((Participante d) => d.usuario,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(PARTICIPANTES.ETIQUETA_NOMBRE),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Participante d) => d.nombre,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(PARTICIPANTES.ETIQUETA_NOTA),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Participante d) => d.nota,
                            columnIndex, ascending,),),
                      DataColumn(
                          label: UI__EtiquetaColumna(PARTICIPANTES.ETIQUETA_KEYCONVERSACION),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((Participante d) => d.keyConversacion,
                            columnIndex, ascending,),),
              ],
              source: _clientesDataSource),
        ),
        UI__Mensaje(
          _clientesDataSource.listaParticipantes.length == 0,
          'Leyendo ${PARTICIPANTES.ETIQUETA_ENTIDAD}...',
        ),
      ],
    );
  }
}


class _ParticipantesDataSource extends DataTableSource {
  _ParticipantesDataSource(this.context, this.listaParticipantes);

  final List<Participante> listaParticipantes; 
  final BuildContext context;

  _editarParticipante(Participante registro) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          UIParticipanteEdicion(registro: registro)),
    );
  }

  void _sort<T>(Comparable<T> getField(Participante d), bool ascending) {
    listaParticipantes.sort((Participante a, Participante b) {
      if (!ascending) {
        final Participante c = a;
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
    if (index >= listaParticipantes.length) return null;
    final Participante participante = listaParticipantes[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(
          UI__EtiquetaCelda(participante.usuario == null
              ? ''
              : '${participante.usuario}'),
          onTap: _editarParticipante(participante),
        ),
        DataCell(
          UI__EtiquetaCelda(participante.nombre == null
              ? ''
              : '${participante.nombre}'),
          onTap: _editarParticipante(participante),
        ),
        DataCell(
          UI__EtiquetaCelda(participante.nota == null
              ? ''
              : '${participante.nota}'),
          onTap: _editarParticipante(participante),
        ),
        DataCell(
          UI__EtiquetaCelda(participante.keyConversacion == null
              ? ''
              : '${participante.keyConversacion}'),
          onTap: _editarParticipante(participante),
        ),
      ],
    );
  }

  @override
  int get rowCount => listaParticipantes.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool checked) {
  }
}

