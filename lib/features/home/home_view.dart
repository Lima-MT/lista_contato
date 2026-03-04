import 'package:flutter/material.dart';
import 'package:lista_contato/features/home/widgets/search_button.dart';
import 'package:lista_contato/models/person.dart';
import './home_view_model.dart';

class HomeView extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      floatingActionButton: FloatingActionButton(
        onPressed: navigationToNewContact,
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
            _buildListVertical(),
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
    final favorites = filteredPersons.where((p) => p.isFavorite).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'CONTATOS FAVORITOS',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Colors.grey[700],
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 110,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final person = favorites[index];
              return _buildFavoriteItem(person);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFavoriteItem(Person person) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 80,
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blueAccent, width: 2),
              ),
              child: ClipOval(
                child: person.imagePath != null && person.imagePath!.isNotEmpty
                    ? Image.network(
                        person.imagePath!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return _buildAvatarPlaceholder(person.name);
                        },
                      )
                    : _buildAvatarPlaceholder(person.name),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              person.name,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarPlaceholder(String name) {
    return Container(
      color: Colors.grey[300],
      child: Center(
        child: Text(
          name.isNotEmpty ? name[0].toUpperCase() : '?',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.grey[700],
          ),
        ),
      ),
    );
  }

  Widget _buildListVertical() {
    return Expanded(
      child: ListView.builder(
        itemCount: filteredPersons.length,
        itemBuilder: (context, index) {
          final person = filteredPersons[index];
          return _buildContactItem(person);
        },
      ),
    );
  }

  Widget _buildContactItem(Person person) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: () {},
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blueAccent, width: 2),
                  ),
                  child: ClipOval(
                    child:
                        person.imagePath != null && person.imagePath!.isNotEmpty
                        ? Image.network(
                            person.imagePath!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return _buildAvatarPlaceholder(person.name);
                            },
                          )
                        : _buildAvatarPlaceholder(person.name),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      person.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      person.phone,
                      style: TextStyle(
                        color: Colors.blueGrey[400],
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => onToggleFavorite(person),
                  icon: Icon(
                    person.isFavorite
                        ? Icons.star_rate_rounded
                        : Icons.star_border_rounded,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
