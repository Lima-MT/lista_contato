import 'package:flutter/material.dart';
import './new_contact_view_model.dart';

/// View - Responsável apenas pela apresentação (UI)
/// Herda do ViewModel para acessar estado e lógica de negócio
class NewContactView extends NewContactViewModel {

  @override
  Widget build(BuildContext context) {
    // TODO: Construa sua interface aqui
    // Acesse o estado e métodos através do ViewModel
    // Exemplo: onPressed: () => minhaFuncaoDoViewModel()

    return Scaffold(
      appBar: AppBar(
        title: const Text('NewContact'),
      ),
      body: const Center(
        child: Text(
          'Substitua este conteúdo pela sua UI',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

