import 'package:flutter/material.dart';
import 'package:pokedex_2024/domain/model/pokemon.dart';
import 'package:pokedex_2024/ui/features/pokemon_details/pokemon_details_provider.dart';
import 'package:pokedex_2024/utils/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class PokemonDetails extends StatefulWidget {
  const PokemonDetails._({super.key, required this.pokemon});

  final Pokemon pokemon;

  static ChangeNotifierProvider<PokemonDetailProvider> create(
          {Key? key, pokemon}) =>
      ChangeNotifierProvider(
        lazy: false,
        create: (context) => PokemonDetailProvider(),
        child: PokemonDetails._(
          key: key,
          pokemon: pokemon,
        ),
      );

  @override
  State<PokemonDetails> createState() => _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetails>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isLight = context.watch<ThemeProvider>().isLight;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        toolbarHeight: 60,
        title: Column(
          children: [
            const SizedBox(height: 5),
            Text(
              widget.pokemon.name!,
              style: textTheme.headline4?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(widget.pokemon.id!),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 400,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isLight ? Colors.greenAccent[100] : Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SizedBox(
                    height: 200,
                    child: Image.network(
                      widget.pokemon.imageurl!,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  height: 50,
                  child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    indicatorColor: Colors.transparent,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 25.0),
                    labelStyle: textTheme.headline6,
                    tabs: const [
                      Tab(
                        text: 'Detail',
                      ),
                      Tab(
                        text: 'Types',
                      ),
                      Tab(
                        text: 'Weakness',
                      ),
                      Tab(
                        text: 'Abilities',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  height: 250,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Text(
                        widget.pokemon.xdescription!,
                        style: textTheme.bodyText2,
                      ),
                      _validateList(
                          widget.pokemon.typeofpokemon, textTheme.bodyText2!),
                      _validateList(
                          widget.pokemon.weaknesses, textTheme.bodyText2!),
                      _validateList(
                          widget.pokemon.abilities, textTheme.bodyText2!),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _validateList(List<String>? data, TextStyle bodyText2) {
    return (((data ?? []).isNotEmpty)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
                data!.map((e) => Text('\u2022 $e', style: bodyText2)).toList())
        : Text(
            'Not presented',
            style: bodyText2,
          ));
  }
}
