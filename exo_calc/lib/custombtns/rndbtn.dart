import 'package:exo_calc/main.dart';
import 'package:flutter/material.dart';

class rndbtn extends StatelessWidget{
  String num;
  Function x;
  rndbtn(this.num,this.x);
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: TextButton(
                  onPressed: () => {
                    x((){
                      data = data + num;
                    })
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.grey[900]),
                          shape: MaterialStatePropertyAll(CircleBorder()),
                          minimumSize: MaterialStatePropertyAll(Size(70,70)),
                          ),
                  child: Text(num,style: TextStyle(fontSize: 25,fontFamily: 'Poppins'),)),
    );
  }
}