import 'package:flutter/material.dart';
import 'package:rick_and_morty/char_detail_page.dart';
import 'package:rick_and_morty/chars.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';



class CharPage extends StatefulWidget {

  @override
  State<CharPage> createState() => _CharPageState();
}

class _CharPageState extends State<CharPage> {
  final String _apiUrl = "https://rickandmortyapi.com/api/character";
  List<Chars> allChars = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_){
      takeDataFromApi();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:_buildAppbar(),

      body: _buildBody(),

      backgroundColor: Colors.black87,
    );
  }

  AppBar _buildAppbar(){
    return AppBar(
      title: const Text("Characters",
        style: TextStyle(color: Colors.green,
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: GestureDetector(
          onTap: (){
            //********
          },
          child: const CircleAvatar(
            backgroundImage: AssetImage("assets/chr.png"),
          ),
        ),

      ),
      backgroundColor: Colors.black87,
      centerTitle: true,
    );
  }

  Widget _buildBody(){

    return
      allChars.isEmpty ?
      Center(
        child: Column(
          children: [
            Center(
                child: CircularProgressIndicator()),
          ],
        ),
      ):
      ListView.builder(
        itemCount: allChars.length,
        itemBuilder: _buildCharList,
      );
  }


  Widget _buildCharList(BuildContext context, int index) {

    Chars char = allChars[index];

    bool b1 = false;
    char.charStatus == "Alive" ? b1 = true : b1= false;
    
    return Card(
      child: Container(
        color: Colors.black87,
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft:Radius.circular(12),bottomLeft: Radius.circular(12)),
                    image: DecorationImage(image: NetworkImage(char.charImage),fit: BoxFit.cover),
                  ),
                  width: 150, height: 150,
                ),
                Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: (){
                              charTicked(context, char);
                            },
                            child: Text(char.charName,style: const TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                            ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundColor: b1 ? Colors.green : Colors.red,
                                  radius: 8,
                                )
                              ],
                            ),
                            const SizedBox(width: 8),
                            Text("${char.charStatus} - ${char.charSpecies} - ${char.charGender}",
                                style: const TextStyle(color: Colors.white)),

                          ]

                        ),

                        //const SizedBox(height: 4),

                        const Text("Last known location:",style: TextStyle(color: Colors.white54)),

                        //const SizedBox(height: 4),

                        Text(char.charLocation,
                          style: TextStyle(color: Colors.white)

                        ),

                        const Text("Origin:",style: TextStyle(color: Colors.white54)),

                        Text(char.charOrigin,
                            style: TextStyle(color: Colors.white)

                        ),



                      ],

                    ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void takeDataFromApi() async {

    Uri uri = Uri.parse(_apiUrl);

    http.Response response = await http.get(uri);

    Map<String,dynamic> parsedResponse = jsonDecode(response.body);

    List<dynamic> charList = parsedResponse["results"];

    for(int i=0;i<charList.length;i++)
    {
      Map<String,dynamic> charMap =  charList[i];

       Chars char = Chars.fromMap(charMap);

       allChars.add(char);

    }
    setState(() {});

  }

  void charTicked(BuildContext context,Chars char){

    MaterialPageRoute pageRoute = MaterialPageRoute(builder: (context){

      return CharDetailPage(char);

    },
    );

    Navigator.push(context, pageRoute);
  }
}
