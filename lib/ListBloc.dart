import 'package:flutter_bloc_list/prod.dart';

import 'ProductListEvents.dart';
import 'package:bloc/bloc.dart';
import 'ListState.dart';
import 'ProductsRepo.dart';

class ProductListBloc extends Bloc<ProductListEvents, ListState> {
  @override
  // TODO: implement initialState
  ListState get initialState => EmptyListState();

  @override
  Stream<ListState> mapEventToState(ProductListEvents event) async*{
    // TODO: implement mapEventToState
    if( event is LoadingProducts){
     yield LoadingList();
     final List<products> prod = myProducts;
     yield LoadListState(Products: myProducts);
    }
  }

}
