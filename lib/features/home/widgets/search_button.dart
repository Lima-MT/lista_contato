import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  final TextEditingController controller;
  const SearchButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Pesquisar contatos',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
