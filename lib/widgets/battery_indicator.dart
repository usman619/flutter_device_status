import 'package:cupertino_battery_indicator/cupertino_battery_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_status/components/neu_box.dart';

Widget batteryIndicator(double val){
  val = val / 100.0;
  return NeuBox(
    child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                   Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: BatteryIndicator(
                      trackHeight: 50.0,
                      barColor: Colors.green,
                      value: val,
                      icon: const Icon(CupertinoIcons.bolt_fill, color: Colors.black),
                      iconOutline: Colors.white,
                      
                      iconOutlineBlur: 0,
                    ),
                  ),
                  Text('${(val * 100).ceil()}%'),
                  
                  
                ],
              ),
        ),
  );
}