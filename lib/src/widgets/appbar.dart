import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/widgets/widgets.dart';

class AppbarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppbarCustom({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    bool newMessage = true;
    return AppBar(
      // actionsIconTheme: ,
      // automaticallyImplyLeading: ,
      backgroundColor: Colors.white,
      // backwardsCompatibility: , Deprecado
      // bottom: ,
      // bottomOpacity: ,
      // brightness: , Deprecado
      // centerTitle: ,
      elevation: Dimens.elevation2,
      // excludeHeaderSemantics: ,
      // flexibleSpace: ,
      foregroundColor: Colors.grey[700],
      // iconTheme: ,
      // key: ,
      // leading: ,
      // leadingWidth: ,
      // notificationPredicate: ,
      // primary: ,
      // scrolledUnderElevation: ,
      // shadowColor: ,
      // shape: ,
      // surfaceTintColor: ,
      // systemOverlayStyle: ,
      // textTheme: , Deprecado
      // title:,
      // titleSpacing: ,
      // titleTextStyle: ,
      // toolbarHeight: ,
      // toolbarOpacity: ,
      // toolbarTextStyle: ,
      actions: <Widget>[
        IconButton(
            icon: Icon((newMessage)
                ? Icons.mark_chat_unread_outlined
                : Icons.mark_chat_unread_outlined),
            onPressed: () {
              // TODO Navegar al home del chatpage
            })
      ],
    );
  }
}

class RegistroAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final void Function()? onPressed;
  const RegistroAppbar(
      {super.key,
      required this.title,
      this.backgroundColor = ColorsApp.azulLogin,
      this.onPressed});

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        actions: [
          Center(
            child:
                IconButton(onPressed: onPressed, icon: const Icon(Icons.help)),
          )
        ],
        elevation: Dimens.elevation0,
        backgroundColor: backgroundColor,
        title: SubtitleText(text: title, color: Colors.white));
  }
}
