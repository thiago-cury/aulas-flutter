import 'package:exemplo_sqflite/repository/repository.dart';
import 'package:exemplo_sqflite/model/model.dart';
import 'package:flutter/material.dart';

class ViewScheduleTime extends StatefulWidget {

  final Schedule? schedule;

  ViewScheduleTime({this.schedule});

  @override
  _ViewScheduleTimeState createState() => _ViewScheduleTimeState();

}

class _ViewScheduleTimeState extends State<ViewScheduleTime> {

  final ScheduleRepository _repository = ScheduleRepository();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _hourController = TextEditingController();

  var _service = ['Selecione o serviço', 'Corte', 'Barba', 'Outros'];
  var _serviceSelected = "Selecione o serviço";

  bool _isUpdate = false;

  _rowIcon() {
    return Icon(Icons.people, size: 150, color: Colors.blue,);
  }

  _rowName() {
    return TextFormField(
      controller: _nameController,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(hintText: "Nome completo do cliente"),
      maxLength: 50,
      validator: (value) {
        if(value!.isEmpty) {
          return 'Digite um nome válido!';
        }
        return null;
      },
    );
  }

  _rowPhone() {
    return TextFormField(
      controller: _phoneController,
      keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
        hintText: "Telefone para contato",
      ),
      maxLength: 14,
      validator: (value) {
        if(value!.length < 8) {
          return 'Digite um telefone válido!';
        }
        return null;
      },
    );
  }

  _rowDate() {
    return TextFormField(
      controller: _dateController,
      keyboardType: TextInputType.datetime,
      decoration: const InputDecoration(
        hintText: "Data do agendamento",
      ),
      maxLength: 11,
      validator: (value) {
        if(value!.length < 9) {
          return 'Digite uma data válida!';
        }
        return null;
      },
    );
  }

  _rowHour() {
    return TextFormField(
      controller: _hourController,
      keyboardType: TextInputType.datetime,
      decoration: const InputDecoration(
        hintText: "Horário do agendamento",
      ),
      maxLength: 8,
      validator: (value) {
        if(value!.length < 4) {
          return 'Digite um horário válido!';
        }
        return null;
      },
    );
  }

  _rowServiceDropdownButton() {
    return DropdownButton<String>(
        isExpanded: true,
        value: _serviceSelected,
        items: _service.map((String value) {
          return DropdownMenuItem<String>(
              value: value,
              child: Text(value)
          );
        }).toList(),
        hint: const Text("Selecione o serviço"),
        onChanged: (newValue) {
          setState(() {
            _serviceSelected = newValue!;
          });
        }
    );
  }

  _rowButton(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        _register(context);
        _resetFields();
      },
      style: TextButton.styleFrom(
          primary: Colors.white,
          padding: const EdgeInsets.all(20.0),
          backgroundColor: Theme.of(context).primaryColor
      ),
      label: _isUpdate ? const Text('Alterar agendamento') : const Text('Agendar horário'),
      icon: const Icon(Icons.add),
    );
  }

  _formUI(BuildContext context) {
    return Column(
      children: [
        _rowIcon(),
        _rowName(),
        _rowPhone(),
        _rowDate(),
        _rowHour(),
        _rowServiceDropdownButton(),
        _rowButton(context),
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(widget.schedule != null) {
      _nameController.text = widget.schedule!.name.toString();
      _dateController.text = widget.schedule!.date.toString();
      _hourController.text = widget.schedule!.hour.toString();
      _phoneController.text = widget.schedule!.phone.toString();
      _serviceSelected = widget.schedule!.kindOfService.toString();
      _isUpdate = true;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isUpdate ? const Text('Alterar agendamento') : const Text('Agendar horário'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: _formUI(context),
        ),
      ),
    );
  }

  _register(BuildContext context) {
    print('Validou o formulário: ${_formKey.currentState!.validate()}');

    if(_formKey.currentState!.validate()) {

      if(_serviceSelected == "Selecione o serviço") {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Escolha um serviço :-/', ),)
        );
      } else {

        if(_isUpdate) { //alterar
          widget.schedule?.name = _nameController.text;
          widget.schedule?.date = _dateController.text;
          widget.schedule?.hour = _hourController.text;
          widget.schedule?.phone = _phoneController.text;
          widget.schedule?.kindOfService = _serviceSelected;

          _repository.update(widget.schedule!); //vai alterar na base de dados

          //para atualizar na tela...
          setState(() {
            Navigator.pop(context, true);
          });

          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Agendamento alterado com sucesso!', ),)
          );
        } else {
          final schedule = Schedule(
              name: _nameController.text,
              phone: _phoneController.text,
              date: _dateController.text,
              hour: _hourController.text,
              kindOfService: _serviceSelected
          );

          _repository.save(schedule);

          //para atualizar na tela...
          setState(() {
            Navigator.pop(context, true);
          });
        }

      }
    } else {
      print('Digite os campos corretamente :-/');

      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Digite os campos corretamente :-/', ),)
      );
    }
  }

  //Método com arrow function
  _resetFields() => _formKey.currentState!.reset();
}
