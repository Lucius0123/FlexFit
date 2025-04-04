import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({super.key, required this.title, required this.image});
   final String title;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      width: 157.h,
      child: Column(
        children: [
          Container(
            height: 130.h,
            width: 157.h,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(image,)),
            ),
            child:  Align(
              alignment: Alignment.topRight,
              child: IconButton(onPressed: (){},
                  icon: Icon(Icons.star,color: Colors.white,size: 30,)),
            ),
          ),
          SizedBox(height: 8,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(title,
              maxLines: 2,
              overflow:TextOverflow.ellipsis,
              style:GoogleFonts.poppins(
                fontSize: 12.sp,
                color: Colors.white,
                fontWeight: FontWeight.w400
            ),),
          ),
        ],
      ),
    );
  }
}
