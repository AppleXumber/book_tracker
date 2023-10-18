import 'dart:convert';

import 'package:book_tracker/database/sql_helper.dart';
import 'package:book_tracker/pages/book_info/book_info_widget.dart';

import '../classes/books.dart';
import '../../classes/show_data.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'bookSummary_model.dart';
export 'bookSummary_model.dart';

class BookSummary extends StatefulWidget {
  BookSummary(this.book, {Key? key}) : super(key: key);
  final Book book;

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
    Book book = widget.book;
    if (book.status == "reading") {
      return TextButton(
        child: TextReadStatusButton(text: "Lançar"),
        onPressed: () {
          showModalBottomSheet(
                  context: context,
                  elevation: 5,
                  isScrollControlled: true,
                  builder: (context) => ModalContainer(book: book))
              .then((value) => setState(() {}));
        },
        onLongPress: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return ResetAlertDialog(book: book);
            },
          );
        },
      );
    } else if (book.status == "toRead") {
      return TextButton(
        child: TextReadStatusButton(text: "Iniciar"),
        onPressed: () {
          showModalBottomSheet(
                  context: context,
                  elevation: 5,
                  isScrollControlled: true,
                  builder: (context) => ModalContainer(book: book))
              .then((value) => setState(() {}));
        },
      );
    } else if (book.status == "read") {
      return TextButton(
        child: TextReadStatusButton(text: "Reiniciar"),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return ResetAlertDialog(book: book);
            },
          );
        },
      );
    }
  }

  returnImage() {
    Book book = widget.book;

    if (book.image == null) {
      return Image.asset(
        "assets/images/no_cover_placeholder.jpg",
        width: 100.0,
        height: 125.0,
        fit: BoxFit.cover,
      );
    } else {
      if (book.image!.contains("http")) {
        return Image.network(
          "${book.image}",
          width: 100.0,
          height: 125.0,
          fit: BoxFit.cover,
        );
      } else if (book.image!.isNotEmpty) {
        return Image.memory(
          base64Decode(showData(book.image)),
          width: 100.0,
          height: 125.0,
          fit: BoxFit.cover,
        );
      } else if (book.image!.contains("asset") || book.image == null) {
        return Image.asset(
          "assets/images/no_cover_placeholder.jpg",
          width: 100.0,
          height: 125.0,
          fit: BoxFit.cover,
        );
      }
    }

  }

  /*else {
      return Image.network(
        'https://www.lojadobolseiro.com.br/uploads/images/2020/02/76-livro-o-hobbit-capa-smaug-j-r-r-tolkien-1582738560.jpg',
        width: 100.0,
        height: 125.0,
        fit: BoxFit.cover,
      );
    }*/

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
    Book book = widget.book;
    if (book.status == "toRead") {
      book.startReading = "";
      book.endReading = "";
    }
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
                        builder: (context) => BookInfoWidget(book: book))).then(
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
                            book.title,
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
                                      showData(book.startReading),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.white,
                                          ),
                                    ),
                                    Text(
                                      showData(book.endReading),
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
                                  book.progress.toString() +
                                      " ${book.howToRead.toString().toLowerCase().substring(0, book.howToRead.toString().length - 1)}" +
                                      (book.progress! > 1 ? "s" : "") +
                                      " de " +
                                      (book.howToRead == "Páginas"
                                          ? book.pages.toString()
                                          : book.chapters.toString()),
                                  // eu amo fazer código espaghetti

                                  /*
                                  * book.howToRead == "Páginas"
                                      ? book.progress.toString() +
                                          " páginas de " +
                                          book.pages.toString()
                                      : book.progress.toString() +
                                          " capítulos de " +
                                          book.chapters.toString(),
                                    */
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                      ),
                                ),
                                LinearPercentIndicator(
                                  percent: book.howToRead == "Páginas"
                                      ? book.progress! / book.pages
                                      : (book.progress! /
                                          int.parse(book.chapters.toString())),
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

class ResetAlertDialog extends StatelessWidget {
  const ResetAlertDialog({
    super.key,
    required this.book,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Row(
        children: [Text("Reiniciar"), Icon(Icons.restore_outlined)],
      ),
      content: const Text("Gostaria de reiniciar a leitura?"),
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
            book.status = "toRead";
            book.progress = 0;
            SQLHelper.updateItem(book.id, book);
            context.safePop();
          },
        ),
      ],
    );
  }
}

class TextReadStatusButton extends StatelessWidget {
  const TextReadStatusButton({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Readex Pro',
            color: Colors.white,
            fontSize: 18.0,
          ),
    );
  }
}

class ModalContainer extends StatelessWidget {
  const ModalContainer({
    super.key,
    required this.book,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    bool isStartReading = book.status != "toRead";
    print(isStartReading);
    return Container(
      padding: EdgeInsets.only(
        top: 15,
        left: 15,
        right: 15,
        // this will prevent the soft keyboard from covering the text fields
        bottom: MediaQuery.of(context).viewInsets.bottom + 120,
      ),
      child: isStartReading
          ? FormProgress(
              book: book,
            )
          : StartReading(
              book: book,
            ),
    );
  }
}

class FormProgress extends StatefulWidget {
  FormProgress({
    super.key,
    required this.book,
  });

  final Book book;

  @override
  State<FormProgress> createState() => _FormProgressState();
}

class _FormProgressState extends State<FormProgress> {
  final TextEditingController _progressController = TextEditingController();
  final TextEditingController _totalController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Book book = widget.book;
    var intProgress = int.tryParse(showData(book.progress));
    var intGoal = int.tryParse(showData(book.goal));
    int progressAdded = intProgress! + intGoal!;
    _progressController.text = progressAdded.toString();
    if (book.howToRead == "Páginas") {
      _totalController.text = book.pages.toString();
    } else if (book.howToRead == "Capitulos") {
      _totalController.text = book.chapters.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    Book book = widget.book;

    int howManyDays = ((int.parse(_totalController.text) -
                int.parse(_progressController.text)) /
            int.parse(showData(book.goal)))
        .ceil();

    String prediction = DateFormat("dd/MM/yyyy")
        .format(DateTime.now().add(Duration(days: howManyDays)));

    double percentage =
        int.parse(_progressController.text) / int.parse(_totalController.text);
    if (percentage > 1) {
      percentage = 1;
      _progressController.text = _totalController.text;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Lançar leitura para o livro: ${book.title}",
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: TextField(
                controller: _progressController,
                decoration: const InputDecoration(hintText: 'Paginas lidas'),
                keyboardType: TextInputType.number,
                autofocus: true,
                onTapOutside: (value) {
                  return;
                },
                onChanged: (value) {
                  if (int.parse(_progressController.text) >
                      int.parse(_totalController.text)) {
                    _progressController.text = _totalController.text;
                  }
                  if (percentage > 1) {
                    percentage = 1;
                  }
                  setState(() {});
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text("/", style: TextStyle(fontSize: 24)),
            ),
            Expanded(
              child: TextField(
                controller: _totalController,
                decoration: const InputDecoration(hintText: 'Paginas totais'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (int.parse(_progressController.text) >
                      int.parse(_totalController.text)) {
                    _progressController.text = _totalController.text;
                  }

                  if (percentage > 1) {
                    percentage = 1;
                  }
                  setState(() {});
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
                "${((int.parse(_progressController.text) / int.parse(_totalController.text)) * 100).floor()}%",
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).titleSmall,
              ),
            ),
            barRadius: Radius.circular(10.0),
            padding: EdgeInsets.zero,
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 6),
              child: Text(
                "Previsão de fim: $prediction",
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(28.0),
          child: FFButtonWidget(
            onPressed: () {
              setState(() async {
                int addProgress = int.parse(_progressController.text);
                int total = int.parse(_totalController.text);

                if (book.status == "toRead" && book.progress == 0) {
                  book.status = "reading";
                  context.safePop();
                }

                book.progress = addProgress;
                if (book.howToRead == "Páginas") {
                  book.pages = total;
                } else if (book.howToRead == "Capítulos") {
                  book.chapters = total;
                }

                print("Progresso do livro ${book.title} : ${book.progress}");

                book.endReading = prediction;
                SQLHelper.updateItem(book.id, book);
                context.safePop();

                if (book.progress! >= total) {
                  book.status = "read";
                  book.endReading =
                      DateFormat("dd/MM/yyyy").format(DateTime.now());

                  await showDialog(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: Text('Livro concluído'),
                        content: Text('Parabéns! Você terminou mais um livro!'),
                        actions: [
                          TextButton(
                            onPressed: () => alertDialogContext.safePop(),
                            child: Text('Ok'),
                          ),
                        ],
                      );
                    },
                  );
                }
              });
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

class StartReading extends StatefulWidget {
  StartReading({
    super.key,
    required this.book,
  });

  final Book book;

  @override
  State<StartReading> createState() => StartReadingState();
}

class StartReadingState extends State<StartReading> {
  TextEditingController _goal = TextEditingController();
  TextEditingController _dateController = TextEditingController();

  String _howToRead = "Páginas";
  String _howEnd = "daily";
  int howManyDays = 0;
  String prediction = DateFormat("dd/MM/yyyy").format(DateTime.now());

  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Book book = widget.book;

    return Padding(
      padding: const EdgeInsets.all(5.5),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Inicar o livro: ${book.title}",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rastrear por:",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<String>(
                            title: Text("Páginas"),
                            value: "Páginas",
                            groupValue: _howToRead,
                            onChanged: (value) {
                              setState(() {
                                _howToRead = value.toString();
                                print(_howToRead);
                              });
                            }),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text("Capítulos",
                              style: book.chapters == 0
                                  ? TextStyle(
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough,
                                    )
                                  : TextStyle()),
                          value: "Capitulos",
                          groupValue: _howToRead,
                          onChanged: (value) {
                            setState(() {
                              if (book.chapters == 0) {
                                _howToRead = "Páginas";
                                showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title:
                                          Text('Este livro não tem capítulos.'),
                                      content: Text(
                                          'Cadastre uma quantidade de capítulos para estre livro.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              alertDialogContext.safePop(),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else {
                                _howToRead = value.toString();
                              }
                              print(_howToRead);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Como será sua meta:",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<String>(
                            title: _howToRead == "Páginas"
                                ? Text("$_howToRead diárias")
                                : Text("$_howToRead diários"),
                            value: "daily",
                            groupValue: _howEnd,
                            onChanged: (value) {
                              setState(() {
                                _howEnd = value.toString();
                                print(_howEnd);
                              });
                            }),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text("Meta de data final"),
                          value: "finalDate",
                          groupValue: _howEnd,
                          onChanged: (value) {
                            setState(() {
                              _howEnd = value.toString();
                              print(_howEnd);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _howEnd == "daily"
                  ? TextFormField(
                      controller: _goal,
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      decoration: InputDecoration(
                        icon: Icon(Icons.book),
                        hintText: "$_howToRead por dia",
                      ),
                      validator: (value) {
                        if (valueValidator(value)) {
                          return "Insira uma quantidade de $_howToRead";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          if (_goal.text == "" || _goal.text == "0") {
                            howManyDays = 0;
                          } else {
                            if (_howToRead == "Páginas") {
                              howManyDays =
                                  (book.pages / int.parse(_goal.text)).ceil();
                            } else if (_howToRead == "Capitulos") {
                              howManyDays =
                                  (book.chapters! / int.parse(_goal.text))
                                      .ceil();
                            }
                          }

                          if (int.parse(_goal.text) > book.pages) {
                            _goal.text = book.pages.toString();
                          }
                          _dateController.text = DateFormat("dd/MM/yyyy")
                              .format(DateTime.now()
                                  .add(Duration(days: howManyDays)));
                          prediction = _dateController.text;
                          print("Quantos dias: $howManyDays");
                        });
                      },
                    )
                  : TextField(
                      controller: _dateController,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.calendar_today),
                          labelText: "Data final"),
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate:
                                DateTime.now().add(Duration(days: howManyDays)),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2101));

                        if (pickedDate != null) {
                          print(pickedDate);
                          String formattedDate =
                              DateFormat('dd/MM/yyyy').format(pickedDate);
                          print(formattedDate);

                          howManyDays = int.parse(pickedDate
                                  .difference(DateTime.now())
                                  .inDays
                                  .toString()) +
                              1;

                          print("Quantos dias: $howManyDays");

                          if (_howToRead == "Páginas") {
                            _goal.text =
                                (book.pages / howManyDays).ceil().toString();
                          } else if (_howToRead == "Capitulos") {
                            _goal.text = (book.chapters! / howManyDays)
                                .ceil()
                                .toString();
                          }

                          print("Goal: ${(book.pages / howManyDays).ceil()}");
                          prediction = DateFormat("dd/MM/yyyy").format(
                              DateTime.now().add(Duration(days: howManyDays)));

                          setState(() {
                            _dateController.text = formattedDate;
                          });
                        } else {
                          print("Date is not selected");
                        }
                      }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _howEnd == "daily"
                  ? Column(
                      children: [
                        Text("Previsão de término: $prediction"),
                        Text("($howManyDays dias de leitura)"),
                      ],
                    )
                  : Column(
                      children: [
                        _howToRead == "Páginas"
                            ? Text("$_howToRead diárias: ${_goal.text}")
                            : Text("$_howToRead diários: ${_goal.text}"),
                        Text("($howManyDays dias de leitura)"),
                      ],
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: FFButtonWidget(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print("Teste");
                    book.howToRead = _howToRead;
                    book.goal = _goal.value.text;
                    book.status = "reading";
                    book.startReading =
                        DateFormat("dd/MM/yyyy").format(DateTime.now());
                    book.endReading = prediction;
                    print(
                        "Como ler: ${book.howToRead}\nQuanto ler: ${book.goal}");
                    SQLHelper.updateItem(book.id, book);
                    context.safePop();
                    context.safePop();
                  }
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
        ),
      ),
    );
  }
}
