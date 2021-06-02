import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = 'https://www.cowin.gov.in/home';

class Symptoms extends StatefulWidget {

  @override
  _SymptomsState createState() => _SymptomsState();
}

class _SymptomsState extends State<Symptoms> {
  void _launchURL() async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Symptoms')),
      body: SingleChildScrollView(
      
              child: Container(
          padding:EdgeInsets.all(12),
          child: Column(
            children:[
              Text('Symptoms of COVID-19 can range from mild illness to pnumarrisk. Some people will recover easily and others may get very sick very quickly.'),
             SizedBox(height:8),
             Divider(color:Colors.lime,thickness:5),
             SizedBox(height:8),
              Image.asset('Asset/symptomsImage.jpg'),
              Container(height:5,color: Colors.yellow,),
              SizedBox(height:8),
              Divider(color:Colors.lime,thickness:5),
              Image.asset('Asset/symptomsPic.jpg'),
              Align(alignment:Alignment.bottomCenter,
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text('for more info visit ',style:TextStyle(fontWeight:FontWeight.bold)),
                  GestureDetector(child:Text('www.cowin.gov.in',style: TextStyle(color:Colors.blue,fontWeight: FontWeight.bold),),
              onTap: (){
                 _launchURL();
              },),
              
                ]
              )
              )

            ]
          ),
        ),
      ),
      
    );
  }
}