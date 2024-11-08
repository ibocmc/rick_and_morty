import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/chars.dart';

class CharDetailPage extends StatelessWidget {

  final Chars _char;
  CharDetailPage(this._char);




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(context),
      backgroundColor: Colors.black87,

    );
  }

  AppBar buildAppBar(){
    return AppBar(
      title: Text(_char.charName,
        style: const TextStyle(color: Colors.green),
      ),
      centerTitle: true,
      backgroundColor: Colors.black87,
      iconTheme: const IconThemeData(
        color: Colors.red,
      ),
    );
  }

  Widget buildBody(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;

    return

      Column(
        //mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 8,),

          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              //shape: BoxShape.circle,
              image: DecorationImage(image: NetworkImage(_char.charImage),
                fit: BoxFit.fitWidth,
              ),
                boxShadow: [
                  BoxShadow(
                    color:  Colors.lightBlue,
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  )
                ]
            ),
            width: screenSize.width - 20,
            height: 300,
          ),


          Expanded(
            child: SingleChildScrollView(

              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                  const SizedBox(height: 4),

                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        height: screenSize.height/1.5,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          boxShadow: [
                            BoxShadow(
                              color:  Colors.lightGreen,
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            )
                          ]
                        ),

                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text("Name",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                Text(_char.charName,),
                              ],
                            ),
                            const SizedBox(height: 24,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text("Species",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                Text(_char.charSpecies),
                              ],
                            ),

                            const SizedBox(height: 24,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text("Gender",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                Text(_char.charGender),
                              ],
                            ),

                            const SizedBox(height: 24,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text("Origin",style:
                                TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                                ),

                                Text(_char.charOrigin,),

                              ],
                            ),

                            const SizedBox(height: 24,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text("Location",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                Text(_char.charLocation),
                              ],
                            ),

                            const SizedBox(height: 24,),


                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text("Created Time",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                Text(_char.charCreated),
                              ],
                            ),
                          ],
                        )



                      ),
                    ),
                  ],
                ),

              ],
            ),
                ),
          ),
        ],
      );

  }
}
/*"name": "Rick Sanchez",
      "status": "Alive",
      "species": "Human",
      "type": "",
      "gender": "Male",
      "origin": {
        "name": "Earth (C-137)",
        "url": "https://rickandmortyapi.com/api/location/1"
      },
      "location": {
        "name": "Citadel of Ricks",
        "url": "https://rickandmortyapi.com/api/location/3"*/