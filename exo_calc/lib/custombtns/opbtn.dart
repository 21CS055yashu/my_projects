import 'package:exo_calc/main.dart';
import 'package:flutter/material.dart';

class opbtn extends StatelessWidget{
  String num;
  Function x;
  opbtn(this.num,this.x);

  @override
  Widget build(BuildContext context) {
      return Padding(
      padding: const EdgeInsets.all(7.0),
      child: TextButton(
                  onPressed: () => {
                    x((){
                      if(num == 'C'){
                        data = '';
                      }else if(num == 'Del'){
                        data = data.substring(0,data.length-1);
                      }
                      else{
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
                      }
                    })
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.grey[850]),
                          shape: MaterialStatePropertyAll(CircleBorder()),
                          minimumSize: MaterialStatePropertyAll(Size(70,70)),
                          ),
                  child: Text(num,style: TextStyle(fontSize: 25,fontFamily: 'Poppins'),)),
    );
  }
}