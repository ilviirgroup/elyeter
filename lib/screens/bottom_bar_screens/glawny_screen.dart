import 'package:flutter/material.dart';
import 'package:untitled3/screens/info_screen/info_products.dart';


class GlawnyScreen extends StatefulWidget {
  const GlawnyScreen({Key key}) : super(key: key);

  @override
  _GlawnyScreenState createState() => _GlawnyScreenState();
}
int currentTab = 0;
Color _favIconColor = Colors.grey;
class _GlawnyScreenState extends State<GlawnyScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
     child: ListView(
       scrollDirection: Axis.vertical,
       children:<Widget> [
        SizedBox(height: 10.0,),
         ImageContainer(),
         SizedBox(height: 20.0,),
         RecommendedProducts(),
         SizedBox(height: 30.0,),
         TopProducts()
       ],
     ),
    );
  }
  Widget ImageContainer(){
    return Container(
      height: 200.0,
      child: Image.network(
          'https://tse1.mm.bing.net/th?id=OIP.zz_mWMeWXEy3WQRaKsmhZgHaDg&pid=Api&P=0&w=333&h=159',
          fit: BoxFit.cover,
      ),
    );
  }
  Widget labelContainer(String labelVal) {
    return Container(
      height: 30.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            labelVal,
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
          ),
          Text(
            'MORE',
            style: TextStyle(color: Color(0xff015367),fontWeight: FontWeight.bold,fontSize: 18.0),
          ),
        ],
      ),
    );
  }
  Widget TopProducts() {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: labelContainer('Top Products'),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ProductRecommendedContainer(),
          ),
        ],
      ),
    );
  }
  Widget ProductRecommendedContainer() {
    return Container(
        height: 180.0,
        child: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> InfoProductScreens()));
          },
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              imageSection(
                  'https://sun9-66.userapi.com/impg/hbDYyrRTnYjYpNagZShpQXQf7cFTd5qaiwCapA/9VWLnu5VxSw.jpg?size=492x381&quality=96&sign=e29a5214b103d770d1756ebeeb8d8211&type=album',
                  'Платье','4.2'),
              SizedBox(
                width: 20.0,
              ),
              imageSection(
                  'https://sun9-66.userapi.com/impg/hbDYyrRTnYjYpNagZShpQXQf7cFTd5qaiwCapA/9VWLnu5VxSw.jpg?size=492x381&quality=96&sign=e29a5214b103d770d1756ebeeb8d8211&type=album',
                  'Платье','4.5'),
              SizedBox(
                width: 20.0,
              ),
              imageSection(
                  'https://sun9-66.userapi.com/impg/hbDYyrRTnYjYpNagZShpQXQf7cFTd5qaiwCapA/9VWLnu5VxSw.jpg?size=492x381&quality=96&sign=e29a5214b103d770d1756ebeeb8d8211&type=album',
                  'Платье','4.1'),
              SizedBox(
                width: 20.0,
              ),
              imageSection(
                  'https://sun9-66.userapi.com/impg/hbDYyrRTnYjYpNagZShpQXQf7cFTd5qaiwCapA/9VWLnu5VxSw.jpg?size=492x381&quality=96&sign=e29a5214b103d770d1756ebeeb8d8211&type=album',
                  'Платье','4.4'),
              SizedBox(
                width: 20.0,
              ),
              imageSection(
                  'https://sun9-66.userapi.com/impg/hbDYyrRTnYjYpNagZShpQXQf7cFTd5qaiwCapA/9VWLnu5VxSw.jpg?size=492x381&quality=96&sign=e29a5214b103d770d1756ebeeb8d8211&type=album',
                  'Платье','4.3'),
              SizedBox(
                width: 20.0,
              ),
              imageSection(
                  'https://sun9-66.userapi.com/impg/hbDYyrRTnYjYpNagZShpQXQf7cFTd5qaiwCapA/9VWLnu5VxSw.jpg?size=492x381&quality=96&sign=e29a5214b103d770d1756ebeeb8d8211&type=album',
                  'Платье','4.3'),
            ],
          ),
        ));
  }
Widget RecommendedProducts(){
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(8.0),
          child: labelContainer('Recommended for you'),
          ),
          Padding(padding: EdgeInsets.all(8.0),
          child: ProductsContainer(),)
        ],
      ),
    );
}
  Widget imageSection(String imageVal, String appVal,String rateVal,) {
    return Column(
      children: <Widget>[
        Container(
          height: 100.0,
          width: 100.0,
          decoration: new BoxDecoration(
            image: DecorationImage(
              image: new NetworkImage(imageVal),
              fit: BoxFit.fitHeight,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),

        Text(
          appVal,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
        SizedBox(
          height: 0.050,
        ),
        Row(children: <Widget>[
          Text(
            rateVal,
                       style: TextStyle(
              color: Colors.black , fontWeight: FontWeight.bold,),
          ),
          IconButton(
            icon: Icon(Icons.favorite,color: _favIconColor),
              onPressed: (){
                setState(() {
                  if(_favIconColor == Colors.grey){
                    _favIconColor = Colors.red[900];
                  }else{
                    _favIconColor = Colors.grey;
                  }
                });
              },
            alignment: Alignment.bottomRight,
              ),

        ],)
      ],
    );
  }
Widget ProductsContainer(){
    return Container(
      height: 180.0,
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> InfoProductScreens()));
        },
        child: ListView(
          scrollDirection: Axis.horizontal,
          children:<Widget> [
            imageSection(
                'https://tse1.mm.bing.net/th?id=OIP.zz_mWMeWXEy3WQRaKsmhZgHaDg&pid=Api&P=0&w=333&h=159',
                'Платье','Цена',
            ),
            SizedBox(
              width: 20.0,
            ),
            imageSection(
                'https://tse1.mm.bing.net/th?id=OIP.zz_mWMeWXEy3WQRaKsmhZgHaDg&pid=Api&P=0&w=333&h=159',
                'Платье','Цена'),
            SizedBox(
              width: 20.0,
            ),
            imageSection(
                'https://tse1.mm.bing.net/th?id=OIP.zz_mWMeWXEy3WQRaKsmhZgHaDg&pid=Api&P=0&w=333&h=159',
                'Платье','Цена'),
            SizedBox(
              width: 20.0,
            ),
            imageSection(
                'https://tse1.mm.bing.net/th?id=OIP.zz_mWMeWXEy3WQRaKsmhZgHaDg&pid=Api&P=0&w=333&h=159',
                'Платье','Цена'),
            SizedBox(
              width: 20.0,
            ),
            imageSection(
                'https://tse1.mm.bing.net/th?id=OIP.zz_mWMeWXEy3WQRaKsmhZgHaDg&pid=Api&P=0&w=333&h=159',
                'Платье','Цена'),
            SizedBox(
              width: 20.0,
            ),
            imageSection(
                'https://tse1.mm.bing.net/th?id=OIP.zz_mWMeWXEy3WQRaKsmhZgHaDg&pid=Api&P=0&w=333&h=159',
                'Платье','Цена'),
          ],

        ),
      ),
    );
}
}
