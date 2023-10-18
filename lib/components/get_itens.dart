import 'package:book_tracker/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

import '../classes/books.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'bookSummary_widget.dart';

class GetItensListView extends StatelessWidget {
  GetItensListView({
    required this.getter,
    required this.toAdd,
    super.key,
  });

  final Future<List<Map<String, dynamic>>> getter;
  final bool toAdd;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: getter,
      builder: (context, snapshot) {
        List<Map<String, dynamic>>? itens = snapshot.data;
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return LoadingWidget();
          case ConnectionState.waiting:
            return LoadingWidget();
          case ConnectionState.active:
            return LoadingWidget();

          case ConnectionState.done:
            if (snapshot.hasData && itens != null) {
              if (itens.isNotEmpty) {
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(
                    bottom: 20,
                  ),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: itens.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Book bookBuilder = Book.fromJson(itens[index]);
                    return BookSummary(bookBuilder);
                  },
                );
              }

              if (toAdd) {
                return WarningNoBookAdd();
              } else {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.all(55.0),
                    child: Column(
                      children: [
                        Text(
                          "Não há nenhum livro",
                          style: TextStyle(fontSize: 28),
                        ),
                      ],
                    ),
                  ),
                );
              }
            }
            return Column(
              children: [
                Text("Erro, não foi possível encontrar os livros"),
              ],
            );
        }
      },
    );
  }
}

class WarningNoBookAdd extends StatelessWidget {
  const WarningNoBookAdd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(55.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.menu_book_sharp, size: 100),
                Icon(Icons.add, size: 100),
              ],
            ),
            Text(
              "Não há nenhum livro",
              style: TextStyle(fontSize: 28),
            ),
            Padding(
              padding: const EdgeInsets.all(48.0),
              child: FFButtonWidget(
                onPressed: () async {
                  context.pushNamed('form_books', queryParameters: {
                    "bookJson": serializeParam(
                        jsonEncode(emptyBook.toJson()), ParamType.JSON)
                  });
                },
                text: "Adicionar livro",
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0xFF10403B),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                      ),
                  elevation: 3.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [CircularProgressIndicator(), Text('Carregando...')],
      ),
    );
  }
}
