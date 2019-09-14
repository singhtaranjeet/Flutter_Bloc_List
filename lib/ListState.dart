import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_list/prod.dart';

abstract class ListState{}

class EmptyListState extends ListState{}


class LoadListState extends ListState{
final List<products> Products;

  LoadListState({@required this.Products}): assert(Products!=null);

}
class LoadingList extends ListState{}

class ErrorState extends ListState{}

class IncreasingItemCountState extends ListState{}

class DecreasingItemCountState extends ListState{}

