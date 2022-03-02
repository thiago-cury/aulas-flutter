import 'package:exemplo_sqflite/model/model.dart';
import 'package:exemplo_sqflite/repository/repository.dart';
import 'package:exemplo_sqflite/views/views.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  final String title;

  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late ScheduleRepository _repository;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _repository = ScheduleRepository();
  }

  _message() {
    return Center(child: Text('Não há dados no banco :-/'),);
  }

  _progress() {
    return const Center(child: CircularProgressIndicator(),);
  }

  _title(Schedule schedule) {
    return Row(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text("Código ${schedule.id} - ${schedule.name}\nTelefone ${schedule.phone}"),
            )
          ],
        )
      ],
    );
  }

  _subtitle(Schedule schedule) {
    return Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Row(
          children: [
            const Icon(Icons.calendar_today),
            Text(schedule.date.toString()),
            const Icon(Icons.schedule),
            Text(schedule.hour.toString()),
          ],
        )
    );
  }

  _card(BuildContext context, Schedule schedule) {
    return Card(
      child: ListTile(
        title: _title(schedule),
        subtitle: _subtitle(schedule),
        leading: const CircleAvatar(
          child: Icon(Icons.person),
        ),
        trailing: GestureDetector(
          onTap: () {
            //Podemos excluir por aqui também... ao clicar no ícone da lixeira....
            //ou arrastando para a esquerda, através do componente Dismissible
            print("Clicou para excluir");
          },
          child: const Icon(Icons.delete),
        ),
        onTap: () {
          //qdo clicar no card (tile)
          print("Você escolheu ${schedule.toString()}");
          _showAlert('Você deseja ver detalhes e/ou alterar?',
              option1: 'Ver detalhes',
              option2: 'Alterar',
              option1Function: () {
                print('clicou em ver detalhes');
                Navigator.of(context).pop();
              },
              option2Function: () async {
                print('clicou em Alterar');
                Navigator.of(context).pop();
                final reloadPage = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => ViewScheduleTime(schedule: schedule,))
                );
                _reload(reloadPage);
              }
          );

        },
      ),
    );
  }

  _listSchedules(BuildContext context, List<Schedule>? schedules) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemCount: schedules!.length,
      itemBuilder: (context, index) {
        return Dismissible(
          direction: DismissDirection.endToStart,
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: const Icon(Icons.delete_forever),
          ),
          key: ValueKey<int>(schedules.elementAt(index).id!),
          onDismissed: (DismissDirection direction) async {
            print('id que vai ser excluido: ${schedules.elementAt(index).id!}');
            await _repository.delete(schedules.elementAt(index).id!);
            setState(() {
            });
          },
          child: _card(context, schedules.elementAt(index)),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: FutureBuilder(
        future: _repository.fetchAll(), //0, 1, 2, 10 1000.....
        builder: (BuildContext context, AsyncSnapshot<List<Schedule>> snapshot) {
          if(snapshot.hasData) {
            if(snapshot.data!.isEmpty) {
              return _message();
            }
            List<Schedule>? schedules = snapshot.data; //lista dos agendamentos...
            print('${schedules.toString()}');

            return _listSchedules(context, schedules);
          } else {
            return _progress();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final reloadPage = await Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) => ViewScheduleTime())
            );
            _reload(reloadPage);
          },
          child: const Icon(Icons.add),
      ),
    );
  }

  _reload(bool reloadPage) {
    if(reloadPage) {
      setState(() {
        print('vai atualizar a tela no retorno do cadastro');
      });
    }
  }

  _showAlert(String message, {String? title, String? option1, String? option2,
    String? cancel, Function? option1Function, Function? option2Function}) { //opcional nomeado...
    AlertDialog alert = AlertDialog(
      title: Text(title ?? 'Atenção'),
      content: Text(message),
      actions: [
        TextButton(onPressed: () {
          option1Function!();
        }, child: Text(option1 ?? 'sim')),
        TextButton(onPressed: () {
          option2Function!();
        }, child: Text(option2 ?? 'nao')),
        cancel != null ?
        TextButton(onPressed: () {
          print('clicou no cancel');
          Navigator.of(context).pop();
        }, child: Text('Cancelar')) :
        Container(),
      ],
    );

    showDialog(context: context, builder: (BuildContext context) {
      return alert;
    });
  }
}