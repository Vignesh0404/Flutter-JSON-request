
import 'dart:convert';
import 'package:covid19/countries.dart';
import 'package:covid19/mostaffected.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'mostaffected.dart';
import 'widgets/widgets.dart';
import 'package:http/http.dart' as http;

class Index extends StatefulWidget {
  static const routename = '/Index';
  Index({Key key}) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {

Map worldData;
fetchworldWideData()async{
  http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
  setState(() {
    worldData = json.decode(response.body);
  });
}


List mostAffected;
fetchmostAffected()async{
  http.Response response = await http.get('https://corona.lmao.ninja/v2/countries');
  setState(() {
    mostAffected = json.decode(response.body);
  });
}

@override
  void initState() {
    fetchworldWideData();
    fetchmostAffected();
    super.initState();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202c3b),
       appBar: AppBar(
         title:
          
         Text(
           "Covid19' Tracker",
           style: TextStyle(
             fontSize: 30.0,
             fontFamily: 'Bangers',
             color: Colors.white, 
             
           ),
         ),
         actions: <Widget>[
           IconButton(icon: Icon(Icons.info), onPressed:(){

           })
         ],
       ),
       drawer: new Drawer(

         child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              decoration: BoxDecoration(
              color: Color(0xff202c3b),
              image: DecorationImage(
                      image: new ExactAssetImage('images/cpo.jpg'),
                      fit: BoxFit.cover,
                    ),
              ),
              accountName: new Container(
                child: Text(
                  "\nCOVID '19 Tracker",
                style: TextStyle(
                   color: Colors.white,
                   fontSize: 20,
                   fontFamily: "Ubuntu"
                ),
              )),
              accountEmail: new Text("An mobile application to track the impact of corona ",
              style: TextStyle(
                fontFamily: "teko",
                fontSize: 10,
                
              ),
              ),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.white38,
              ),
            ),
            new ListTile (
              trailing: new Icon(Icons.home),
              title: new Text('Home'),
               onTap: () => Navigator.of(context).pop(),
              ),
              new ListTile (
              trailing: new Icon(Icons.info),
              title: new Text('International - Tracker'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Countries()));       
              },
              ),
              new ListTile (
              trailing: new Icon(Icons.info),
              title: new Text('India - Tracker'),
              onTap: () {
                Navigator.of(context).pop();        
              },
              ),
            new ListTile (
              trailing: new Icon(Icons.format_quote),
              title: new Text('About'),
              onTap: () {
                        Navigator.of(context).pop();
                     //  Navigator.of(context).pushNamed(placements.routename);
                     },
              ),
               new ListTile (
              trailing: new Icon(Icons.account_balance),
              title: new Text('FAQ'),
              onTap: () {
                      Navigator.of(context).pop();
                     //  Navigator.of(context).pushNamed(higheredu.routename);
                     },
              ),
               new ListTile (
              trailing: new Icon(Icons.web),
              title: new Text('Visit Site'),
              onTap: () => launch('https://www.covid19india.org/')
 
                    
              ),
              new ListTile (
              trailing: new Icon(Icons.code),
              title: new Text('View Code - Github'),
              onTap: () => launch('https://github.com/Vignesh0404')
              
              ),
              new ListTile (
              trailing: new Icon(Icons.view_agenda),
              title: new Text('Donate - WHO'),
              onTap: () => launch('https://www.who.int/emergencies/diseases/novel-coronavirus-2019/donateh')
              ),
            
              new Divider(),
                 new ListTile (
              trailing: new Icon(Icons.verified_user),
              title: new Text('Version - 1.0'),
             onLongPress: () => launch('https://vignesh0404.github.io/')
                
              )
              
          ],
        ),
      ),

    body: 
     Column(
       
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
        Container(
          padding: const EdgeInsets.fromLTRB(100.0, 15.0, 0.0, 0.0),
          child: Text(
            'Total Cases:',
            style: TextStyle(
              fontFamily: 'Bangers',
              fontSize: 35.0,
              color: Colors.white,
              fontWeight: FontWeight.w400 
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(120.0, 15.0, 0.0, 0.0),
          child: Text(worldData['updated'].toString(),
          style: TextStyle(
            fontFamily: 'Bangers',
            fontSize: 20.0,
            color: Colors.red
          ),
          ),
        ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Case Update',
              style:TextStyle(
                fontFamily: "Ubuntu",
                fontSize:26,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ) ,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Text('Updated',
                style:TextStyle(
                  color: Colors.greenAccent,
                  fontFamily: "Ubuntu",
                  fontSize:12,
                  fontWeight: FontWeight.bold
                ) ,
                ),
              ),
          ],
        ),
      ),
       worldData==null?CircularProgressIndicator():Case(worldData: worldData,),
       SizedBox(height: 10.0,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text('LeastAffected',
                style:TextStyle(
                  fontFamily: "Ubuntu",
                  color: Colors.white,
                  fontSize:26,
                  fontWeight: FontWeight.bold
                ) ,
                ),
        ),
        
        SizedBox(height: 10.0,),
       mostAffected==null?Container():MostAffected(mostAffected: mostAffected,),

      ],
      
    ),
    );
  }
}