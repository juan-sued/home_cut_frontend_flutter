import 'package:flutter/material.dart';
import 'package:home_cut/model/event.dart';
import 'package:home_cut/utils.dart';

class EventEditingPage extends StatefulWidget {
  const EventEditingPage({super.key, this.event});

  final Event? event;

  @override
  State<EventEditingPage> createState() => _EventEditingPageState();
}

class _EventEditingPageState extends State<EventEditingPage> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  late DateTime fromDate;
  late DateTime toDate;
  @override
  void initState() {
    super.initState();

    if (widget.event == null) {
      fromDate = DateTime.now();
      toDate = DateTime.now().add(const Duration(hours: 2));
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          leading: const CloseButton(),
          titleTextStyle: TextStyle(shadows: [
            Shadow(
              blurRadius: 3.0, // Define o raio do desfoque da sombra
              color: Colors.black.withOpacity(0.3), // Define a cor da sombra
              offset: const Offset(1, 1), // Define o deslocamento da sombra
            ),
          ]),
          title: Text('Agendamento',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Theme.of(context).colorScheme.secondary)),
        ),
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
                buildDateTimePickers()
              ],
            ),
          ),
        ));
  }

  Widget buildTitle() => TextFormField(
        style: const TextStyle(fontSize: 24),
        decoration: const InputDecoration(
            border: UnderlineInputBorder(), hintText: 'Adicionar título'),
        onFieldSubmitted: (_) {},
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
                    onClicked: () => pickFromDateTime(pickDate: true))),
            Expanded(
                flex: 2,
                child: SizedBox(
                  child: buildDropdownField(
                      text: Utils.toTime(fromDate),
                      onClicked: () => pickFromDateTime(pickDate: false)),
                )),
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
                    onClicked: () => pickToDateTime(pickDate: true))),
            Expanded(
                flex: 2,
                child: SizedBox(
                  child: buildDropdownField(
                      text: Utils.toTime(toDate),
                      onClicked: () => pickToDateTime(pickDate: false)),
                )),
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
          child
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
        date.minute,
        date.hour,
        date.day,
        date.month,
        date.year,
      );
    }

    setState(() => fromDate = date);
  }

  Future pickToDateTime({required bool pickDate}) async {
    final date = await pickDateTime(toDate, pickDate: pickDate);

    if (date == null) return null;
    if (date.isAfter(toDate)) {
      toDate = DateTime(
        date.minute,
        date.hour,
        date.day,
        date.month,
        date.year,
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
        lastDate: firstDate != null
            ? firstDate.add(const Duration(hours: 3))
            : DateTime.now().add(const Duration(hours: 3)),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: Theme.of(context).copyWith(
              textTheme: const TextTheme(
                headlineLarge: TextStyle(fontSize: 35),
                titleSmall: TextStyle(fontSize: 19),
                labelLarge: TextStyle(fontSize: 15),
              ),
            ),
            child: child!,
          );
        },
      );

      if (date == null) return null;

      final time =
          Duration(hours: initialDate.hour, minutes: initialDate.minute);

      return date.add(time);
    } else {
      final timeOfDay = await showTimePicker(
          context: context, initialTime: TimeOfDay.fromDateTime(initialDate));

      if (timeOfDay == null) return null;

      final date = DateTime(
        initialDate.day,
        initialDate.month,
        initialDate.year,
      );

      final time = Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);

      return date.add(time);
    }
  }
}
