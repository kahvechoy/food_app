import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_app/model/models.dart';
import 'package:food_app/service/services.dart';
import 'package:food_app/ui/pages.dart';
import 'package:get/get.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  Future<void> signIn(String email, String password) async {
    ApiReturnValue<User> result = await UserServices.signIn(email, password);
    if (result.value != null) {
      emit(UserLoaded(result.value!));
    } else {
      emit(UserLoadingFailed(result.message!));
    }
  }

  Future<void> signUp(User user, String password, {File? pictureFile}) async {
    ApiReturnValue<User> result =
        await UserServices.signUp(user, password, pictureFile: pictureFile);
    if (result.value != null) {
      emit(UserLoaded(result.value!));
    } else {
      emit(UserLoadingFailed(result.message!));
    }
  }

  Future<void> uploadProfilePicture(File pictureFile) async {
    ApiReturnValue<String> result =
        await UserServices.uploadPicturePath(pictureFile);
    if (result != null) {
      emit(UserLoaded((state as UserLoaded).user.copyWith(
          picturePath: 'https://food.rtid73.com/storage/${result.value}')));
    }
  }

  Future<void> signOut() async {
    ApiReturnValue<bool> result = await UserServices.logout();

    if (result.value != null) {
      emit(UserInitial());
    } else {
      emit(UserLoadingFailed(result.message!));
    }
  }
}
