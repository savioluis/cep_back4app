import 'package:flutter/material.dart';

class DialogsUtil {
  static void showCreateNewCep(
    BuildContext context,
    Function() onConfirm,
    List<TextEditingController> controllers,
    List<String> hintTexts,
  ) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // actionsPadding: const EdgeInsets.all(8.0),
            actionsAlignment: MainAxisAlignment.center,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            title: const Text(
              "Cadastrar CEP",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            content: ListView(
              children: [
                ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return TextField(
                        controller: controllers[index],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          hintText: hintTexts[index],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 24),
                    itemCount: controllers.length),
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Fechar",
                  style: TextStyle(fontSize: 14),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                ),
                onPressed: onConfirm,
                child: const Text(
                  "Cadastrar",
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          );
        });
  }

  static void showTeste(
    BuildContext context,
    Function() onConfirm,
    List<TextEditingController> controllers,
    List<String> hintTexts,
  ) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => Dialog.fullscreen(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Text(
                      'CADASTRAR UM CEP',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return TextField(
                            controller: controllers[index],
                            onTapOutside: (event) {
                              FocusScope.of(context).unfocus();
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              hintText: hintTexts[index],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 24),
                        itemCount: controllers.length),
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
                      onPressed: () {
                        
                      },
                      child: Text(
                        'CADASTRAR',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
