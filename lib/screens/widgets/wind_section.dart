import 'package:flutter/material.dart';

import 'windmill.dart';

class WindSection extends StatelessWidget {
  final double airSpeed;
  final double airDirection;

  const WindSection({super.key,required this.airSpeed, required this.airDirection});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            Text('Wind',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
            Icon(Icons.arrow_forward_ios,color: Colors.white,),
          ],),
        const SizedBox(height: 25),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(width: 100,height: 150,
              child: WindmillScreenPoleGround(),),
            Padding(
              padding: const EdgeInsets.only(right: 105.0,top: 50),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                Text('Direction    North'),
                const SizedBox(height: 10),
                Text('Speed   <$airSpeed km/h')
              ],),
            )
          ],)
      ],
    );
  }
}
