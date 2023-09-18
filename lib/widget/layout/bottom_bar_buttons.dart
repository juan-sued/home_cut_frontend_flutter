import 'package:flutter/material.dart';
import 'package:home_cut/provider/page_controller_provider.dart';
import 'package:home_cut/widget/shared/button_with_icon.dart';
import 'package:provider/provider.dart';

class BottomBarButtons extends StatelessWidget {
  const BottomBarButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController =
        Provider.of<PageControllerProvider>(context, listen: false)
            .pageController;
    ThemeData theme = Theme.of(context);
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        decoration: BoxDecoration(color: Colors.transparent),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Tooltip(
              height: theme.tooltipTheme.height,
              verticalOffset: theme.tooltipTheme.verticalOffset,
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
                          theme.colorScheme.background.withOpacity(0.2)),
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
                    color: theme.colorScheme.background,
                  ),
                ),
              ),
            ),
            ButtonWithIcon(
              buttonText: 'Novo Agendamento',
              tooltipMessage: 'Criar agendamento',
              icon: Icons.keyboard_double_arrow_right_rounded,
              isIconLeft: false,
              onPressed: () => pageController.animateToPage(
                1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              ),
            )
          ],
        ),
      ),
    );
  }
}
