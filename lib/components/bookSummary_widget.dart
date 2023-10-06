import 'package:book_tracker/database/sql_helper.dart';
import 'package:book_tracker/pages/book_info/book_info_widget.dart';

import '../classes/books.dart';
import '../../classes/show_data.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'bookSummary_model.dart';
export 'bookSummary_model.dart';

class BookSummary extends StatefulWidget {
  BookSummary(this.book, {Key? key}) : super(key: key);
  Book book;

  @override
  _BookSummaryState createState() => _BookSummaryState();
}

class _BookSummaryState extends State<BookSummary> {
  late BookSummaryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  returnTextButton() {
    if (widget.book.status == "reading") {
      return TextButton(
        child: Text(
          "Lançar",
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Readex Pro',
                color: Colors.white,
                fontSize: 18.0,
              ),
        ),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              elevation: 5,
              isScrollControlled: true,
              builder: (context) =>
                  InitalProgress(context: context, book: widget.book));
        },
      );
    } else if (widget.book.status == "toRead") {
      return TextButton(
        child: Text(
          "Iniciar",
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Readex Pro',
                color: Colors.white,
                fontSize: 18.0,
              ),
        ),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              elevation: 5,
              isScrollControlled: true,
              builder: (context) =>
                  InitalProgress(context: context, book: widget.book));
        },
      );
    } else if (widget.book.status == "read") {
      return TextButton(
        child: Text(
          "Reiniciar",
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Readex Pro',
                color: Colors.white,
                fontSize: 18.0,
              ),
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Row(
                  children: [Text("Reiniciar"), Icon(Icons.restore_outlined)],
                ),
                content: const Text("Gostaria de deletar a leitura?"),
                actions: <Widget>[
                  TextButton(
                    child: const Text("Não"),
                    onPressed: () {
                      context.safePop();
                    },
                  ),
                  TextButton(
                    child: const Text("Sim"),
                    onPressed: () {
                      widget.book.status = "toRead";
                      widget.book.progress = 0;
                      SQLHelper.updateItem(widget.book.id, widget.book);
                      context.safePop();
                    },
                  ),
                ],
              );
            },
          );
        },
      );
    }
  }

  returnImage() {
    if (widget.book.image != null) {
      return Image.network(
        "${widget.book.image}",
        width: 100.0,
        height: 125.0,
        fit: BoxFit.cover,
      );
    } else {
      return Image.network(
        'https://www.lojadobolseiro.com.br/uploads/images/2020/02/76-livro-o-hobbit-capa-smaug-j-r-r-tolkien-1582738560.jpg',
        width: 100.0,
        height: 125.0,
        fit: BoxFit.cover,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookSummaryModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondary,
          borderRadius: BorderRadius.circular(10.0),
          shape: BoxShape.rectangle,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            BookInfoWidget(book: widget.book))).then(
                  (value) => setState(
                    () {
                      print('Recarregando tela inicial');
                    },
                  ),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.00, -1.00),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          10.0, 10.0, 10.0, 10.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: returnImage()),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.book.title,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'yvwtdusi' /* Data de Inicio: */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.white,
                                        ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'mf0eoy7m' /* Previsão de fim: */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.white,
                                        ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      DateFormat("dd/MM/yyyy")
                                          .format(DateTime.now()),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.white,
                                          ),
                                    ),
                                    Text(
                                      showData(widget.book.endReading),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.white,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 28.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.book.progress.toString() +
                                      " páginas de " +
                                      widget.book.pages.toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                      ),
                                ),
                                LinearPercentIndicator(
                                  percent:
                                      widget.book.progress! / widget.book.pages,
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.55,
                                  lineHeight: 12.0,
                                  animation: true,
                                  progressColor: Color(0xFF5ED9FA),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).accent4,
                                  barRadius: Radius.circular(5.0),
                                  padding: EdgeInsets.zero,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: returnTextButton()),
                    Icon(
                      Icons.edit_outlined,
                      color: Color(0xFFD9C589),
                      size: 30.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InitalProgress extends StatelessWidget {
  const InitalProgress({
    super.key,
    required this.context,
    required this.book,
  });

  final Book book;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    final TextEditingController _progressController = TextEditingController();
    final TextEditingController _totalController = TextEditingController();
    var intProgress = int.tryParse(showData(book.progress));
    var intGoal = int.tryParse(showData(book.goal));
    int progressAdded = intProgress! + intGoal!;
    _progressController.text = progressAdded.toString();
    _totalController.text = book.pages.toString();
    return Container(
      padding: EdgeInsets.only(
        top: 15,
        left: 15,
        right: 15,
        // this will prevent the soft keyboard from covering the text fields
        bottom: MediaQuery.of(context).viewInsets.bottom + 120,
      ),
      child: FormProgress(
          book: book,
          progressController: _progressController,
          totalController: _totalController),
    );
  }
}

class FormProgress extends StatefulWidget {
  FormProgress({
    super.key,
    required this.book,
    required TextEditingController progressController,
    required TextEditingController totalController,
  })  : _progressController = progressController,
        _totalController = totalController;

  final Book book;
  final TextEditingController _progressController;
  final TextEditingController _totalController;

  @override
  State<FormProgress> createState() => _FormProgressState();
}

class _FormProgressState extends State<FormProgress> {
  @override
  Widget build(BuildContext context) {
    double percentage = int.parse(widget._progressController.text) /
        int.parse(widget._totalController.text);
    if (percentage > 1) {
      percentage = 1;
      widget._progressController.text = widget._totalController.text;
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Inicar o livro: ${widget.book.title}",
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: TextField(
                controller: widget._progressController,
                decoration: const InputDecoration(hintText: 'Paginas lidas'),
                keyboardType: TextInputType.number,
                autofocus: true,
                onTapOutside: (value) {
                  return;
                },
                onChanged: (value) {
                  setState(() {
                    _FormProgressState();
                    if (int.parse(widget._progressController.text) >
                        int.parse(widget._totalController.text)) {
                      widget._progressController.text =
                          widget._totalController.text;
                    }
                    if (percentage > 1) {
                      percentage = 1;
                    }
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text("/", style: TextStyle(fontSize: 24)),
            ),
            Expanded(
              child: TextField(
                controller: widget._totalController,
                decoration: const InputDecoration(hintText: 'Paginas totais'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    if (int.parse(widget._progressController.text) >
                        int.parse(widget._totalController.text)) {
                      widget._progressController.text =
                          widget._totalController.text;
                    }

                    if (percentage > 1) {
                      percentage = 1;
                    }
                  });
                },
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: LinearPercentIndicator(
            percent: percentage,
            width: MediaQuery.sizeOf(context).width * 0.90,
            lineHeight: 22.0,
            animation: true,
            progressColor: FlutterFlowTheme.of(context).primary,
            backgroundColor: FlutterFlowTheme.of(context).accent4,
            center: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  0.0, 0.0, MediaQuery.sizeOf(context).width * 0.75, 0.0),
              child: Text(
                "${((int.parse(widget._progressController.text) / int.parse(widget._totalController.text)) * 100).floor()}%",
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).titleSmall,
              ),
            ),
            barRadius: Radius.circular(10.0),
            padding: EdgeInsets.zero,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(28.0),
          child: FFButtonWidget(
            onPressed: () async {
              int addProgress = (int.parse(widget._progressController.text));
              if (widget.book.status == "toRead" && widget.book.progress == 0) {
                widget.book.status = "reading";
              }

              widget.book.progress = addProgress;

              if (widget.book.progress! >= widget.book.pages) {
                widget.book.status = "read";
              }

              print(
                  "Progresso do livro ${widget.book.title} : ${widget.book.progress}");

              SQLHelper.updateItem(widget.book.id, widget.book);

              context.safePop();
              setState(() {});
            },
            text: "Lançar",
            options: FFButtonOptions(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 16.0),
              height: 40.0,
              color: Color(0xFF10403B),
              textStyle: FlutterFlowTheme.of(context)
                  .bodyLarge
                  .override(fontFamily: 'Readex Pro', color: Colors.white),
              elevation: 3.0,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ],
    );
  }
}
