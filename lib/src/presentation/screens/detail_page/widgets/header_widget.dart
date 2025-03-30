import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key, required this.name, required this.id});

  final String name;
  final int id;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.width * .55,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 8.0),
              child: Image.asset('assets/images/detail_pokeball.png'),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                      ),
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: size.width * .08,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Arial',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 24.0),
                    child: Text(
                      '#${id < 100 ? id.toString().padLeft(3, '0') : id}',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
