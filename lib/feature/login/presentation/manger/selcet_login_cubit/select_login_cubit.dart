import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'select_login_state.dart';

class SelectLoginCubit extends Cubit<SelectLoginState> {
  SelectLoginCubit() : super(SelectLoginInitial());
}
