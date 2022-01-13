import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DataText extends StatelessWidget {

  final double? data;

  final Widget? title;

  const DataText({Key? key, this.data, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          DefaultTextStyle(
            style: theme.textTheme.headline6!.copyWith(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic
            ),
            child: title!,
          ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
          child: Text(
            data == null ? 'Keine Daten vorhanden' : NumberFormat.decimalPattern('de').format(data),
            style: theme.textTheme.headline2!.copyWith(
              color: theme.colorScheme.secondary,

            ),
          ),
        ),
      ],
    );
  }

}
