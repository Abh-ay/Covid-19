import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
 Future<List<dynamic>> fetch()async{
    final response=await http.get(Uri.parse('https://covid2019-api.herokuapp.com/v2/current'));
    var data=jsonDecode(response.body);
   data=data['data'];
    //mapresponse=data['data']['location'];
    print(data);
    return data;
  }
  void initState(){
     super.initState();
    fetch();
    }
  @override
  Widget build(BuildContext context) {   
    return Scaffold(
      appBar: AppBar(title:Text('DashBoard')),
      body: FutureBuilder(future: fetch(),builder: (context,AsyncSnapshot snapshot)
      {
        return snapshot.hasData?GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:1,
        mainAxisExtent: 180 ),
        itemCount: snapshot.data.length,itemBuilder: (context, int index){
          return 
            Card( 
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              //color: Colors.blueAccent[700],
              shadowColor: Colors.indigo[900],
              elevation: 8.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children:[
                  SizedBox(height:5),
                  Row(
                children:[
                Card(shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                color: Colors.lime,shadowColor: Colors.black,elevation: 8,
                child: Container(height:70,width:MediaQuery.of(context).size.width*0.4,
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children:[
                  Text('${index+1}.'),
                  Center(child:Text(snapshot.data[index]['location'],style: TextStyle(fontWeight:FontWeight.bold),))
                ])
                )), 
                Card(shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                color: Colors.white,shadowColor: Colors.black,elevation: 8,
                child: Container(height:70,width:MediaQuery.of(context).size.width*0.5,
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children:[
                  Text('Deaths',style: TextStyle(color:Colors.indigo[900],fontWeight: FontWeight.bold),),
                  Center(child:Text('${snapshot.data[index]['deaths']}',style: TextStyle(fontWeight:FontWeight.bold,color: Colors.red),))
                ])
                )),
                ]
              ),
              SizedBox(height:8),
                Row(
                children:[
                   Card(shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                color: Colors.white,shadowColor: Colors.black,elevation: 8,
                child: Container(height:70,width:MediaQuery.of(context).size.width*0.6,
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children:[
                  Text('Active Cases',style: TextStyle(color:Colors.indigo[900],fontWeight: FontWeight.bold),),
                  Center(child:Text('${snapshot.data[index]['active']}',style: TextStyle(fontWeight:FontWeight.bold,color: Colors.red),))
                ])
                )),
                Card(shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                color: Colors.lime,shadowColor: Colors.black,elevation: 8,
                child: Container(height:70,width:MediaQuery.of(context).size.width*0.3,
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children:[
                  Text('Confirmed',style: TextStyle(color:Colors.indigo[900],fontWeight: FontWeight.bold),),
                  Center(child:Text('${snapshot.data[index]['confirmed']}',style: TextStyle(fontWeight:FontWeight.bold,color: Colors.indigo[900]),))
                ])
                
                )),
                
               
                ]
              ),

                ]
              )
          
          );
        }):Center(child:CircularProgressIndicator(color: Colors.lime,));
         }),
     
    );
  }
}