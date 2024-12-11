import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../domain/repos/app_repo.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppCubitStates> {
  final AppRepo appRepo;
  AppCubit(this.appRepo) : super(AppCubitInitial());
}
