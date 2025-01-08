import 'package:crud_app/src/core/themes/colors.dart';
import 'package:flutter/material.dart';

const AppColors darkThemeColors = (
  primary: Color(0xFF00082D),
  secondary: Color(0xFF008ECF),
  white: Color(0xFF171F43),
  grey: Color(0xFF00395E),
  yellow: Color(0xFFF0B646),
  scaffold: (
    background: Color(0xFF00082D),
    backgroundSecondary: Color(0xFF00082D),
  ),
  button: (
    title: Color(0xFFFFFFFF),
    main: Color(0xFF167DC6),
    hover: Color(0xFF165686),
    active: Color(0xFF165686),
    disabled: Color(0xFF7EC9FF),
    click: Color(0xFF0B4377),
    secondary: (
      background: Color(0xFFF2F4F5),
      text: Color(0xFF454545),
    ),
  ),
  background: (
    black: Color(0xFF1A2022),
    darkGrey: Color(0xFF343839),
    gray: Color(0xFFF5F5F5),
    lightGray: Color(0xFFFAFAFA),
    white: Color(0xFFFFFFFF),
  ),
  text: (
    primary: Color(0xFFFFFFFF),
    black: Color(0xFF0A121A),
    darkGrey: Color(0xFF5C6068),
    grey: Color(0xFF757575),
    lightGray: Color(0xFFD0D1DA),
    link: Color(0xFF167DC6),
    primaryLight: Color(0xFF7EC9FF)
  ),
  icon: (
    primary: Color(0xFF167DC6),
    white: Color(0xFFFFFFFF),
    grey: Color(0xFF757575),
  ),
  input: (
    border: Color(0xFFE1E2E9),
    white: Color(0xFFFFFFFF),
  ),
  link: (
    selected: (
      icon: Color(0xFF757575),
      text: Color(0xFF757575),
      background: Color(0xFFEAF7FF),
      border: Color(0xFF7BCEFF),
    ),
  ),
  tabbar: (
    background: Color(0xFFFFFFFF),
    border: Color(0xFFFFFFFF),
    text: Color(0xFF484C52),
    icon: Color(0xFF484C52),
    selected: (
      background: Color(0xFFEAF7FF),
      border: Color(0xFF7BCEFF),
      text: Color(0xFF02578A),
      icon: Color(0xFF02578A),
    ),
  ),
  carousel: (
    date: Color(0xFFFFFFFF),
    title: Color(0xFFFFFFFF),
  ),
  card: (
    title: Color(0xFFFFFFFF),
    description: Color(0xFFFFFFFF),
    background: Color(0xFF171F43),
    border: Color(0xFF00395E),
    shadow: Color(0x19000000),
  ),
  chip: (
    background: Color(0xFFF2F4F5),
    border: Color(0xFFF2F4F5),
    text: Color(0xFF454545),
    selected: (
      background: Color(0xFFEAF7FF),
      border: Color(0xFF7BCEFF),
      text: Color(0xFF005086),
    )
  ),
  menulist: (
    background: Color(0xFFF1F1F6),
    item: (
      background: Colors.transparent,
      icon: Color(0xFF484C52),
      text: Color(0xFF484C52),
      selected: (
        background: Color(0xFF005086),
        icon: Color(0xFFFFFFFF),
        text: Color(0xFFFFFFFF),
      )
    )
  ),
);
