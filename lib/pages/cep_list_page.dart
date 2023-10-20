import 'package:flutter/material.dart';
import 'package:viacep_back4app/models/cep_back4app_model.dart';
import 'package:viacep_back4app/models/viacep_model.dart';
import 'package:viacep_back4app/pages/create_cep_page.dart';
import 'package:viacep_back4app/repositories/back4app_repository.dart';
import 'package:viacep_back4app/utils/dialog_util.dart';
import 'package:viacep_back4app/widgets/cep_card.widget.dart';

class CepListPage extends StatefulWidget {
  const CepListPage({super.key});

  @override
  State<CepListPage> createState() => _CepListPageState();
}

class _CepListPageState extends State<CepListPage> {


  
  final ruaController = TextEditingController();
  final bairroController = TextEditingController();
  final cidadeController = TextEditingController();
  final estadoController = TextEditingController();

  Back4appRepository repository = Back4appRepository();
  final List<CepBack4appModel> list = [];

  Future<void> _loadData() async {
    print('AQUIII ${await repository.getCeps()}');
  }

  Future<void> _test(ViacepModel cep) async {
    await repository.setCep(cep);
  }

  ViacepModel cepmodel = ViacepModel(
    bairro: "Edson Queiroz",
    cep: "60834-415",
    cidade: "Fortaleza",
    estado: "CE",
    rua: "Travessa Trinta de Junho",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back4App CEP'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateCepPage(),
            ),
          );
        },
        child: const Icon(Icons.add_box_rounded),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          ListView(
            shrinkWrap: true,
            // scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              CepCard(
                  cep: CepBack4appModel(id: "fsa", bairro: "Edson Queiroz"),
                  index: 1),
            ],
          ),
          ElevatedButton(
              onPressed: () async => _loadData(), child: Text('PRINT')),
          ElevatedButton(
              onPressed: () async => _test(
                    cepmodel,
                  ),
              child: Text('TEST'))
        ],
      ),
    );
  }
}
