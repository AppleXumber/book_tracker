import 'dart:convert';
import "dart:math";
import 'package:book_tracker/database/sql_helper.dart';

import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'book_info_model.dart';
export 'book_info_model.dart';
import 'package:book_tracker/classes/books.dart';
import '../../classes/show_data.dart';

class BookInfoWidget extends StatefulWidget {
  BookInfoWidget({
    Key? key,
    required this.book,
  }) : super(key: key);

  Book book;

  @override
  _BookInfoWidgetState createState() => _BookInfoWidgetState();
}

class _BookInfoWidgetState extends State<BookInfoWidget> {
  late BookInfoModel _model;

  returnTags(tags) {
    tags.forEach((int tag) => print(tag));
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
      if (book.image!.isNotEmpty) {
        return Image.memory(
          base64Decode(showData(book.image)),
          width: 100.0,
          height: 125.0,
          fit: BoxFit.cover,
        );
      } else if (book.image!.contains("http")) {
        return Image.network(
          "${book.image}",
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

  returnBigImage() {
    Book book = widget.book;

    if (book.image == null) {
      return Image.asset(
        "assets/images/no_cover_placeholder.jpg",
        width: 300.0,
        height: 200.0,
        fit: BoxFit.contain,
      );
    } else {
      if (book.image!.isNotEmpty) {
        return Image.memory(
          base64Decode(showData(book.image)),
          width: 300.0,
          height: 200.0,
          fit: BoxFit.contain,
        );
      } else if (book.image!.contains("http")) {
        return Image.network(
          "${book.image}",
          width: 300.0,
          height: 200.0,
          fit: BoxFit.contain,
        );
      } else if (book.image!.contains("asset") || book.image == null) {
        return Image.asset(
          "${book.image}",
          width: 300.0,
          height: 200.0,
          fit: BoxFit.contain,
        );
      }
    }
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookInfoModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    Book book = widget.book;

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).secondaryBackground,
              size: 30.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'rdgtooan' /* Livro */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 28.0,
                ),
          ),
          actions: [
            FlutterFlowIconButton(
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.delete_forever,
                color: FlutterFlowTheme.of(context).primaryBackground,
                size: 24.0,
              ),
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Row(
                        children: [
                          Text("Deletar", style: TextStyle(color: Colors.red)),
                          Icon(Icons.delete_forever, color: Colors.red),
                        ],
                      ),
                      content: const Text("Gostaria de deletar o livro?"),
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
                            SQLHelper.deleteItem(widget.book.id);
                            context.safePop();
                            context.safePop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            FlutterFlowIconButton(
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.mode_edit,
                color: FlutterFlowTheme.of(context).primaryBackground,
                size: 24.0,
              ),
              onPressed: () async {
                context.pushNamed('form_books', queryParameters: {
                  "bookJson": serializeParam(
                      jsonEncode(widget.book.toJson()), ParamType.JSON)
                }).then((value) => setState(() {
                      print("Recarregando tela");
                    }));
              },
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                  child: SelectionArea(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 12.0, 12.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.4,
                                height: 250.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: FlutterFlowExpandedImageView(
                                          image: returnBigImage(),
                                          allowRotation: false,
                                          tag: 'imageTag',
                                          useHeroAnimation: true,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: 'imageTag',
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(18.0),
                                      child: returnImage(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          showData(book.title),
                                          style: FlutterFlowTheme.of(context)
                                              .displaySmall
                                              .override(
                                                fontFamily: 'Outfit',
                                                fontSize: 28.0,
                                              ),
                                        ),
                                        FlutterFlowIconButton(
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,
                                          buttonSize: 50.0,
                                          icon: Icon(
                                            Icons.favorite_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            size: 36.0,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              print('IconButton pressed ...');
                                              print("id: ${book.id}");
                                              print("title: ${book.title}");
                                              print("author: ${book.author}");
                                              print("pages: ${book.pages}");
                                              print(
                                                  "chapters: ${book.chapters}");
                                              print(
                                                  "startReading: ${book.startReading}");
                                              print(
                                                  "endReading: ${book.endReading}");
                                              print(
                                                  "progress: ${book.progress}");
                                              print(
                                                  "How to Read: ${book.howToRead}");
                                              print(
                                                  "language: ${book.language}");
                                              print(
                                                  "editionPublicationDate: ${book.editionPublicationDate}");
                                              print("goal: ${book.goal}");
                                              print(
                                                  "publicationDate: ${book.publicationDate}");
                                              print("Status: ${book.status}");
                                              print("Tags: ${book.tags}");
                                              print("Type: ${book.type}");
                                              print("Imagem: ${book.image}");
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'u1g4qeib' /* Autor */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'trfv924u' /* : */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'mvmtc5h6' /* Páginas */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '8w66i8k2' /* : */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'gtuj94er' /* Capitulos */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'bcr072xq' /* : */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 18.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'r146dbdk' /* Início */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'a2yiqlgj' /* : */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'yzatmtad' /* Fim */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'adiaebk6' /* : */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  showData(book.author),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  showData(book.pages),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  showData(book.chapters),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 18.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    showData(book.startReading),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  showData(book.endReading),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 32.0, 0.0, 0.0),
                                      child: Text(
                                        book.progress.toString() +
                                            " páginas de " +
                                            book.pages.toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.black,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: LinearPercentIndicator(
                                        percent: book.progress! / book.pages,
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.45,
                                        lineHeight: 18.0,
                                        animation: true,
                                        progressColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .accent4,
                                        center: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0.0, 0.0, 220.0, 0.0),
                                          child: Text(
                                            "${((book.progress! / book.pages) * 100).floor()}%",
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .titleSmall,
                                          ),
                                        ),
                                        barRadius: Radius.circular(10.0),
                                        padding: EdgeInsets.zero,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sinopse:",
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            TextSynopsis(
                                text: showData(book.synopsis), maxLines: 3),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  '5dbmbihk' /* Data de lançamento */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 8.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'o9eqouo7' /* : */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                              Text(
                                showData(book.publicationDate),
                                maxLines: 5,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 14.0,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '4c6dqvla' /* Informações da edição */,
                            ),
                            style: FlutterFlowTheme.of(context).titleLarge,
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'dthhcbrz' /* Editora */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'epfmhln3' /* : */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'k4xb6fcw' /* Publicação */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '6dbvq99v' /* : */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '7o55oyjz' /* Idioma */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'n85v60f2' /* : */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'kv1knnsl' /* ISBN-10 */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'yxm7vs48' /* : */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'wi1oiswf' /* ISBN-13 */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '9ng0g5ot' /* : */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          "${book.publisher}",
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          showData(book.editionPublicationDate),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          showData(book.language),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            showData(book.isbn10),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          showData(book.isbn13),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'mh0l22mt' /* Tags */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 8.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '1kdbzclh' /* : */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    4.0, 0.0, 4.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width - 100,
                                  height: 35.0,
                                  child: TagsList(tagsString: book.tags),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'ow0vo51q' /* Tipo de livro */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'py7u4fao' /* : */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            showData(book.type),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
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
        ),
      ),
    );
  }
}

class TagsList extends StatelessWidget {
  TagsList({
    this.tagsString,
    super.key,
  });

  String? tagsString;

  int calculateValueFromWord(String word) {
    int value = 0;
    for (int i = 0; i < word.length; i++) {
      value += word.codeUnitAt(i);
    }

    value = (value * 37 + 13) % 256;

    return value;
  }

  Color calculateWordColor(String word) {
    int wordValue = calculateValueFromWord(word);
    String piString = pi.toString();
    String eString = e.toString();
    int randomPi = int.parse(piString.substring(word.length, word.length + 1));
    int randomE = int.parse(eString.substring(word.length, word.length + 1));

    int red = (wordValue * 5 * randomPi) % 256;
    int green = (wordValue * 7);
    green = (green * (randomE + randomPi * 2)) % 256;
    int blue = ((wordValue * 11) * randomE - randomPi) % 256;
    //print("$word - Blue: $blue Red: $red Green: $green");

    return Color.fromRGBO(red, green, blue, 1.0);
  }

  Color determineTextColor(Color backgroundColor) {
    final luminance = (0.299 * backgroundColor.red +
            0.587 * backgroundColor.green +
            0.114 * backgroundColor.blue) /
        255;

    return luminance > 0.5 ? Colors.black : Colors.white;
  }

  Widget build(BuildContext context) {
    List<String>? tags = tagsString?.split("-");
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: tags?.length,
        itemBuilder: (BuildContext context, int index) {
          String? tagText = tags?[index];
          if (tagText == null || tagText == "") {
            return Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 4.0),
              ),
            ));
          }

          return Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 4.0),
              child: Text(
                tagText,
                style: TextStyle(
                    color: determineTextColor(calculateWordColor(tagText))),
              ),
              color: calculateWordColor(tagText),
            ),
          ));
        });
  }
}

class TextSynopsis extends StatefulWidget {
  const TextSynopsis({
    required this.maxLines,
    super.key,
    required this.text,
  });

  final String text;
  final int maxLines;

  @override
  State<TextSynopsis> createState() => _TextSynopsisState();
}

class _TextSynopsisState extends State<TextSynopsis> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(widget.text,
          maxLines: _isExpanded ? null : widget.maxLines,
          overflow: _isExpanded ? null : TextOverflow.ellipsis,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Readex Pro',
                fontSize: 14.0,
              )),
      onPressed: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
    );
  }
}
