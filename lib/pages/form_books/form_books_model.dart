import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'form_books_widget.dart' show FormBooksWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class FormBooksModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for titleField widget.
  TextEditingController? titleFieldController;
  String? Function(BuildContext, String?)? titleFieldControllerValidator;
  String? _titleFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '4w3z7ngm' /* Preencha o campo corretamente */,
      );
    }

    if (val.length < 1) {
      return FFLocalizations.of(context).getText(
        'pga5zl7l' /* Preencha o campo corretamente */,
      );
    }

    return null;
  }

  // State field(s) for authorField widget.
  TextEditingController? authorFieldController;
  String? Function(BuildContext, String?)? authorFieldControllerValidator;
  String? _authorFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3uw819xx' /* Preencha o campo corretamente */,
      );
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for pagesField widget.
  TextEditingController? pagesFieldController;
  String? Function(BuildContext, String?)? pagesFieldControllerValidator;
  String? _pagesFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'kjtwvfll' /* Insira uma quantidade de págin... */,
      );
    }

    return null;
  }

  // State field(s) for chapField widget.
  TextEditingController? chapFieldController;
  String? Function(BuildContext, String?)? chapFieldControllerValidator;
  // State field(s) for descField widget.
  TextEditingController? descFieldController;
  String? Function(BuildContext, String?)? descFieldControllerValidator;
  // State field(s) for typeRadio widget.
  FormFieldController<String>? typeRadioValueController;
  // State field(s) for tagFIeld widget.
  TextEditingController? tagFieldController;
  String? Function(BuildContext, String?)? tagFieldControllerValidator;
  // State field(s) for publisherField widget.
  TextEditingController? publisherFieldController;
  String? Function(BuildContext, String?)? publisherFieldControllerValidator;
  // State field(s) for isbn10Field widget.
  TextEditingController? isbn10FieldController;
  String? Function(BuildContext, String?)? isbn10FieldControllerValidator;
  // State field(s) for isbn13Field widget.
  TextEditingController? isbn13FieldController;
  String? Function(BuildContext, String?)? isbn13FieldControllerValidator;
  // State field(s) for editionField widget.
  TextEditingController? editionFieldController;
  String? Function(BuildContext, String?)? editionFieldControllerValidator;
  // State field(s) for langField widget.
  TextEditingController? langFieldController;
  String? Function(BuildContext, String?)? langFieldControllerValidator;
  // State field(s) for dateField widget.
  TextEditingController? dateFieldController;
  final dateFieldMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? dateFieldControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    titleFieldControllerValidator = _titleFieldControllerValidator;
    authorFieldControllerValidator = _authorFieldControllerValidator;
    pagesFieldControllerValidator = _pagesFieldControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    titleFieldController?.dispose();
    authorFieldController?.dispose();
    pagesFieldController?.dispose();
    chapFieldController?.dispose();
    descFieldController?.dispose();
    tagFieldController?.dispose();
    publisherFieldController?.dispose();
    isbn10FieldController?.dispose();
    isbn13FieldController?.dispose();
    editionFieldController?.dispose();
    langFieldController?.dispose();
    dateFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get typeRadioValue => typeRadioValueController?.value;
}
