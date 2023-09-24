// Import necessary dependencies and files
import 'package:beespoke_shopping/core/failures.dart';
import 'package:beespoke_shopping/domain/login_domain/login_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Import event and state classes for the LoginBloc
part 'login_event.dart';
part 'login_state.dart';

// Create a LoginBloc class that extends Bloc and handles LoginEvent and LoginState
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  // Create an instance of the LoginUseCase class
  final LoginUscase uscase = LoginUscase();
  final Future<SharedPreferences> prfs = SharedPreferences.getInstance();
  // Initialize the LoginBloc with the LoginInitialState
  LoginBloc() : super(LoginInitialState()) {
    on<InitialEvent>((event, emit) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      if (token != null) {
        emit(TokenPresentState());
      } else {
        emit(LoginInitialState());
      }
    });
    // Define how the bloc should respond to the LoginButtonPressed event
    on<LoginButtonPressed>((event, emit) async {
      // Emit a LoginLoadingState to indicate that login process has started
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      emit(LoginLoadingState());
      // Call the getproductdata method from the LoginUseCase

      final token = await uscase.getLogindata(event.username, event.password);

      // Handle the result of the getproductdata method
      token.fold(
          // If there is a failure, emit a LoginFailureState with the error message
          (failure) => emit(LoginFailureState(error: _mapfailure(failure))),
          // If successful, emit a LoginSuccessState
          (productlist) {
        prefs.setString('token', productlist.token);
        emit(LoginSuccessState());
      });
    });
  }

  // Helper method to map a Failure object to an error message
  String _mapfailure(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return kServerfailure;

      case CacheFailure:
        return kCachefailure;

      default:
        return kGenaralfailure;
    }
  }
}
