import 'package:flutter/material.dart';
import 'package:rick_and_morty/char_Page.dart';

import 'chars.dart';


class SelectPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(

      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/rick_morty.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 8,right: 8),
              child: Column(
                children: [
                  //Text(chars.),
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight*0.25),
                    child: SizedBox(
                      height: screenHeight * 0.15, // 50% of screen height
                      //width: screenWidth * 0.8, // 80% of screen width
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          const CircleAvatar(
                            radius: 36,
                            backgroundImage: AssetImage("assets/chr.png"),
                          ),

                          TextButton(
                            onPressed: () {
                              _charPage(context);
                            },
                            child: const Text("CHARACTERS",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 36,),


                  SizedBox(
                    height: screenHeight * 0.075, // 50% of screen height
                    //width: screenWidth * 0.8, // 80% of screen width
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                        const CircleAvatar(
                          radius: 36,
                          backgroundImage: AssetImage("assets/eps.png"),

                        ),

                        TextButton(
                          onPressed: () {  },
                          child: const Text("EPISODES",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),


    );


  }


  void _charPage(BuildContext context){

    MaterialPageRoute pageRoute = MaterialPageRoute(builder: (BuildContext context){
        return CharPage();
      },
    );
    Navigator.push(context, pageRoute);

  }
  

}
