import 'package:flutter/material.dart';
import 'package:home_cut/model/event.dart';
import 'package:home_cut/model/newEvent.dart';
import 'package:home_cut/provider/event_provider.dart';
import 'package:home_cut/provider/page_controller_provider.dart';
import 'package:home_cut/utils.dart';
import 'package:home_cut/widget/layout/basic_app_bar.dart';
import 'package:home_cut/widget/shared/buildDropdownField.dart';
import 'package:home_cut/widget/shared/buildHeader.dart';
import 'package:home_cut/widget/shared/button_with_icon.dart';
import 'package:home_cut/widget/shared/pickDateTime.dart';
import 'package:provider/provider.dart';

class EventEditingPage extends StatelessWidget {
  const EventEditingPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageController =
        Provider.of<PageControllerProvider>(context, listen: false)
            .pageController;
    final eventProvider = Provider.of<EventProvider>(context, listen: false);

    final bool isEditing = eventProvider.selectedEvent is Event;
    dynamic event;

    final _formKey = GlobalKey<FormState>();
    final titleController = TextEditingController();
    DateTime fromDate = DateTime.now();
    DateTime toDate = DateTime.now().add(const Duration(hours: 1));

    if (isEditing) {
      // Editando evento
      event = eventProvider.selectedEvent;
      titleController.text = event.title;
      fromDate = event.from;
      toDate = event.to;
    } else {
      // Criando evento
      event = NewEvent(
        title: '',
        description: '',
        from: fromDate,
        to: toDate,
      );
    }

    Future<void> saveForm({bool isEditing = false}) async {
      final isNotValid = !_formKey.currentState!.validate();
      if (isNotValid) return null;

      if (isEditing) {
        event = Event(
            id: event.id,
            title: titleController.text,
            from: fromDate,
            to: toDate,
            description: 'Descrição',
            isAllDay: false,
            idClient: event.idClient);
      } else {
        event = NewEvent(
            title: titleController.text,
            description: 'Mock Descrição',
            from: fromDate,
            isAllDay: false,
            to: toDate);
      }

      // Inicia loading
      // TODO
      // -- enviar uma requisição para o backend passando event
      // Requisição retorna 200 com id e clientId
      if (event is NewEvent) {
        event = Event(
            id: 'id_asdasdasd_211e32_123',
            title: event.title,
            description: event.description,
            from: event.from,
            to: event.to,
            idClient: 'id_acryqws_12312312_123');
      }

      if (isEditing) {
        eventProvider.editEvent(event);
      } else {
        eventProvider.addEvent(event);
      }

      print(eventProvider.events
          .toList()
          .map((event) => ' \n id: ${event.id} title: ${event.title}  '));
      eventProvider.setSelectedEvent = null;
      titleController.clear();
      final pageController =
          Provider.of<PageControllerProvider>(context, listen: false)
              .pageController;
      pageController.animateToPage(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

    return Scaffold(
      appBar: buildAppBar(
        context,
        () => pageController.animateToPage(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        ),
        'Agendamento',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                style: Theme.of(context).textTheme.titleMedium,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Adicionar título',
                ),
                onFieldSubmitted: (_) => saveForm(),
                validator: (title) => title != null && title.isEmpty
                    ? 'O título não pode estar vazio!'
                    : null,
                controller: titleController,
              ),
              const SizedBox(
                height: 12,
              ),
              Column(
                children: [
                  buildHeader(
                    header: 'Início',
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: buildDropdownField(
                            text: Utils.toDate(fromDate),
                            onClicked: () =>
                                pickDateTime(context, fromDate, pickDate: true)
                                    .then(
                              (date) {
                                if (date != null && date.isAfter(toDate)) {
                                  toDate = DateTime(
                                    date.year,
                                    date.month,
                                    date.day,
                                    toDate.hour,
                                    toDate.minute,
                                  );
                                }
                                fromDate = date ?? fromDate;
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            child: buildDropdownField(
                              text: Utils.toTime(fromDate),
                              onClicked: () => pickDateTime(context, fromDate,
                                      pickDate: false)
                                  .then(
                                (date) {
                                  if (date != null) {
                                    fromDate = DateTime(
                                      fromDate.year,
                                      fromDate.month,
                                      fromDate.day,
                                      date.hour,
                                      date.minute,
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  buildHeader(
                    header: 'Fim',
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: buildDropdownField(
                            text: Utils.toDate(toDate),
                            onClicked: () =>
                                pickDateTime(context, toDate, pickDate: true)
                                    .then(
                              (date) {
                                if (date != null && date.isBefore(fromDate)) {
                                  toDate = DateTime(
                                    fromDate.year,
                                    fromDate.month,
                                    fromDate.day,
                                    date.hour,
                                    date.minute,
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            child: buildDropdownField(
                              text: Utils.toTime(toDate),
                              onClicked: () =>
                                  pickDateTime(context, toDate, pickDate: false)
                                      .then(
                                (date) {
                                  if (date != null) {
                                    toDate = DateTime(
                                      toDate.year,
                                      toDate.month,
                                      toDate.day,
                                      date.hour,
                                      date.minute,
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  ButtonWithIcon(
                    buttonText: 'Agendar',
                    tooltipMessage: 'Criar agendamento',
                    isIconLeft: true,
                    icon: Icons.calendar_month_rounded,
                    onPressed: () => saveForm(isEditing: isEditing),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
