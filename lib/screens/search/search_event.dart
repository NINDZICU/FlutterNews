import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {

  @override
  List<Object> get props => [];
}

class QueryEntered extends SearchEvent{
  final String query;

  QueryEntered(this.query);
}
