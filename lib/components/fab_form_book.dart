import 'package:book_tracker/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

import '../classes/books.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';

class FabFormBook extends StatelessWidget {
  const FabFormBook({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {},
      backgroundColor: Color(0xFF4B9AE3),
      elevation: 8.0,
      child: FlutterFlowIconButton(
        borderRadius: 25.0,
        buttonSize: MediaQuery.sizeOf(context).width * 1.0,
        fillColor: FlutterFlowTheme.of(context).secondary,
        icon: Icon(
          Icons.add,
          color: Colors.white,
          size: 30.0,
        ),
        onPressed: () {
          print('IconButton pressed ...');
          context.pushNamed('form_books', queryParameters: {
            "bookJson": serializeParam(
                jsonEncode(emptyBook.toJson()), ParamType.JSON)
          });
        },
      ),
    );
  }
}