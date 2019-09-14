import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_list/ListBloc.dart';
import 'package:flutter_bloc_list/prod.dart';

class HomeList extends StatefulWidget {
  @override
  _HomeListState createState() => _HomeListState();
}

var sHeight, sWidth;

class _HomeListState extends State<HomeList> {
  ProductListBloc listBloc;
  List myProdList = [];
  @override
  void initState(){
    super.initState();
    listBloc = ProductListBloc();
  }

  @override
  Widget build(BuildContext context) {
    sHeight = MediaQuery.of(context).size.height;
    sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc List'),
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
          color: Colors.white,
        ),
        child: ListView.builder(
          itemCount: myProdList.length,
          itemBuilder: (context, index) {
            return Dismissible(
              background: Container(
                color: Colors.deepOrange,
              ),
              key: Key(UniqueKey().toString()),
              onDismissed: (direction) {
               //TODO Remove this setstate method
                setState(() {
                  myProdList.removeAt(index);
                });
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    duration: Duration(milliseconds: 400),
                    content: Text("Item Removed"),
                  ),
                );
              },
             //TODO create a listview
              child: myList(context, index),
            );
          },
        ),
      ),
      floatingActionButton: Container(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              myProdList.add(products(0));
            });
          },
        ),
      ),
    );
  }

  Widget myList(context, int index) {
    double bottomMaggin = 0.0;
    if (myProdList.length - 1 == index) {
      bottomMaggin = 75.0;
    }
    return Container(
      margin: EdgeInsets.only(right: 5.0, top: 10, bottom: bottomMaggin),
      height: sHeight / 6.35,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(15.0),
            topRight: Radius.circular(15.0)),
      ),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            height: sHeight / 4,
            width: sWidth / 4,
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage("images/bottle.png"), fit: BoxFit.cover)),
          ),
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(left: 10.0, top: 20.0),
            child: Text(
              'Product \n${index + 1}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: FlatButton(
              color: Colors.deepOrangeAccent.shade100,
              shape: CircleBorder(),
              child: Icon(Icons.remove),
              onPressed: () {
                decrease(index);
              },
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(
              bottom: 15.0,
            ),
            child: Text(
              '${myProdList[index].value}',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: FlatButton(
              color: Colors.deepOrangeAccent.shade100,
              shape: CircleBorder(),
              child: Icon(Icons.add),
              onPressed: () => increase(index),
            ),
          ),
        ],
      ),
    );
  }

  void decrease(int index) {
    int vv = myProdList[index].value;
    if (vv > 0) vv--;
    setState(() {
      myProdList[index].value = vv;
    });
  }

  void increase(int index) {
    int vv = myProdList[index].value;
    vv++;
    setState(() {
      myProdList[index].value = vv;
    });
  }
}


