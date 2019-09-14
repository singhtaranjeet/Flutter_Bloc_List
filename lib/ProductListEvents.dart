import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc_list/prod.dart';

abstract class ProductListEvents{}

class ProductAddingEvent extends ProductListEvents{
final prod;
  ProductAddingEvent({@required this.prod}): assert(prod!=null);

}
class LoadingProducts extends ProductListEvents{
  final List<products> myList = myProducts;
}

class ProductRemovingEvent extends ProductListEvents{

}

class IncreasingItemCountEvent extends ProductListEvents{}

class DecreasingItemCountEvent extends ProductListEvents{}

