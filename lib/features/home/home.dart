import 'package:flutter/material.dart';
import './home_view.dart';

/// Widget principal que implementa o padrão MVVM
/// Separa a lógica de apresentação (View) da lógica de negócio (ViewModel)
class Home extends StatefulWidget {
  static const route = '/home';

  const Home({super.key});

  @override
  HomeView createState() => HomeView();
}
