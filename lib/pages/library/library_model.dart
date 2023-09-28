import '/components/drawer_widget.dart';
import '/components/bookSummary_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LibraryModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for drawer component.
  late DrawerModel drawerModel;
  // Model for readingDone component.
  late BookSummaryModel bookSummaryModel;


  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    drawerModel = createModel(context, () => DrawerModel());
    bookSummaryModel = createModel(context, () => BookSummaryModel());
  }

  void dispose() {
    unfocusNode.dispose();
    drawerModel.dispose();
    bookSummaryModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
