import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../../core/colors/colors.dart';
import '../../../../../core/constant/constant.dart';
import '../../../../../core/network/local/local_storage.dart';
import '../../../domain/entities/menu_entities.dart';
import '../../../domain/entities/theme_entities.dart';
import '../../pages/main_pages/about_us_page.dart';
import '../../pages/main_pages/help_page.dart';
import '../../pages/main_pages/main_page.dart';
import '../../pages/main_pages/menu_page.dart';
import '../../pages/main_pages/notification_page.dart';
import '../../pages/main_pages/theme_page.dart';

part 'presentation_event.dart';
part 'presentation_state.dart';

class PresentationBloc extends Bloc<PresentationEvent, PresentationState> {
  int selectedPage = 2;

  Widget mainPage = const MainPage();
  MenuEntities? currentItem = MenuItems.services;
  PresentationBloc() : super(PresentationInitial()) {
    on<ChangeDrwerItem>(onChangeDrawerItem);
    on<ChangeBottomNavicaitonBar>(onChangeBottomNavicationBar);
    on<ChangeTheme>(onChangeTheme);
  }

  onChangeTheme(ChangeTheme event, Emitter<PresentationState> emit) {
    emit(WidgetInitialState());
    for (ThemeEntities e in themes) {
      if (e == event.item) {
        event.item.isTapped = true;
        MyColors.primaryColor = HexColor(event.item.primaryColor);
        MyColors.secondaryColor = HexColor(event.item.secondaryColor);
        LocalStorage.putData(
            key: 'primaryColor', value: event.item.primaryColor);
        LocalStorage.putData(
            key: "secondaryColor", value: event.item.secondaryColor);
      } else {
        e.isTapped = false;
      }

      emit(ChangeThemeState());
    }
  }

  onChangeDrawerItem(ChangeDrwerItem event, Emitter<PresentationState> emit) {
    emit(WidgetInitialState());
    switch (event.item) {
      case MenuItems.services:
        mainPage = const MainPage();
        currentItem = event.item;
        MainPage.appKey.currentState?.tap(2);
        break;
      case MenuItems.settings:
        currentItem = event.item;
        mainPage = const MainPage();
      MainPage.appKey.currentState?.tap(4);

        break;
      case MenuItems.themes:
        currentItem = event.item;
        mainPage = const ThemePage();
        break;
      case MenuItems.notification:
        currentItem = event.item;
        mainPage = const NotificationPage();
        break;
      case MenuItems.help:
        currentItem = event.item;
        mainPage = const HelpPage();
        break;
      case MenuItems.aboutUs:
        currentItem = event.item;
        mainPage = const AboutUsPage();
        break;
    }
    emit(ChangeBottomNavicaitonBarState());
  }

  onChangeBottomNavicationBar(
      ChangeBottomNavicaitonBar event, Emitter<PresentationState> emit) {
    emit(WidgetInitialState());
    selectedPage = event.selectedPage;
    if (selectedPage == 2) {
      currentItem = MenuItems.services;
    } else if (selectedPage == 4) {
      currentItem = MenuItems.settings;
    } else {
      currentItem = null;
    }
    emit(ChangeBottomNavicaitonBarState());
  }
}
