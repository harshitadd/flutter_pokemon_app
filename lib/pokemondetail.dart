import 'package:Pokemon/pokemon.dart';
import 'package:flutter/material.dart';

class PokeDetail extends StatelessWidget {

  final Pokemon pokemon;

  PokeDetail({this.pokemon});
  bodyWidget(BuildContext context) => Stack(
    children: <Widget>[
      Container(
        child: Positioned(
          height: MediaQuery.of(context).size.height/1.5,
          width : MediaQuery.of(context).size.width - 20,
          left: 10.0,
          top: MediaQuery.of(context).size.height * 0.1,
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                SizedBox(height: 70.0,
                ),
                Text(pokemon.name),
                Text("Height: ${pokemon.height}",style: TextStyle(fontSize: 18.0),),
                Text("Weight: ${pokemon.weight}"),
                Text("Types"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.type.map((t)=>FilterChip(backgroundColor: Colors.green, label: Text(t), onSelected: (b){})).toList(),
                ),
                Text("Weakness"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.weaknesses.map((t)=>FilterChip(backgroundColor: Colors.yellowAccent, label: Text(t), onSelected: (b){})).toList(),
                ),
                Text("Next Evolution"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.nextEvolution.map((n)=>FilterChip(backgroundColor: Colors.pinkAccent,label: Text(n.name), onSelected: (b){})).toList(),
                ),
              ],
            ),
          ),
        ),

      ),
      Align(
        alignment: Alignment.topCenter,
        child: Hero(
            tag: pokemon.img,
          child: Container(
            height: 200.0,
            width: 200.0,
            decoration: BoxDecoration(
              image: DecorationImage(fit: BoxFit.cover,image :NetworkImage(pokemon.img))),

            )
          ),

        )

    ],
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text(pokemon.name),
        backgroundColor: Colors.teal,
      ),
      body : bodyWidget(context),
    );
  }
}
