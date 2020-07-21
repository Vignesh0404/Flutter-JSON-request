import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Countries extends StatefulWidget {
  Countries({Key key}) : super(key: key);

  @override
  _CountriesState createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {

List countries;
fetchCountries()async{
  http.Response response = await http.get('https://corona.lmao.ninja/v2/countries');
  setState(() {
    countries = json.decode(response.body);
  });
}


@override
  void initState() {
    fetchCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202c3b),
      appBar: AppBar(
        title: Text(
          'International Covid19 Tracker',
          style: TextStyle(
            fontFamily: 'Bangers',
            fontWeight: FontWeight.w400,
            fontSize: 20.0,
          )
        ),
      ),
      body: countries==null?Center(child: CircularProgressIndicator(),):
      ListView.builder( 
      itemBuilder:( context,index){
        return Container(
          height: 130,
          margin: EdgeInsets.symmetric(horizontal:10, vertical:10),
          decoration: BoxDecoration(color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.grey[100],blurRadius: 1.0, offset: Offset(0,5)),
          ]
          ),
          child: Row(
            children: <Widget> [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget> [
                    Text(countries[index]['country'],
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    Image.network(countries[index]['countryInfo']['flag'],height:60, width:70)
                  ]
                ),
              ),
              Expanded(child: Container(
                child: Column(
                  children: <Widget>[
                    Text('\nCONFIRMED:' + countries[index]['cases'].toString(), 
                    style: TextStyle(
                      fontFamily:'ubuntu',
                      color: Colors.red,
                      fontWeight: FontWeight.bold
                    ),),
                    Text('\nACTIVE:' + countries[index]['active'].toString(),
                    style: TextStyle(
                      fontFamily:'ubuntu',
                      color: Colors.blue,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    Text('\nRECOVERED:' + countries[index]['recovered'].toString(),
                    style: TextStyle(
                      fontFamily:'ubuntu',
                      color: Colors.green,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    Text('\nDEATHS:' + countries[index]['deaths'].toString(),style: TextStyle(
                      fontFamily:'ubuntu',
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold
                    ),
                    ),

                  ]
                ),

              ))
            ]
          ),
        );
      },
      itemCount: countries== null ? 0 : countries.length,
       
    ),
    );
    }  
    
    
}