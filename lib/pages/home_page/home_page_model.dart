import '/components/drawer_widget.dart';
import '/components/bookSummary_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.
  final unfocusNode = FocusNode();
  // Model for drawer component.
  late DrawerModel drawerModel;
  // Model for reading_in_progress component.
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
