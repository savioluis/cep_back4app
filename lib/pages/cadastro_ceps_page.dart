import 'package:flutter/material.dart';
import 'package:viacep_back4app/models/cep_back4app_model.dart';
import 'package:viacep_back4app/pages/cadastrar_cep_page.dart';
import 'package:viacep_back4app/repositories/back4app_repository.dart';
import 'package:viacep_back4app/widgets/cep_card.widget.dart';

class ListaCepsPage extends StatefulWidget {
  const ListaCepsPage({super.key});

  @override
  State<ListaCepsPage> createState() => _ListaCepsPageState();
}

class _ListaCepsPageState extends State<ListaCepsPage> {
  bool isLoading = true;

  final ruaController = TextEditingController();
  final bairroController = TextEditingController();
  final cidadeController = TextEditingController();
  final estadoController = TextEditingController();

  final Back4appRepository _repository = Back4appRepository();
  List<CepBack4appModel> list = [];

  Future<void> _loadData() async {
    final ceps = await _repository.getCeps();

    for (var cep in ceps) {
      list.add(cep);
    }
    setState(() {
      isLoading = false;
    });
  }

  Future<void> _deleteCard(String id) async {
    setState(() {
      isLoading = true;
    });
    await _repository.deleteCep(id);
    list = await _repository.getCeps();
    setState(() {
      isLoading = false;
    });
    print('ENTROU AQUI');
  }

  Widget bodyWidget() {
    return list.isNotEmpty
        ? ListView(
            scrollDirection: Axis.vertical,
            children: [
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return CepCard(
                    cep: list[index],
                    index: index + 1,
                    onPressed: () => _deleteCard((list[index].id)!),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 18);
                },
              ),
            ],
          )
        : const Center(
            child: Text(
              'Nenhum CEP cadastrado 😳',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
          );
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'CEPS Cadastrados',
            style: TextStyle(fontSize: 24),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CadastrarCepPage(),
              ),
            );
          },
          child: const Icon(Icons.add_box_rounded),
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : bodyWidget());
  }
}
