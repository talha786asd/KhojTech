 

import 'package:flutter/material.dart';

class CustomStepper extends StatefulWidget {
    CustomStepper({Key? key,
    this.iconSize,
    this.lowerLimit,
    this.stepValue,
    this.upperLimit,
    this.value,
    this.onChanged}) : super(key: key);

  final int? lowerLimit;
  final int? upperLimit;
  final int? stepValue;
  double? iconSize;
  final int? value;
  final ValueChanged<dynamic>? onChanged;


  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[100],
      borderRadius: BorderRadius.all(Radius.circular(20)),
      boxShadow: <BoxShadow>[
        BoxShadow(color: Colors.white, blurRadius: 15, spreadRadius: 10)
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.remove)),
          Container(
            width: this.widget.iconSize,
            child: Text('${widget.value}',style: TextStyle(fontSize: widget.iconSize! * 0.8),textAlign: TextAlign.center,),
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.add))
        ],
      ),
    );
    
  }
}