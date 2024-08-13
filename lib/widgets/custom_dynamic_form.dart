import 'package:flutter/material.dart';

class CustomDynamicForm extends StatefulWidget {
  @override
  _CustomDynamicFormState createState() => _CustomDynamicFormState();
}

class _CustomDynamicFormState extends State<CustomDynamicForm> {
  // Exemplo da lista de mapas
  final List<Map<String, dynamic>> formItems = [
    {
      'label': 'Nome',
      'icon': Icon(Icons.person),
      'type': 'text',
      'dropdownItems': null
    },
    {
      'label': 'Idade',
      'icon': Icon(Icons.cake),
      'type': 'number',
      'dropdownItems': null
    },
    {
      'label': 'Data de Nascimento',
      'icon': Icon(Icons.calendar_today),
      'type': 'date',
      'dropdownItems': null
    },
    {
      'label': 'Gênero',
      'icon': Icon(Icons.people),
      'type': 'dropdown',
      'dropdownItems': ['Masculino', 'Feminino', 'Outro']
    },
    {
      'label': 'Aceitar Termos',
      'icon': Icon(Icons.check_box),
      'type': 'checkbox',
      'dropdownItems': null
    },
    {
      'label': 'Notificações',
      'icon': Icon(Icons.notifications),
      'type': 'switch',
      'dropdownItems': null
    },
    {
      'label': 'Escolha uma cor',
      'icon': Icon(Icons.color_lens),
      'type': 'radio',
      'dropdownItems': ['Vermelho', 'Verde', 'Azul']
    },
    {
      'label': 'Volume',
      'icon': Icon(Icons.volume_up),
      'type': 'slider',
      'dropdownItems': null
    },
    {
      'label': 'Hora do Alarme',
      'icon': Icon(Icons.access_time),
      'type': 'time',
      'dropdownItems': null
    },
  ];

  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  bool? isChecked = false;
  bool? isSwitched = false;
  double? sliderValue = 0;
  String? selectedRadioValue;

  // Função que gera os campos dinamicamente
  List<Widget> _generateFormFields() {
    List<Widget> fields = [];

    for (var item in formItems) {
      Widget field;
      switch (item['type']) {
        case 'text':
          field = TextField(
            decoration: InputDecoration(
              labelText: item['label'],
              prefixIcon: item['icon'],
            ),
          );
          break;
        case 'number':
          field = TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: item['label'],
              prefixIcon: item['icon'],
            ),
          );
          break;
        case 'date':
          field = TextFormField(
            decoration: InputDecoration(
              labelText: item['label'],
              prefixIcon: item['icon'],
              suffixIcon: Icon(Icons.calendar_today),
            ),
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              );
              if (pickedDate != null) {
                setState(() {
                  selectedDate = pickedDate;
                });
              }
            },
            controller: TextEditingController(
              text: selectedDate != null
                  ? selectedDate!.toLocal().toString().split(' ')[0]
                  : '',
            ),
          );
          break;
        case 'dropdown':
          field = DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: item['label'],
              prefixIcon: item['icon'],
            ),
            items: (item['dropdownItems'] as List<String>).map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              // Tratar a seleção do item do dropdown
            },
          );
          break;
        case 'checkbox':
          field = CheckboxListTile(
            title: Text(item['label']),
            secondary: item['icon'],
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value;
              });
            },
          );
          break;
        case 'radio':
          field = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item['label']),
              ...(item['dropdownItems'] as List<String>).map((String value) {
                return RadioListTile<String>(
                  title: Text(value),
                  value: value,
                  groupValue: selectedRadioValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedRadioValue = newValue;
                    });
                  },
                );
              }).toList(),
            ],
          );
          break;
        case 'switch':
          field = SwitchListTile(
            title: Text(item['label']),
            secondary: item['icon'],
            value: isSwitched!,
            onChanged: (bool value) {
              setState(() {
                isSwitched = value;
              });
            },
          );
          break;
        case 'slider':
          field = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  item['icon'],
                  SizedBox(width: 12),
                  Text(item['label']),
                ],
              ),
              Slider(
                value: sliderValue!,
                min: 0,
                max: 100,
                onChanged: (double value) {
                  setState(() {
                    sliderValue = value;
                  });
                },
              ),
            ],
          );
          break;
        case 'time':
          field = TextFormField(
            decoration: InputDecoration(
              labelText: item['label'],
              prefixIcon: item['icon'],
              suffixIcon: Icon(Icons.access_time),
            ),
            readOnly: true,
            onTap: () async {
              TimeOfDay? pickedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (pickedTime != null) {
                setState(() {
                  selectedTime = pickedTime;
                });
              }
            },
            controller: TextEditingController(
              text: selectedTime != null ? selectedTime!.format(context) : '',
            ),
          );
          break;
        default:
          field = Container();
      }

      fields.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: field,
      ));
    }

    return fields;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário Dinâmico'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: _generateFormFields(),
            ),
          ),
        ),
      ),
    );
  }
}
