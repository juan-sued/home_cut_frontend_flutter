import 'package:flutter/material.dart';
import 'package:home_cut/src/provider/event_provider.dart';
import 'package:home_cut/src/provider/page_controller_provider.dart';
import 'package:home_cut/src/models/event_model.dart';
import 'package:home_cut/src/models/newEvent_model.dart';
import 'package:home_cut/src/widgets/TextFormField.dart';
import 'package:home_cut/src/widgets/buildDropdownField.dart';
import 'package:home_cut/src/widgets/buildHeader.dart';
import 'package:home_cut/src/widgets/pickDateTime.dart';
import 'package:home_cut/src/widgets/snackbar_widget.dart';
import 'package:home_cut/utils.dart';
import 'package:home_cut/src/widgets/basic_app_bar.dart';
import 'package:home_cut/src/widgets/button_with_icon.dart';
import 'package:provider/provider.dart';

class EventEditingPage extends StatelessWidget {
  const EventEditingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageController =
        Provider.of<PageControllerProvider>(context, listen: false)
            .pageController;
    final eventProvider = Provider.of<EventProvider>(context, listen: false);

    final bool isEditing = eventProvider.selectedEvent is EventModel;
    dynamic event;

    final _formKey = GlobalKey<FormState>();
    final TextEditingController titleController = TextEditingController();
    DateTime fromDate = DateTime.now();
    DateTime toDate = DateTime.now().add(const Duration(hours: 1));

    if (isEditing) {
      event = eventProvider.selectedEvent;
      titleController.text = event.title;
      fromDate = event.from;
      toDate = event.to;
    } else {
      event = NewEvent_model(
        title: '',
        description: '',
        from: fromDate,
        to: toDate,
      );
    }

    Future<void> saveForm({bool isEditing = false}) async {
      if (!_formKey.currentState!.validate()) return;
      if (isEditing) {
        event = EventModel(
            id: event.id,
            title: titleController.text,
            from: fromDate,
            to: toDate,
            description: 'Descrição',
            isAllDay: false,
            idClient: event.idClient);

        eventProvider.editEvent(event);
      } else {
        event = NewEvent_model(
            title: titleController.text,
            description: 'Mock Descrição',
            from: fromDate,
            isAllDay: false,
            to: toDate);

//simulação de resposta do backend
        event = EventModel(
            id: Utils.generateRandomMongoId(),
            title: event.title,
            description: event.description,
            from: event.from,
            to: event.to,
            idClient: 'id_acryqws_12312312_123');

        eventProvider.addEvent(event);
      }
      CustomSnackBar.show(
        context: context,
        message: isEditing
            ? 'Evento editado com sucesso!'
            : 'Evento agendado com sucesso!',
        type: 'success',
      );
      print(eventProvider.events
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
              TextFormFieldBasic(
                controller: titleController,
                onSubmitted: (_) => saveForm(),
                validator: (title) => title != null && title.isEmpty
                    ? 'O título não pode estar vazio!'
                    : null,
                hintText: 'Adicionar título',
              ),
              const SizedBox(height: 12),
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
