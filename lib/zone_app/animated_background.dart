import 'package:appme/ui/base_widget.dart';
import 'package:appme/zone_app_cubit/cubit/theme.dart';
import 'package:appme/zone_app_cubit/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimatedBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedWidget(
      theBuilder: (context, sizingInfo) {
        return BlocBuilder<ThemeCubit, ThemeInfo>(
          builder: (context, state) {
            return AnimatedContainer(
              duration: const Duration(seconds: 1),
              foregroundDecoration: BoxDecoration(
                color: BlocProvider.of<ThemeCubit>(context).state.isDefault
                    ? Colors.black.withOpacity(0.55)
                    : Colors.black.withOpacity(0.55),
              ),
              child: Image.asset(
                sizingInfo.mobile
                    ? "assets/images/mobile_background.jpg"
                    : "assets/images/desktop_background.jpg",
                fit: BoxFit.cover,
              ),
            );
          },
        );
      },
    );
  }
}
