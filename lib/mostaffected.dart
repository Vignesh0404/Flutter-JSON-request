import 'package:flutter/material.dart';

class MostAffected extends StatelessWidget {
  final List mostAffected;
  const MostAffected({Key key,this.mostAffected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(shrinkWrap: true, itemBuilder:  (context,index){
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: <Widget>[
              Image.network(mostAffected[index]['countryInfo']['flag'],
              height: 20,
              
              ),
              SizedBox(height: 10.0,),
              Text(mostAffected[index]['country'],
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                color: Colors.white,
              ),
              ),
              SizedBox(height: 10.0,),
              Text('Deaths:' + mostAffected[index]['deaths'].toString(),
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w500
              ),
              )
            ] 
          ),
        );
      },
      itemCount: 5,),
    );


  }
}