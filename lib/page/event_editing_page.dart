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
        children: [buildFrom()],
      );

  Widget buildFrom() => Row(
        children: [
          Expanded(
              child: buildDropdownField(
                  text: Utils.toDate(fromDate), onClicked: () => {})),
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
}
