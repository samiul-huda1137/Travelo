import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelo/cubit/app_cubit_states.dart';
import 'package:travelo/cubit/app_cubits.dart';
import 'package:travelo/misc/colors.dart';
import 'package:travelo/widgets/app_text.dart';
import 'package:travelo/widgets/large_text.dart';
import 'package:travelo/widgets/random_message.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  // List images  = [
  //   "beach.jpg",
  //   "waterfall.jpg",
  //   "panam.jpg",
  //   "beach2.jpg"
  // ];
  var small_images = {
    "h64.png":"Hiking",
    "p64.png":"Paragliding",
    "k64.png":"Kayaking",
    "s64.png":"Sightseeing"
  };
  @override
  Widget build(BuildContext context) {
    double w= MediaQuery.of(context).size.width;
    double h= MediaQuery.of(context).size.height;
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state){
          if (state is LoadedState){
            var info = state.places;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //menu text
                Container(
                  padding: EdgeInsets.only(top: 30, left: 20),
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
                SizedBox(height: h*0.03,),
                //discover text
                Container(
                    margin: EdgeInsets.only(left: 20),
                    child: LargeText(text: "Discover")),
                SizedBox(height: h*0.005,),
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
                  height: h*0.35,
                  width: double.maxFinite,
                  child: TabBarView(
                      controller: _tabController,
                      children: [
                        ListView.builder(
                          itemCount:info.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, int index) {
                            return
                              GestureDetector(
                                onTap: (){
                                  BlocProvider.of<AppCubits>(context).DetailPage(info[index]);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 15, top: 10),
                                  width: w*0.4,
                                  height: h*0.35,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      image: DecorationImage(image: NetworkImage(
                                          "http://mark.bslmeiyu.com/uploads/"+info[index].img
                                      ),
                                          fit: BoxFit.cover
                                      )
                                  ),
                                ),
                              );
                          },

                        ),
                        RandomMessage(),
                        Text("Working as well")
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
                ),
                SizedBox(height: h*0.02,),
                Container(
                  height: h*0.135, width: double.maxFinite,
                  margin: const EdgeInsets.only(left: 20),
                  child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_,index){
                        return Container(
                          margin: const EdgeInsets.only(right: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                //margin: const EdgeInsets.only(right: 15, top: 10),
                                width: 80,
                                height: h*0.09,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey.withOpacity(0.2),
                                    image: DecorationImage(image: AssetImage(
                                        "image/"+small_images.keys.elementAt(index)
                                    ),
                                        fit: BoxFit.contain
                                    )
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                child: AppText(text: small_images.values.elementAt(index),
                                  color: AppColors.textColor2, size: 14,
                                ),
                              )
                            ],
                          ),
                        );

                      }),
                )
              ],
            );
          }else{
            return Container();
          }
        },
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
