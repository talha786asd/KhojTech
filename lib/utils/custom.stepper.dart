import 'package:flutter/material.dart';

class CustomStepper extends StatefulWidget {
  CustomStepper(
      {this.iconSize,
      this.lowerLimit,
      this.stepValue,
      this.upperLimit,
      this.value,
      this.onChanged});

  int? lowerLimit;
  int? upperLimit;
  int? stepValue;
  double? iconSize;
  int? value;
  ValueChanged<dynamic>? onChanged;

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: const BorderRadius.all(
          Radius.circular(
            20,
          ),
        ),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.white,
            blurRadius: 15,
            spreadRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                setState(() {
                  widget.value = widget.value == widget.lowerLimit
                      ? widget.lowerLimit
                      : widget.value = (widget.value! - widget.stepValue!);

                  widget.onChanged!(widget.value);
                });
              },
              icon: Icon(Icons.remove)),
          Container(
            width: this.widget.iconSize,
            child: Text(
              '${widget.value}',
              style: TextStyle(fontSize: widget.iconSize! * 0.8),
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                widget.value = widget.value == widget.upperLimit
                    ? widget.upperLimit
                    : widget.value = (widget.value! + widget.stepValue!);

                widget.onChanged!(widget.value);
              });
            },
            icon: const Icon(
              Icons.add,
            ),
          )
        ],
      ),
    );
  }
}
