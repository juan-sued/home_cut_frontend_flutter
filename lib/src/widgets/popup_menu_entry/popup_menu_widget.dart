import 'package:flutter/material.dart';
import 'package:home_cut/src/widgets/popup_menu_entry/popup_menu_item_builder.dart';

class PopupMenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<String>>[
          CustomPopupMenuItem(
            icon: Icons.calendar_view_day_rounded,
            text: 'Dia',
            onPressed: () {
              print("visualização em dia");
            },
          ),
          CustomPopupMenuItem(
            icon: Icons.calendar_month_rounded,
            text: 'Mês',
            onPressed: () {
              print("visualização em mês");
            },
          ),
          CustomPopupMenuItem(
            icon: Icons.calendar_view_day_sharp,
            text: 'Agendamentos',
            onPressed: () {
              print("visualização em mês");
            },
          ),
          CustomPopupMenuItem(
            icon: Icons.calendar_month_rounded,
            text: 'Mês',
            onPressed: () {
              print("visualização em mês");
            },
          ),
        ];
      },
    );
  }
}
