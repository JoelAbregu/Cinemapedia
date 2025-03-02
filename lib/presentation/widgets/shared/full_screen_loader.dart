import 'package:flutter/material.dart';
class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});
  
   
  Stream<String> getLoadingMessages(){
    final messages = <String>[
      "Cargando peliculas",
      "Comprando palomitas de maíz",
      "Cargando populares",
      "Llamando ami novia",
      "Ya mero...",
    ];
    return Stream.periodic(Duration(milliseconds: 1200),(step){
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Espere por favor"),
          SizedBox(height: 10),
          CircularProgressIndicator(strokeWidth: 2),
          SizedBox(height: 5),
          StreamBuilder(
            stream: getLoadingMessages(), 
            builder: (context,snapshot){
              if(!snapshot.hasData) return Text("Cargando...") ;
              return Text(snapshot.data!);
            }
          )
        ],
      ),
    );
  }
}