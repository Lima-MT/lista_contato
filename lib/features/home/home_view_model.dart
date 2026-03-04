import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lista_contato/features/new_contact/new_contact.dart';
import 'package:lista_contato/models/person.dart';
import 'package:lista_contato/repository/person_repository.dart';
import 'package:lista_contato/services/person_service.dart';
import './home.dart';

abstract class HomeViewModel extends State<Home> {
  late final PersonRepository repository;
  final TextEditingController searchController = TextEditingController();

  List<Person> _persons = [];
  bool _isLoading = false;
  String _searchQuery = '';

  // Getters
  List<Person> get persons => _persons;
  bool get isLoading => _isLoading;

  // Navigation
  void navigationToNewContact() async {
    final created = await context.push<bool>(NewContact.route);
    if (created == true) {
      // se voltou da NewContact com sucesso, recarrega a lista
      await loadPersons();
    }
  }

  // Filter
  List<Person> get filteredPersons {
    if (_searchQuery.isEmpty) {
      return _persons;
    }
    return _persons.where((person) {
      return person.name.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    repository = PersonRepository(PersonService());
    loadPersons();

    // Listener
    searchController.addListener(() {
      setState(() {
        _searchQuery = searchController.text;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  Future<void> loadPersons() async {
    setState(() => _isLoading = true);

    try {
      final persons = await repository.getAll();

      setState(() {
        _persons = persons;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      debugPrint(e.toString());
    }
  }

  Future<void> onToggleFavorite(Person person) async {
    final updated = await repository.toggleFavorite(person);

    setState(() {
      _persons = _persons.map((p) {
        if (p.id == updated.id) {
          return updated;
        }
        return p;
      }).toList();
    });
  }
}
