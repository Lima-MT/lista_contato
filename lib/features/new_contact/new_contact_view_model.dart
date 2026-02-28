import 'package:flutter/material.dart';
import './new_contact.dart';

/// ViewModel - Responsável pela lógica de negócio e gerenciamento de estado
/// Separa a lógica da apresentação seguindo o padrão MVVM
abstract class NewContactViewModel extends State<NewContact> {

  // TODO: Adicione suas variáveis de estado aqui
  // Exemplo:
  // bool _isLoading = false;
  // String _message = '';
  // List<String> _items = [];

  // TODO: Adicione seus getters aqui
  // Exemplo:
  // bool get isLoading => _isLoading;
  // String get message => _message;
  // List<String> get items => _items;

  @override
  void initState() {
    super.initState();
    // TODO: Inicialize seu estado aqui
    // Exemplo: _carregarDados();
  }

  @override
  void dispose() {
    // TODO: Limpe recursos aqui (controllers, listeners, etc.)
    super.dispose();
  }

  // TODO: Adicione seus métodos de lógica de negócio aqui
  // Exemplo:
  // void _carregarDados() async {
  //   setState(() => _isLoading = true);
  //   try {
  //     // Sua lógica aqui
  //   } catch (e) {
  //     // Tratamento de erro
  //   } finally {
  //     setState(() => _isLoading = false);
  //   }
  // }
}
