import 'package:flutter/material.dart';
import './new_contact_view.dart';

/// Widget principal que implementa o padrão MVVM
/// Separa a lógica de apresentação (View) da lógica de negócio (ViewModel)
class NewContact extends StatefulWidget {
  static const route = '/new_contact';

  const NewContact({super.key});

  @override
  NewContactView createState() => NewContactView();
}
