import 'dart:async';

import 'package:flutter/material.dart';
import 'package:viacep_back4app/models/viacep_model.dart';
import 'package:viacep_back4app/repositories/back4app_repository.dart';
import 'package:viacep_back4app/utils/snackbar_util.dart';

class CreateCepPage extends StatefulWidget {
  const CreateCepPage({super.key});

  @override
  State<CreateCepPage> createState() => _CreateCepPageState();
}

class _CreateCepPageState extends State<CreateCepPage> {
  bool isLoading = true;

  final cepController = TextEditingController();
  final ruaController = TextEditingController();
  final bairroController = TextEditingController();
  final cidadeController = TextEditingController();
  final estadoController = TextEditingController();

  final _formField = GlobalKey<FormState>();
  final Back4appRepository _repository = Back4appRepository();

  ///TODO: validacao de numero para o CEP, de 2 digitos para o estado e vazio para as outras
  String? cepValidator(String? cepInput) {
    if (cepInput!.isEmpty || cepInput.length < 8) {
      return "Digite um CEP de 8 digitos";
    }
    return null;
  }

  void _confirmField() {
    if (_formField.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      String cep = cepController.value.text;
      String rua = ruaController.value.text;
      String bairro = bairroController.value.text;
      String cidade = cidadeController.value.text;
      String estado = estadoController.value.text;

      ViacepModel newCep = ViacepModel(
        cep: cep,
        rua: rua,
        bairro: bairro,
        cidade: cidade,
        estado: estado,
      );

      _repository.setCep(newCep);

      setState(() {
        isLoading = false;
      });

      SnackBarUtil.infoSnackBar(context, 'CEP cadastrado com SUCESSO');
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar um CEP'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                Form(
                  key: _formField,
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsetsDirectional.all(24.0),
                    children: [
                      TextFormField(
                        controller: cepController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Digite um valor valido";
                          }
                          return null;
                        },
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          hintText: 'Digite uma cep',
                        ),
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        controller: ruaController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Digite um valor valido";
                          }
                          return null;
                        },
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          hintText: 'Digite uma rua',
                        ),
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        controller: bairroController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Digite um valor valido";
                          }
                          return null;
                        },
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          hintText: 'Digite um bairro',
                        ),
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        controller: cidadeController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Digite um valor valido";
                          }
                          return null;
                        },
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          hintText: 'Digite uma cidade',
                        ),
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        controller: estadoController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Digite um valor valido";
                          }
                          return null;
                        },
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          hintText: 'Digite um estado',
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0)),
                      minimumSize: const Size.fromHeight(60.0),
                      textStyle: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    child: const Text(
                      'CADASTRAR',
                    ),
                    onPressed: _confirmField,
                  ),
                ),
              ],
            ),
    );
  }
}
