import 'package:flutter/material.dart';
import 'package:lista_contato/features/home/widgets/search_button.dart';
import './home_view_model.dart';

class HomeView extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: CircleBorder(),
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.add, color: Colors.white, size: 32),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 60),
            _buildAppBar(),
            SizedBox(height: 20),
            SearchButton(controller: searchController),
            SizedBox(height: 20),
            _buildHorizontalList(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Contatos',
        style: TextStyle(
          color: Colors.black87,
          fontSize: 32,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildHorizontalList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Contatos Favoritos',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.grey[700],
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
