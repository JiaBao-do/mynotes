import 'package:flutter/material.dart';
import 'package:mynotes/utilities/dialogs/generic_dialog.dart';

Future<void> showErrorDialog(
  BuildContext context,
  String content,
) {
  return showGenericDialog<void>(
    context: context,
    title: 'An Error Occurred!!',
    content: content,
    optionBuilder: () => {
      'Ok': null,
    },
  );
}
