import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphqlBloc {
  HttpLink _httpLink;
  ValueNotifier<GraphQLClient> _client;

  static final GraphqlBloc instance = GraphqlBloc._();

  factory GraphqlBloc() => instance;

  GraphqlBloc._() {
    _httpLink = HttpLink(uri: 'https://countries.trevorblades.com/');
    _client = ValueNotifier(
      GraphQLClient(
        cache: InMemoryCache(),
        link: _httpLink,
      ),
    );
  }

  ValueNotifier<GraphQLClient> get client => _client;
}
