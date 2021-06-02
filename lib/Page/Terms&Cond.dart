import 'package:flutter/material.dart';

class TermsCond extends StatefulWidget {
  @override
  _TermsCondState createState() => _TermsCondState();
}

class _TermsCondState extends State<TermsCond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Terms & cond.')),
      body: Container(
        padding:EdgeInsets.all(12),
        child:Column(
          children:[
            Text('This Page for adding the Terms & conditions.',style: Theme.of(context).textTheme.headline6,)
          ]
        )
      ),
      
    );
  }
}