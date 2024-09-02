import "package:flutter/material.dart";
import "package:pokodex/model/pokemon.dart";
import "package:pokodex/service/pokemon_api.dart";

class PokemonList extends StatelessWidget {
  const PokemonList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      future: PokemonApi.getPokeData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          List<PokemonModel> pokemonList = snapshot.data!;
          return ListView.builder(
            itemCount: pokemonList.length,
            itemBuilder: (context, index) {
              PokemonModel pokemon = pokemonList[index];
              return ListTile(
                title: Text(pokemon.name?.english ?? 'Unknown Name'),
                subtitle: Text(
                  'Height: ${pokemon.profile?.height ?? 'Unknown'}'
                  'Weight: ${pokemon.profile?.weight ?? 'Unknown'}',
                ), // Height and weight
              );
            },
          );
        } else {
          return const Center(child: Text('No Pokémon found.'));
        }
      },
    );
  }
}