import 'package:flutter/material.dart';
import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var materialApp = new MaterialApp(
      title: "My App",
      home: new HomePage(),
      darkTheme: ThemeData.dark(),
    );
    return materialApp;
  }
}

class HomePage extends StatefulWidget {
  
  
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController _controller;


  bool _isEditingText = false;
  TextEditingController _editingController;
  String initialText = "Initial Text";

  Animated


  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController(text: initialText);
    _controller = AnimationController(vsync: this);
   
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
    _controller.dispose();
  }



  Widget _editTitleTextField() {
  if (_isEditingText)
    return Row(
       mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(
          fit:FlexFit.loose,
      
              child: Column(
            children: <Widget>[
              Container(
                width: 180,
                child: TextField(
                                          
                                  onSubmitted: (newValue){
                                            setState(() {
                                              initialText = newValue;
                                              _isEditingText =false;
                                            });
                                          },
                                          // autofocus: true,
                                          controller: _editingController,

                                          decoration: InputDecoration(border:InputBorder.none ,hintText: "",hintStyle:TextStyle(fontSize: 25,fontFamily: 'Dancing_Script')),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                             fontFamily: 'Dancing_Script',
                                             shadows: [
                                        Shadow(
                                        blurRadius: 2.0,
                                        color: Colors.black,
                                        offset: Offset(2.0, 2.0),
                                        ),
                            ],

                            fontSize: 35.0,
                            letterSpacing: 2,),
                                        ),
              ),
            ],
          ),
        ),
      ],
    );
              
    
          
       
  else{

  
  return FadeAnimatedTextKit(text:
  [initialText],
  textStyle: TextStyle(
    fontFamily: 'Dancing_Script',

    shadows: [
      Shadow(
      blurRadius: 2.0,
      color: Colors.black,
      offset: Offset(2.0, 2.0),
      ),
    ],
    color: Colors.white,
    fontSize: 35.0,
    letterSpacing: 2,
    
  ),
  onTap: () {
      setState(() {
        _isEditingText = true;
      });
    },
    duration: Duration(seconds: 5),
    pause: Duration(seconds: 2),

    textAlign: TextAlign.center,
 );
}
  }


   @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Process App"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          color: Colors.pink[200],
          height: 600,
          width: 400,
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.loose,
            children: <Widget>[

              DragBox(Offset(100.0,200.0), _editTitleTextField())
              
                            


            ],
          ),
        ),
      ),
    );
  }
}


class DragBox extends StatefulWidget {
  final Offset initPos;
  final Widget label;


  DragBox(this.initPos, this.label);

  @override
  DragBoxState createState() => DragBoxState();
}

class DragBoxState extends State<DragBox> {
  Offset position = Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    position = widget.initPos;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: position.dx,
        top: position.dy,
        child: Draggable(
          child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: <Widget>[
                       widget.label,

                       
                     ],
                 ),
          
        
          onDraggableCanceled: (velocity, offset) {
            setState(() {
              position = offset;
            });
          },
          feedback:Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: <Widget>[
                       widget.label,

                       
                     ],
                 ), 
        ));
  }
}