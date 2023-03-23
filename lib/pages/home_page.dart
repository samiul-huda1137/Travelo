import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelo/misc/colors.dart';
import 'package:travelo/widgets/app_text.dart';
import 'package:travelo/widgets/large_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List images  = [
    "beach.jpg",
    "waterfall.jpg",
    "panam.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //menu text
          Container(
            padding: EdgeInsets.only(top: 70, left: 20),
            child: Row(
              children: [
                Icon(Icons.menu,size: 30, color: Colors.black54,),
                Expanded(child: Container()),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40,),
          //discover text
          Container(
              margin: EdgeInsets.only(left: 20),
              child: LargeText(text: "Discover")),
          SizedBox(height: 40,),
          //tab bar
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: EdgeInsets.only(left: 20,right: 20),
                controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                  tabs: [
                    Tab(text: "Places"),
                    Tab(text: "Inspirations",),
                    Tab(text: "Emotions",)
                  ]),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
                children: [
              ListView.builder(
                itemCount:images.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, int index) {
                  return
                  Container(
                  margin: EdgeInsets.only(right: 15, top: 10),
                  width: 200,
                  height: 300,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  image: DecorationImage(image: AssetImage(
                  "image/"+images[index]
                  ),
                  fit: BoxFit.cover
                  )
                  ),
                  );
                },

              ),
              Text("Hello"),
              Text("Holla"),
            ]),
          ),
          SizedBox(height: 30,),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LargeText(text: "Explore more", size: 22),
                AppText(text: "See all", color: AppColors.textColor1,)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration{
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius:radius);
  }

}
class _CirclePainter extends BoxPainter{
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color=color;
    _paint.isAntiAlias=true;
    final Offset circleOffset = Offset(configuration.size!.width/2 -radius/2, configuration
    .size!.height-radius);
    canvas.drawCircle(offset+circleOffset, radius, _paint);
  }

}
