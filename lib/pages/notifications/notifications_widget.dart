import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notifications_model.dart';
export 'notifications_model.dart';

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({Key? key}) : super(key: key);

  @override
  _NotificationsWidgetState createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  late NotificationsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsModel());
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
              '26uy9eae' /* Notificações */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.notifications,
                              color: Color(0xFF10403B),
                              size: 32.0,
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'earczt1r' /* Notificações */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 18.0,
                                  ),
                            ),
                            Switch.adaptive(
                              value: _model.switchValue ??= true,
                              onChanged: (newValue) async {
                                setState(() => _model.switchValue = newValue!);
                              },
                              activeColor: FlutterFlowTheme.of(context).primary,
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).accent1,
                              inactiveTrackColor:
                                  FlutterFlowTheme.of(context).alternate,
                              inactiveThumbColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                            ),
                          ],
                        ),
                        if (_model.switchValue != null)
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.access_time,
                                color: Color(0xFF10403B),
                                size: 32.0,
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'nd3q1rjo' /* Horário */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 18.0,
                                    ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FlutterFlowDropDown<String>(
                                    controller:
                                        _model.dropDownValueController1 ??=
                                            FormFieldController<String>(
                                      _model.dropDownValue1 ??=
                                          FFLocalizations.of(context).getText(
                                        'e6m6t9ne' /* 12 */,
                                      ),
                                    ),
                                    options: [
                                      FFLocalizations.of(context).getText(
                                        '6nalyz22' /* 00 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'd3y1jyms' /* 01 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'm85o06fk' /* 02 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'vvnxdrr4' /* 03 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '0ec7uyfg' /* 04 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'ho35hbex' /* 05 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'vmm4nmha' /* 06 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '6kqwkcfd' /* 07 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'ekwbk0z5' /* 08 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '7e55kfzb' /* 09 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'dmsr3gqc' /* 10 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'qqqf0nvm' /* 11 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'hws31jaz' /* 12 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '0tg6gtsg' /* 13 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'gjsxzu3v' /* 14 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '6dwmvq1e' /* 15 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'phk05bdq' /* 16 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'skhljcx5' /* 17 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '91jckd1a' /* 18 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'ko49e1f2' /* 19 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'g35s8pal' /* 20 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '4ivqqd6z' /* 21 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '7i6r4yiz' /* 22 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'e5a7q05z' /* 23 */,
                                      )
                                    ],
                                    onChanged: (val) => setState(
                                        () => _model.dropDownValue1 = val),
                                    width: 75.0,
                                    height: 50.0,
                                    textStyle:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderWidth: 2.0,
                                    borderRadius: 8.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 16.0, 4.0),
                                    hidesUnderline: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2.0, 0.0, 2.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '1twghrc3' /* : */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                  FlutterFlowDropDown<String>(
                                    controller:
                                        _model.dropDownValueController2 ??=
                                            FormFieldController<String>(
                                      _model.dropDownValue2 ??=
                                          FFLocalizations.of(context).getText(
                                        'fafciv57' /* 00 */,
                                      ),
                                    ),
                                    options: [
                                      FFLocalizations.of(context).getText(
                                        '0vkf4m54' /* 00 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '1kqj4pn2' /* 05 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'tb36i82y' /* 10 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'vpmia4fi' /* 15 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '9ep4jy1z' /* 20 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'mfmst4hr' /* 25 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'a40abh3m' /* 30 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'ycwk95gu' /* 35 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '33t03k2i' /* 40 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'bqphqgzo' /* 45 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '1ts0adi8' /* 50 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'l45ksnge' /* 55 */,
                                      )
                                    ],
                                    onChanged: (val) => setState(
                                        () => _model.dropDownValue2 = val),
                                    width: 75.0,
                                    height: 50.0,
                                    textStyle:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderWidth: 2.0,
                                    borderRadius: 8.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 16.0, 4.0),
                                    hidesUnderline: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ],
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
