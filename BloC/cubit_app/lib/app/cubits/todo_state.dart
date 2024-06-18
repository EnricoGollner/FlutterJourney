abstract class TodoState {}

class TodoInitialState extends TodoState {}

class TodoLoadingState extends TodoState {}

class TodoLoadedState extends TodoState {
  final List<String> todos;

  TodoLoadedState({required this.todos});
}

class TodoFailureState extends TodoState {
  final String errorMessage;

  TodoFailureState({required this.errorMessage});
}