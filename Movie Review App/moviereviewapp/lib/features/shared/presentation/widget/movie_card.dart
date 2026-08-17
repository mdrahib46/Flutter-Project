import 'package:flutter/material.dart';

import '../../../../app/asset_path.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: SizedBox(
        height: 140,
        width: 88,
        child: Column(
          mainAxisSize: .min,
          children: [
            Container(
              height: 110,
              width: 88,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    image: AssetImage(AssetPath.dummyImage),
                    fit: BoxFit.cover
                ),
              ),
            ),
            const SizedBox(height: 4,),
            Text('The boy with heron', overflow: TextOverflow.ellipsis,)
          ],
        ),
      ),
    );
  }
}