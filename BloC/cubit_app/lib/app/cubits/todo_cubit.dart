import 'package:bloc/bloc.dart';
import 'package:cubit_app/app/cubits/todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final List<String> _todos = [];
  List<String> get todos => _todos;

  TodoCubit() : super(TodoInitialState());

  Future<void> add({required String newTodo}) async {
    emit(TodoLoadingState());
    await Future.delayed(const Duration(seconds: 1));

    if (_todos.contains(newTodo)) {
      emit(TodoFailureState(errorMessage: 'To-do already exists'));
      return;
    }

    _todos.add(newTodo);
    emit(TodoLoadedState(todos: _todos));
  }

  Future<void> remove({required int index}) async {
    emit(TodoLoadingState());
    await Future.delayed(const Duration(seconds: 1));

    _todos.removeAt(index);
    emit(TodoLoadedState(todos: _todos));
  }
}