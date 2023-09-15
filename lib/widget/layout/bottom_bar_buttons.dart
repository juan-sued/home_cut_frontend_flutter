import 'package:flutter/material.dart';
import 'package:home_cut/page/event_editing_page.dart';
import 'package:home_cut/widget/service/page_builders.dart';

class BottomBarButtons extends StatelessWidget {
  const BottomBarButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Tooltip(
              height: Theme.of(context).tooltipTheme.height,
              verticalOffset: Theme.of(context).tooltipTheme.verticalOffset,
              message: 'Fechar agenda',
              child: Container(
                margin: const EdgeInsetsDirectional.only(end: 10),
                child: ElevatedButton(
                  onPressed: () {
                    // O que fazer quando o botão for pressionado
                    // ignore: avoid_print
                    print('Botão 2 pressionado!');
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      overlayColor: MaterialStateProperty.all(
                          Theme.of(context).colorScheme.secondary),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      padding: const MaterialStatePropertyAll(
                          EdgeInsetsDirectional.all(10))),
                  child: Icon(
                    Icons.lock_rounded,
                    size: 30,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Tooltip(
                height: Theme.of(context).tooltipTheme.height,
                verticalOffset: Theme.of(context).tooltipTheme.verticalOffset,
                message: 'Criar agendamento',
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context)
                      .push(overlapPageRouteBuilder(const EventEditingPage())),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).colorScheme.tertiary),
                      overlayColor: MaterialStateProperty.all(
                          Theme.of(context).colorScheme.secondary),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      padding: const MaterialStatePropertyAll(
                          EdgeInsetsDirectional.all(10))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Novo Agendamento',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold)),
                      const Icon(
                        Icons.keyboard_double_arrow_right_rounded,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
