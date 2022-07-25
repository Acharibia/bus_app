import 'package:flutter/material.dart';

class NeuButton extends StatelessWidget {
  final onTap;
  bool isButtonPressed;
  String title;
  int id;
  NeuButton({this.onTap, required this.isButtonPressed, required this.title, required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        width:200,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(12),
          boxShadow: isButtonPressed ? [] :[
            BoxShadow(
              color: Colors.grey.shade500,
              blurRadius: 15,
              offset: Offset(6, 6),
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Colors.white,
              blurRadius: 15,
              offset: Offset(-6, -6),
              spreadRadius: 1,
            ),                        ],
          border: Border.all(color: isButtonPressed ? Colors.grey.shade200 : Colors.grey.shade300)
        ),
        duration: Duration(milliseconds: 200),
        
        child: Card(
          color: Colors.transparent,
          elevation: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.shade200,
                ),
                height:60,
                width: 70,

                child: Image(
                  image: AssetImage(
                    "assets/images/icons8-bus-64.png",
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Center(
                child:
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    ;
  }
}
