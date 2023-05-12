import 'package:flutter/material.dart';

import '../main.dart';

class exo_opbtn extends StatelessWidget{
  String num;
  Function x;
  exo_opbtn(this.num,this.x,{super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: TextButton(
                  onPressed: () => {
                    x((){
                        ope = num;
                        a = double.parse(data.toString());
                        // if(num != ''){
                        // }
                        if(breakpoint == -1){
                          data = data + num;
                          breakpoint = data.length;
                        }else{ 
                          b = double.parse(data.substring(breakpoint).toString());
                        }
                    })
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.grey[850]),
                          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30)))),
                          minimumSize: MaterialStatePropertyAll(Size(120,70)),
                          ),
                  child: Text(num,style: TextStyle(fontSize: 25,fontFamily: 'Poppins'),)),
    );;
  }
}