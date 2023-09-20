import 'package:flutter/material.dart';
import 'package:home_cut/model/event.dart';
import 'package:home_cut/model/newEvent.dart';
import 'package:home_cut/provider/event_provider.dart';
import 'package:home_cut/provider/page_controller_provider.dart';
import 'package:home_cut/utils.dart';
import 'package:home_cut/widget/layout/basic_app_bar.dart';
import 'package:home_cut/widget/shared/button_with_icon.dart';
import 'package:provider/provider.dart';

class EventEditingPage extends StatefulWidget {
  const EventEditingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<EventEditingPage> createState() => _EventEditingPageState();
}

class _EventEditingPageState extends State<EventEditingPage> {
  late dynamic event;
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now().add(const Duration(hours: 1));
  late bool isEditing;
  late EventProvider eventProvider;
  @override
  void initState() {
    super.initState();
    eventProvider = Provider.of<EventProvider>(context, listen: false);
    isEditing = eventProvider.selectedEvent is Event;

    if (isEditing) {
      //Editando evento
      event = eventProvider.selectedEvent;
      titleController.text = event.title;
      fromDate = event.from;
      toDate = event.to;
    } else {
      //criando evento
      event = NewEvent(
        title: '',
        description: '',
        from: fromDate,
        to: toDate,
      );
    }
  }

  void didChangeDependencies() {
    /// Este método é chamado quando as dependências do widget mudam.
    super.didChangeDependencies();

    Future.microtask(() {
      // Coloca a execução desta tarefa no final da fila de microtarefas.
      eventProvider.setSelectedEvent = null;
    });
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pageController =
        Provider.of<PageControllerProvider>(context, listen: false)
            .pageController;

    return Scaffold(
      appBar: buildAppBar(
          context,
          () => pageController.animateToPage(
                0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              ),
          'Agendamento'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              buildTitle(),
              const SizedBox(
                height: 12,
              ),
              buildDateTimePickers(),
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

  Future saveForm({bool isEditing = false}) async {
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

    //init loading
    //TODO
    // -- enviar uma requisição para o backend passando event
    //requisição retorna 200 com id e clientId
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

    final pageController =
        Provider.of<PageControllerProvider>(context, listen: false)
            .pageController;
    pageController.animateToPage(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Widget buildTitle() => TextFormField(
        style: Theme.of(context).textTheme.titleMedium,
        decoration: const InputDecoration(
            border: UnderlineInputBorder(), hintText: 'Adicionar título'),
        onFieldSubmitted: (_) => saveForm(),
        validator: (title) => title != null && title.isEmpty
            ? 'O título não pode estar vazio!'
            : null,
        controller: titleController,
      );

  Widget buildDateTimePickers() => Column(
        children: [buildFrom(), buildTo()],
      );

  Widget buildFrom() => buildHeader(
        header: 'Início',
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: buildDropdownField(
                text: Utils.toDate(fromDate),
                onClicked: () => pickFromDateTime(pickDate: true),
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                child: buildDropdownField(
                  text: Utils.toTime(fromDate),
                  onClicked: () => pickFromDateTime(pickDate: false),
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildTo() => buildHeader(
        header: 'Fim',
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: buildDropdownField(
                text: Utils.toDate(toDate),
                onClicked: () => pickToDateTime(pickDate: true),
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                child: buildDropdownField(
                  text: Utils.toTime(toDate),
                  onClicked: () => pickToDateTime(pickDate: false),
                ),
              ),
            ),
          ],
        ),
      );

  buildHeader({required String header, required Row child}) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          child,
        ],
      );

  Widget buildDropdownField({
    required String text,
    required VoidCallback onClicked,
  }) =>
      ListTile(
        title: Text(text),
        trailing: const Icon(Icons.arrow_drop_down_rounded),
        onTap: onClicked,
      );

  Future pickFromDateTime({required bool pickDate}) async {
    final date = await pickDateTime(fromDate, pickDate: pickDate);

    if (date == null) return null;
    if (date.isAfter(toDate)) {
      toDate = DateTime(
        date.year,
        date.month,
        date.day,
        toDate.hour,
        toDate.minute,
      );
    }

    setState(() => fromDate = date);
  }

  Future pickToDateTime({required bool pickDate}) async {
    final date = await pickDateTime(toDate, pickDate: pickDate);

    if (date == null) return null;
    if (date.isBefore(fromDate)) {
      toDate = DateTime(
        fromDate.year,
        fromDate.month,
        fromDate.day,
        date.hour,
        date.minute,
      );
    }

    setState(() => toDate = date);
  }

  Future<DateTime?> pickDateTime(
    DateTime initialDate, {
    required bool pickDate,
    DateTime? firstDate,
  }) async {
    if (pickDate) {
      final date = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate ?? DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365 * 100)),
      );

      if (date == null) return null;

      final time =
          Duration(hours: initialDate.hour, minutes: initialDate.minute);

      return date.add(time);
    } else {
      final timeOfDay = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(initialDate),
      );

      if (timeOfDay == null) return null;

      final date = DateTime(
        initialDate.year,
        initialDate.month,
        initialDate.day,
      );

      final time = Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);

      return date.add(time);
    }
  }
}
