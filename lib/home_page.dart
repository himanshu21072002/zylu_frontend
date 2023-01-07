import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'colors.dart';
import 'details_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List users=[];
  bool isLoading=false;

  @override
  void initState() {
    super.initState();
    fetchUser();
  }
void fetchUser()async{
    setState(() {
      isLoading=true;
    });
   String url="https://zylu-hg.onrender.com/list";
   var uri=Uri.parse(url);
   var response= await http.get(uri);
   if(response.statusCode==200){
     var items=jsonDecode(response.body);

     setState(() {
       users=items;
       isLoading=false;
     });
   }
   else{
     setState(() {
       users=[];
       isLoading=false;
     });
   }
}


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff4f359b),
          centerTitle: true,
          title: const Text(
            'Employees information',
          ),
        ),
        body: isLoading==true?const Center(child:CircularProgressIndicator()):ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen(item: users[index],)));
              },
              child: getCard(users[index]));
            }),
      ),
    );
  }
}

Widget getCard(item) {
  return Card(
    elevation: 1.5,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListTile(
        title: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(30),
                image:DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(item['picture'].toString()
                      ),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['username'].toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    item['email'].toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                color: int.parse(item['experience'])>5?Colors.green:Colors.white,
                borderRadius: BorderRadius.circular(30),
            ),),
          ],
        ),
      ),
    ),
  );
}
