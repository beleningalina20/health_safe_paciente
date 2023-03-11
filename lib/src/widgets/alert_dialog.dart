import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/widgets/widgets.dart';

void showDialogCustom(BuildContext context, List<Widget> content,
    {bool barrierDismissible = true,
    void Function()? onAccept,
    void Function()? onCancel,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start}) {
  showDialog(
    context: context,
    useSafeArea: true,
    /*anchorPoint: ,
    barrierColor: ,*/
    barrierDismissible: barrierDismissible,
    /*barrierLabel: ,
    routeSettings: ,
    useRootNavigator: ,*/
    builder: (context) {
      return AlertDialog(
        title: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: Dimens.padding20),
              child: Image(
                  image: const AssetImage('assets/images/logo_health_safe.png'),
                  height: SizeConfig.height * 0.05),
            ),
            const BodyText(text: "Health Safe"),
          ],
        ),
        actions: [
          (onAccept != null)
              ? ElevatedButtonCustom(text: "Aceptar", onPressed: onAccept)
              : Container(),
          (onCancel != null)
              ? ElevatedButtonCustom(text: "Cancelar", onPressed: onCancel)
              : Container()
        ],
        actionsAlignment: MainAxisAlignment.center,
        /*actionsOverflowAlignment: ,
        actionsOverflowButtonSpacing: ,
        actionsOverflowDirection: ,
        actionsPadding: ,*/
        alignment: Alignment.center,
        backgroundColor: Colors.white,
        // buttonPadding: ,
        // clipBehavior: ,
        content: Column(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          mainAxisSize: MainAxisSize.min,
          children: content,
        ),
        contentPadding: EdgeInsets.all(Dimens.padding20),
        // contentTextStyle: Definido con el content,
        // elevation: ,
        // icon: , Agregado con el title como un row el logo
        // iconColor: ,
        // iconPadding: ,
        /*insetPadding: ,
        key: ,
        scrollable: ,
        semanticLabel: ,*/
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.roundedCornerRadius10),
          // side:
        ),
        titlePadding: EdgeInsets.all(Dimens.padding20),
        // titleTextStyle: Definido con el title
      );
    },
  );
}
