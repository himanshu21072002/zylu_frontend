// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:zylu_assignment/colors.dart';

class DetailScreen extends StatelessWidget {
  final item;
  const DetailScreen({Key? key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        backgroundColor: primary,
        centerTitle: true,
        title: const Text('Details of the employee'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(60),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(item['picture'].toString()),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
            width: MediaQuery.of(context).size.width*0.5,
            child: const Divider(
              color: Colors.black,
              thickness: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'Name:           ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(item['username'],
                      style: TextStyle(
                        fontSize: 17,
                      ),)
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Email:           ',
                      style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(item['email'],
                      style: TextStyle(
                      fontSize: 17,
                    ),)
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Gender:         ',
                      style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(item['gender'],
                      style: TextStyle(
                        fontSize: 17,
                      ),)
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Location:      ',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(item['location'],
                      style: TextStyle(
                        fontSize: 17,
                      ),)
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Age:                ',
                      style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(item['age']+" years",
                      style: TextStyle(
                        fontSize: 17,
                      ),)
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Experience:   ',
                      style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(item['experience'] + ' years',
                      style: TextStyle(
                        fontSize: 17,
                      ),)
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
