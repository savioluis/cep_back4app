import 'package:flutter/material.dart';
import 'package:viacep_back4app/models/cep_back4app_model.dart';

class CepCard extends StatelessWidget {
  final CepBack4appModel cep;
  final int index;

  const CepCard({
    super.key,
    required this.cep,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: 84,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "$index.",
                  style: const TextStyle(fontWeight: FontWeight.normal),
                ),
                const SizedBox(width: 16),
                Container(
                  color: Colors.red,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "CEP: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Expanded(
                            child: Text(
                              '${cep.cep}',
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Local: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.fade),
                          ),
                          Expanded(
                            child: Text(
                              '${cep.cidade}/${cep.estado}',
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 28),
                Container(
                  color: Colors.yellow,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Bairro: ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(cep.bairro ?? "vazio")
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "Rua: ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(cep.rua ?? "vazio")
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 28),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
