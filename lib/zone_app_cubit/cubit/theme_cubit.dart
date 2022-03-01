import 'package:appme/zone_app_cubit/cubit/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeInfo> {
  ThemeInfo initialInfo;
  ThemeCubit(this.initialInfo) : super(initialInfo);

  void change() {
    initialInfo.swapColor();
    emit(ThemeInfo(isDefault: this.initialInfo.isDefault));
  }
}
