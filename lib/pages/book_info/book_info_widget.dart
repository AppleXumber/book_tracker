import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'book_info_model.dart';
export 'book_info_model.dart';
import 'package:book_tracker/classes/books.dart';

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

  showData(data) {
    if (data != null) {
      return "${data}";
    } else if (data == null) {
      return "";
    }
  }

  returnTags(tags) {
    tags.forEach((int tag) => print(tag));
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
                Icons.mode_edit,
                color: FlutterFlowTheme.of(context).primaryBackground,
                size: 24.0,
              ),
              onPressed: () async {
                context.pushNamed('form_books', queryParameters: {
                  "bookJson": serializeParam(
                      jsonEncode(widget.book.toJson()), ParamType.JSON)
                });
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
                                        image: Image.network(
                                          showData(widget.book.image),
                                          fit: BoxFit.contain,
                                        ),
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
                                    child: Image.network(
                                      showData(widget.book.image),
                                      width: 300.0,
                                      height: 200.0,
                                      fit: BoxFit.contain,
                                    ),
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
                                        showData(widget.book.title),
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
                                          print('IconButton pressed ...');
                                          //print(widget.book.startReading);
                                          print(widget.book.type);
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
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
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
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                                showData(widget.book.author),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                showData(widget.book.pages),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                showData(widget.book.chapters),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 18.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  showData(
                                                      widget.book.startReading),
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
                                                showData(
                                                    widget.book.endReading),
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                      widget.book.progress.toString() +
                                          " páginas de " +
                                          widget.book.pages.toString(),
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
                                      percent: widget.book.progress! /
                                          widget.book.pages,
                                      width: MediaQuery.sizeOf(context).width *
                                          0.45,
                                      lineHeight: 18.0,
                                      animation: true,
                                      progressColor:
                                          FlutterFlowTheme.of(context).primary,
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).accent4,
                                      center: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 0.0, 220.0, 0.0),
                                        child: Text(
                                          "${((widget.book.progress! / widget.book.pages) * 100).floor()}%",
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
                          SelectionArea(
                            child: textSynopsis(
                                text: showData(widget.book.synopsis),
                                maxLines: 3),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
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
                            SelectionArea(
                                child: Text(
                              showData(widget.book.publicationDate),
                              maxLines: 5,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 14.0,
                                  ),
                            )),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
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
                                        "${widget.book.publisher}",
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        showData(
                                            widget.book.editionPublicationDate),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        showData(widget.book.language),
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
                                          showData(widget.book.isbn10),
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
                                        showData(widget.book.isbn13),
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
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
                                width: 75.0,
                                height: 20.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF4BE3DB),
                                ),
                                child: SelectionArea(
                                    child: Text(
                                  showData(widget.book.tags),
                                  maxLines: 5,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 14.0,
                                      ),
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Column(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          showData(widget.book.type),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class textSynopsis extends StatefulWidget {
  const textSynopsis({
    required this.maxLines,
    super.key,
    required this.text,
  });

  final String text;
  final int maxLines;

  @override
  State<textSynopsis> createState() => _textSynopsisState();
}

class _textSynopsisState extends State<textSynopsis> {
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
