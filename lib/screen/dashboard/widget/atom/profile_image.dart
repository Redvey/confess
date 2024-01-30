import 'package:flutter/material.dart';



class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    this.height=194,
    this.width=204,
    this.bannerHeight=80,
    this.logoutWidth=205,
    this.pfpPositionLeft=60,
    this.pfpPositionTop=40,
    this.pfpPositionRight=60,
    this.pfpRadius=40,
    this.bannerToTextHeight=45,
  });

  final double height;
  final double width;
  final double bannerHeight;
  final double logoutWidth;
  final double pfpPositionLeft;
  final double pfpPositionTop;
  final double pfpPositionRight;
  final double pfpRadius;
  final double bannerToTextHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(6),topRight: Radius.circular(6)),
          child: Container(
            height: height,
            width: width,
            decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(6),
              color: Colors.white,
            ),

            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: bannerHeight,
                      decoration: const BoxDecoration(color: Colors.purple),
                      child: const Image(
                        image: AssetImage('assets/images/profile_banner.jpeg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(height: bannerToTextHeight,),
                    const Center(
                      child: Text(
                        'Ayush Maji',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.42,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6,),
                    Center(
                      child: Container(
                        width: 112,
                        height: 24,
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5.5),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE1E8F8),
                          borderRadius: BorderRadius.circular(31.57),
                        ),
                        child: const Center(
                          child: Text(
                            '163 Confessions',
                            style: TextStyle(
                              color: Color(0xFF4D61FF),
                              fontSize: 8.28,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 0.18,
                            ),
                          ),
                        ),
                      )
                      ,),
                  ],
                ),
                Positioned(
                  left: pfpPositionLeft,
                  top: pfpPositionTop,
                  right: pfpPositionRight,
                  child: CircleAvatar(
                    backgroundImage: const AssetImage('assets/images/profiledisplay.jpeg'),
                    radius: pfpRadius,
                  ),),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8,),
        Container(
          width: logoutWidth,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: const Color(0xFFFCFCFE),

          ),
          child:  Padding(
            padding: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                color: const Color(0xFFE8ECFA),
                height: double.infinity,
                width: double.infinity,
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Icon(Icons.logout,size: 12,),
                      SizedBox(width: 5,),
                      Text(
                        'Logout',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 8,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

      ],
    );
  }
}