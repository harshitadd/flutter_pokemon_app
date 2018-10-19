import 'package:Pokemon/pokemon.dart';
import 'package:Pokemon/pokemondetail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MaterialApp(
  title: "Pokemon App",
  home: HomePage(),
));

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  var url ="https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  PokeHub pokeHub;

  @override
  void initState(){
    super.initState();
    fetchData();

    }

    fetchData() async {
    var res = await http.get(url);
    var decodedJson =jsonDecode(res.body);

    pokeHub = PokeHub.fromJson(decodedJson);
    print(pokeHub.toJson());
    setState(() {

    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Poke App"),
        backgroundColor: Colors.lightGreen,
      ),
      body: pokeHub == null
          ? Center(
        child: CircularProgressIndicator(), )
      : GridView.count(
        crossAxisCount: 2,
        children: pokeHub.pokemon.map((poke)=> Padding(
          padding: const EdgeInsets.all(2.0),
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PokeDetail(pokemon: poke,)));
            },
            child: Hero(
              child: Card(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(poke.img))),
                    )
                  ],
                ),
              ),
              tag: poke.img,
            ),
          ),
        ))
        .toList(),
      ),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
          onPressed: (){},
      backgroundColor: Colors.green,
      child: Icon(Icons.refresh)),
    );
  }
}

