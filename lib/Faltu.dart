import 'package:flutter/material.dart';

class faltu extends StatefulWidget {
  const faltu({Key? key}) : super(key: key);

  @override
  State<faltu> createState() => _faltuState();
}

class _faltuState extends State<faltu> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        child: Row(
          children: [
            Container(
              width: 120,
              height: 75,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                // child: Image.asset(image , fit: BoxFit.cover,),
              ),
            ),
            const SizedBox(width: 20,),
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(" cdcnd " , style: TextStyle(fontSize: 15),)
                  ],
                ),
            ),
          ],
        ),
      ),
    );
  }
}
