import 'dart:math';

import 'package:flutter/material.dart';

import 'custombtns/exo_opebtn.dart';
import 'custombtns/opbtn.dart';
import 'custombtns/rndbtn.dart';

void main() {
  runApp(
      const MaterialApp(home: HomePage(), debugShowCheckedModeBanner: false));
}

String data = '1';
double a = 0;
double b = 0;
int breakpoint = -1;
String ope = '';
TextEditingController tedit1 = TextEditingController();
FocusNode focusNode = FocusNode();

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 17, 17, 17),
      body: Calc(),
    );
  }
}

class Calc extends StatefulWidget {
  @override
  State<Calc> createState() => _CalcState();
}

class _CalcState extends State<Calc> {

  @override
  void initState() {
    // TODO: implement initState
    breakpoint = -1;
    data = '';
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // TextField(
          //   style: TextStyle(color: Colors.white,),
          //   textAlign: TextAlign.right,
          // ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.only(right: 10,left: 10,top: 5,bottom: 5),
            width: double.maxFinite,
            height: 50,
            decoration: BoxDecoration(border: Border.all(color: Color.fromRGBO(50, 50, 50, 2),style: BorderStyle.solid,width: 2),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            alignment: Alignment.centerRight,
            
            child: Text(data,style: TextStyle(color: Colors.white, fontSize: 30),overflow: TextOverflow.fade,),
            // child: ,
            // child: EditableText(controller: tedit1, focusNode: FocusNode(debugLabel: data,onKeyEvent: (focusNode,)=>{}), style: TextStyle(color: Colors.white, fontSize: 30),cursorColor: Color.fromRGBO(190, 10, 10, 4),backgroundCursorColor: Color.fromRGBO(90, 90, 40, 5),),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              exo_opbtn('mod',setState),
              exo_opbtn('pow', setState)
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              opbtn('C',setState),
              opbtn('%',setState),
              opbtn('Del',setState),
              opbtn('/',setState)
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              rndbtn('7',setState),
              rndbtn('8',setState),
              rndbtn('9',setState),
              opbtn('x',setState)
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              rndbtn('4',setState),
              rndbtn('5',setState),
              rndbtn('6',setState),
              opbtn('-',setState)
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              rndbtn('1',setState),
              rndbtn('2',setState),
              rndbtn('3',setState),
              opbtn('+',setState)
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              rndbtn('00',setState),
              rndbtn('0',setState),
              rndbtn('.',setState),
              Padding(
        padding: const EdgeInsets.all(7.0),
        child: TextButton(
                    onPressed: () => {
                      setState(() {
                        if(breakpoint != 1){
                          b = double.parse(data.substring(breakpoint).toString());
                        }
      
                        if(ope == '+'){
                          data = (a+b).toString();
                        }else if(ope == '-'){
                          data = (a-b).toString();
                        }else if(ope == 'x'){
                          data = (a*b).toString();
                        }else if(ope == '/'){
                          data = (a/b).toString();
                        }else if(ope == '%'){
                          data = ((a/100)*b).toString();
                        }else if(ope == 'mod'){
                          data = (a%b).toString();
                        }else if(ope == 'pow'){
                          data = (pow(a, b).toString());
                        }
                        breakpoint = -1;
                        })
                    },
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.orange),
                            shape: MaterialStatePropertyAll(CircleBorder()),
                            minimumSize: MaterialStatePropertyAll(Size(70,70)),
                            ),
                    child: const Text('=',style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: 'Poppins'),)),
      )
      
            ],
          ),
        ],
      ),
    );
  }
}




// int imgvar = 0;

// List<String> images = [
//   'assets\\dino-1.jpg',
//   'assets\\dino-2.jpg',
//   'assets\\dino-3.jpg',
//   'assets\\dino-1.jpg'
// ];

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Exo_calc',
//           style: TextStyle(fontFamily: 'Poppins'),
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.only(top: 10, bottom: 10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 const Icon(
//                   Icons.arrow_forward_rounded,
//                   size: 30,
//                 ),
//                 const Text('This is the extraordinary calculator.')
//               ],
//             ),
//           ),
//           imgwindow(),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         child: const Text(
//           'Click',
//           style: TextStyle(fontFamily: 'Poppins'),
//         ),
//       ),
//     );
//   }
// }

// class imgwindow extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _imgwindow();
// }

// class _imgwindow extends State<imgwindow> {
//   @override
//   void setState(VoidCallback fn) {
//     super.setState(fn);
//   }

//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           SizedBox(
//             height: 240,
//             child: Image(image: AssetImage(images[imgvar]),fit: BoxFit.contain)), 
//           Container(
//             margin: EdgeInsets.only(top: 30),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                     onPressed: () => {
//                           setState(() {
//                             if (imgvar > 0) imgvar = imgvar - 1;
//                           })
//                         },
//                     child: Text('Prev')),
//                 ElevatedButton(onPressed: () => {}, child: Text('select')),
//                 ElevatedButton(onPressed: () => {
//                   setState(() {
//                             if (imgvar < 3) imgvar = imgvar + 1;
//                           })
//                 }, child: Text('Next')),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
