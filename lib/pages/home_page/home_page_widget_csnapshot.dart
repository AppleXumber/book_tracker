import '../../components/fab_form_book.dart';
import '/components/drawer_widget.dart';
import '/components/bookSummary_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';
import '../../classes/books.dart';
import "../../database/book_dao.dart";
import "../../database/database.dart";

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme
            .of(context)
            .primaryBackground,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 58, right: 12),
          child: FabFormBook(),
        ),
        drawer: Drawer(
          elevation: 16.0,
          child: wrapWithModel(
            model: _model.drawerModel,
            updateCallback: () => setState(() {}),
            child: DrawerWidget(),
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme
              .of(context)
              .primary,
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                scaffoldKey.currentState!.openDrawer();
              },
              child: Icon(
                Icons.menu,
                color: Colors.white,
                size: 24.0,
              ),
            ),
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'bpu175q4' /* BookTracker */,
            ),
            style: FlutterFlowTheme
                .of(context)
                .bodyMedium
                .override(
              fontFamily: 'Readex Pro',
              color: Colors.white,
              fontSize: 24.0,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
              child: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 24.0,
                ),
                onPressed: () {
                  //getDatabase();
                  //print(BookDao());
                  //BookDao().save(livro);
                  //BookDao().save(livroLido);
                  final livroDao = BookDao().findAll();
                  print(livroDao);
                },
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.00, -1.00),
            child: SingleChildScrollView(
              child: FutureBuilder<List<Book>>(
                future: BookDao().findAll(),
                builder: (context, snapshot) {
                  List<Book>? itens = snapshot.data;
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return const Center(
                        child: Column(
                          children: [
                            CircularProgressIndicator(),
                            Text('Carregando...')
                          ],
                        ),
                      );
                    case ConnectionState.waiting:
                      return const Center(
                        child: Column(
                          children: [
                            CircularProgressIndicator(),
                            Text('Carregando...')
                          ],
                        ),
                      );
                    case ConnectionState.active:
                      return const Center(
                        child: Column(
                          children: [
                            CircularProgressIndicator(),
                            Text('Carregando...')
                          ],
                        ),
                      );


                    case ConnectionState.done:
                      if (snapshot.hasData && itens != null) {
                        if (itens.isNotEmpty) {
                          return ListView.builder(
                            itemCount: itens.length,
                            itemBuilder: (BuildContext context, int index) {
                              //final Book bookBuilder = itens[index];
                              //return BookSummary(bookBuilder);
                            },
                          );
                        }
                        return const Center(
                          child: Column(
                            children: [
                              Icon(Icons.error_outline, size: 128),
                              Text(
                                "Não há nenhuma tarefa",
                                style: TextStyle(fontSize: 32),
                              )
                            ],
                          ),
                        );
                      }
                      return const Text("Erro ao carregar tarefas");
                      break;
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}


