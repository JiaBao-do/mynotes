import 'package:flutter/material.dart';
import 'package:mynotes/utilities/dialogs/generic_dialog.dart';

Future<void> showCannotShareEmptyNoteDialog(BuildContext context) {
  return showGenericDialog(
    context: context,
    title: 'Warning!',
    content: 'You are not allowed to share an empty note!',
    optionBuilder: () => {
      'OK': null,
    },
  );
}
