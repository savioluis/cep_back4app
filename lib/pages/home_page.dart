import 'package:flutter/material.dart';
import 'package:viacep_back4app/models/cep_back4app_model.dart';
import 'package:viacep_back4app/models/viacep_model.dart';
import 'package:viacep_back4app/pages/cep_list_page.dart';
import 'package:viacep_back4app/repositories/viacep_repository.dart';
import 'package:viacep_back4app/utils/snackbar_util.dart';
import 'package:viacep_back4app/widgets/cep_card.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  ViacepModel? cep;
  final controller = TextEditingController();
  ViaCepRepository viaCepRepository = ViaCepRepository();

  String cepValue = '';
  String cidadeValue = '';
  String estadoValue = '';
  String ruaValue = '';
  String bairroValue = '';

  Future<void> _procurarCEP(String input) async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
    if (controller.text.isEmpty || controller.text.length < 8) {
      SnackBarUtil.infoSnackBar(context, "Insira um CEP válido");
    } else {
      var result = await viaCepRepository.consultarCEP(input);

      setState(() {
        if (result.cep == null) {
          SnackBarUtil.infoSnackBar(context, "CEP NAO EXISTE. QUER CRIAR ?");
        } else {
          cepValue = result.cep ?? 'Invalido';
          cidadeValue = result.cidade ?? 'Invalida';
          estadoValue = result.estado ?? '';
          ruaValue = result.rua ?? 'Invalida';
          bairroValue = result.bairro ?? 'Invalido';
        }
      });
    }
    Navigator.pop(context);
  }

  bool dadosExistem() {
    return cepValue != '';
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CepListPage(),
                  ),
                );
              },
              icon: Icon(Icons.list_alt_rounded))
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: MediaQuery.of(context).size.height / 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: controller,
                      maxLength: 8,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Digite aqui um cep...",
                        counterText: '',
                        filled: true,
                        fillColor: const Color(0xfff1f1f1),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: const Icon(Icons.search),
                        prefixIconColor: Colors.black,
                      ),
                      onTapOutside: (event) {
                        FocusScope.of(context).unfocus();
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        _procurarCEP(controller.text
                            .trim()
                            .replaceAll('-', '')
                            .replaceAll('.', ''));
                      },
                      child: const Text("Procurar"),
                    ),
                    const SizedBox(height: 20),
                    dadosExistem()
                        ? Container(
                            child: Column(
                              children: [
                                Text('CEP: $cepValue'),
                                Text('Local: $cidadeValue/$estadoValue'),
                                Text('Rua: $ruaValue'),
                                Text('Bairro: $bairroValue'),
                              ],
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
    );
  }
}
