import 'package:flutter/material.dart';

class CustomListTileWidget extends StatelessWidget {
   CustomListTileWidget({
    Key? key,
  
   
    required this.name
  }) : super(key: key);

  
 
  String name;

  @override
  Widget build(BuildContext context) {
    return Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(5),
              border: Border.all(
                  color: Colors.black)),
          child: Row(
            // mainAxisAlignment:
            //     MainAxisAlignment.spaceAround,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 5),
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                      "lib/assets/WhatsApp Image 2022-08-14 at 1.55.51 PM (1).jpeg"),
                  radius: 20,
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              Text(
                name,
                style: const TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 5,
              )
            ],
          ),
        );
  }
}