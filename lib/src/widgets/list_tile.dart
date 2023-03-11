import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/widgets/widgets.dart';

class ListTileDrawerOption extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final Color textColor;

  const ListTileDrawerOption({
    super.key,
    this.onTap,
    required this.title,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      /*autofocus: ,*/
      contentPadding: EdgeInsets.symmetric(
          horizontal: Dimens.padding20, vertical: Dimens.padding10),
      /*dense: ,
      enableFeedback: ,
      enabled: ,
      focusColor: ,
      focusNode: ,
      horizontalTitleGap: ,
      hoverColor: ,
      iconColor: ,
      isThreeLine: ,
      key: ,
      leading: ,
      minLeadingWidth: ,
      minVerticalPadding: ,
      mouseCursor: ,
      onLongPress: ,*/
      onTap: onTap,
      selected: true,
      selectedColor: Colors.blue,
      /*selectedTileColor: ,*/
      // shape: RoundedRectangleBorder(),
      /*style: ,*/
      // subtitle: Text("Subtitle"),
      // textColor: textColor,
      // tileColor: Colors.red,
      title: DescriptionText(text: title, color: textColor),
      /*trailing: ,
      visualDensity: ,*/
    );
  }
}
