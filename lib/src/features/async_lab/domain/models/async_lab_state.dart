class AsyncLabState {
  const AsyncLabState({
    this.searchQuery = '',
    this.searchResults = const [],
    this.searchErrorMessage,
  });

  final String searchQuery;
  final List<String> searchResults;
  final String? searchErrorMessage;

  AsyncLabState copyWith({
    String? searchQuery,
    List<String>? searchResults,
    String? searchErrorMessage,
    bool clearSearchErrorMessage = false,
  }) {
    return AsyncLabState(
      searchQuery: searchQuery ?? this.searchQuery,
      searchResults: searchResults ?? this.searchResults,
      searchErrorMessage: clearSearchErrorMessage
          ? null
          : (searchErrorMessage ?? this.searchErrorMessage),
    );
  }
}
