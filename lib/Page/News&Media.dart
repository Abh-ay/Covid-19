import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsMedia extends StatefulWidget {
  @override
  _NewsMediaState createState() => _NewsMediaState();
}

class _NewsMediaState extends State<NewsMedia> {
 Future<List<dynamic>>fetchnews()async{
    final response=await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=in&apiKey=2c17f4d3d25e476bbaa5532bc01ce0d3'));
    var data=jsonDecode(response.body);
    data=data['articles'];
    return data;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('News & Media')),
      body: FutureBuilder(future: fetchnews(),builder: (context,AsyncSnapshot snapshot){
        try {
          return snapshot.hasData?
        ListView.builder(itemCount: snapshot.data.length,itemBuilder: (context,int index)
        {
          return Column(
            children:[
               ListTile(
            leading: AspectRatio(aspectRatio: 1.5,child:snapshot.data[index]['urlToImage']!=null?Image.network('${snapshot.data[index]['urlToImage']}'):
            Container(child:Text('No Image Available',style:TextStyle(color: Colors.indigo[900])))),
            title: snapshot.data[index]['title']!=null?Text('${snapshot.data[index]['title']}',style: TextStyle(fontWeight:FontWeight.bold),):Container(),
          ),
           snapshot.data[index]['description']!=null?Text('${snapshot.data[index]['description']}'):Container(),
           snapshot.data[index]['content']!=null?Text('${snapshot.data[index]['content']}'):Container(),
           Divider(color:Colors.lime,thickness:5)
            ]
          );
        }
        ):Center(child:CircularProgressIndicator(color:Colors.lime));
          
        } catch (e) {
          print(e.toString());
        }
      },)
      
    );
  }
}