import 'package:flutter/material.dart';

typedef AppColors = ({
  Color primary,
  Color secondary,
  Color white,
  Color grey,
  Color yellow,
  ({
    Color background,
    Color backgroundSecondary,
  }) scaffold,
  ({
    Color title,
    Color main,
    Color hover,
    Color active,
    Color disabled,
    Color click,
    ({
      Color background,
      Color text,
    }) secondary,
  }) button,
  ({
    Color black,
    Color darkGrey,
    Color gray,
    Color lightGray,
    Color white,
  }) background,
  ({
    Color primary,
    Color black,
    Color darkGrey,
    Color grey,
    Color lightGray,
    Color link,
    Color primaryLight,
  }) text,
  ({
    Color primary,
    Color white,
    Color grey,
  }) icon,
  ({
    Color border,
    Color white,
  }) input,
  ({
    ({
      Color icon,
      Color text,
      Color background,
      Color border,
    }) selected,
  }) link,
  ({
    Color background,
    Color border,
    Color text,
    Color icon,
    ({
      Color background,
      Color border,
      Color text,
      Color icon,
    }) selected,
  }) tabbar,
  ({
    Color date,
    Color title,
  }) carousel,
  ({
    Color title,
    Color description,
    Color background,
    Color border,
    Color shadow,
  }) card,
  ({
    Color background,
    Color border,
    Color text,
    ({
      Color background,
      Color border,
      Color text,
    }) selected,
  }) chip,
  ({
    Color background,
    ({
      Color background,
      Color icon,
      Color text,
      ({
        Color background,
        Color icon,
        Color text,
      }) selected,
    }) item,
  }) menulist,
});
