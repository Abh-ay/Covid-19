import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
const url='https://transformingindia.mygov.in/covid-19/';

class IndGovt extends StatefulWidget {
  @override
  _IndGovtState createState() => _IndGovtState();
}

class _IndGovtState extends State<IndGovt> {
   void _launchURL() async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('IndGovt.')),
      body: SingleChildScrollView(
        child:Container(padding: EdgeInsets.all(12),
        child:Column(children: [
          Image.asset('Asset/prevention.jpg'),
          SizedBox(height:10),
          Text('Government of India is taking all necessary steps to ensure that we are prepared well to face the challenge and threat posed by the growing pandemic of COVID-19.',style: Theme.of(context).textTheme.subtitle,),
          Divider(color: Colors.lime,thickness: 5,),
          Text(' With active support of the people of India, we have been able to contain the spread of the Coronavirus in our country.',style: Theme.of(context).textTheme.subtitle,),
          Divider(color: Colors.lime,thickness: 5,),
          Text(' The most important factor in preventing the spread of this virus locally is to empower the citizens with the right information and taking precautions as per the advisories being issued by Ministry of Health & Family Welfare.',style: Theme.of(context).textTheme.subtitle,),
          SizedBox(height:5),
          Align(alignment:Alignment.bottomCenter,
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text('for more info visit ',),
                  GestureDetector(child:Text('Click here',style: TextStyle(color:Colors.blue,fontWeight: FontWeight.bold),),
              onTap: (){
                 _launchURL();
              },),
              
                ]
              )
              )

        ],))
      ),
      
    );
  }
}