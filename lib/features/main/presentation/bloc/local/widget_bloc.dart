import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../../core/colors/colors.dart';
import '../../../../../core/constant/constant.dart';
import '../../../../../core/network/local/local_storage.dart';
import '../../../domain/entities/menu_item.dart';
import '../../../domain/entities/theme_item.dart';
import '../../pages/main_pages/about_us_page.dart';
import '../../pages/main_pages/help_page.dart';
import '../../pages/main_pages/main_page.dart';
import '../../pages/main_pages/menu_page.dart';
import '../../pages/main_pages/notification_page.dart';
import '../../pages/main_pages/theme_page.dart';

part 'widget_event.dart';
part 'widget_state.dart';

class WidgetBloc extends Bloc<WidgetEvent, WidgetState> {
  int selectedPage = 2;
  Widget mainPage = const MainPage();
  MenuItem? currentItem = MenuItems.services;
  bool isShowBottomSheet = false;
  Icon bottomSheetIcon = const Icon(Icons.add,color: Colors.white,);
  bool isFloatingActionbuttonShow=true;

  WidgetBloc() : super(WidgetInitialState()) {
    on<ChangeDrwerItem>(onChangeDrawerItem);
    on<ChangeBottomNavicaitonBar>(onChangeBottomNavicationBar);
    on<ChangeTheme>(onChangeTheme);
    on<ChangeBottomSheet>(onChangeBottomSheet);
    on<AddBreadRequeset>(onAddBreadRequest);
  }

  onChangeTheme(ChangeTheme event, Emitter<WidgetState> emit) {
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

  onChangeDrawerItem(ChangeDrwerItem event, Emitter<WidgetState> emit) {
    emit(WidgetInitialState());
    switch (event.item) {
      case MenuItems.services:
        mainPage = const MainPage();
        currentItem = event.item;
        selectedPage = 2;
        break;
      case MenuItems.settings:
        selectedPage = 4;
        currentItem = event.item;
        mainPage = const MainPage();
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
      ChangeBottomNavicaitonBar event, Emitter<WidgetState> emit) {
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

  onChangeBottomSheet(ChangeBottomSheet event, Emitter<WidgetState> emit) {
    emit(WidgetInitialState());
    
    if (event.isShow) {
      isShowBottomSheet = event.isShow;
      bottomSheetIcon = const Icon(Icons.edit,color: Colors.white,);
      emit(ChangeBottomSheetState());
    } else {
      isShowBottomSheet = event.isShow;
      bottomSheetIcon = const Icon(Icons.add,color: Colors.white,);
      emit(ChangeBottomSheetState());
    }
  }

  onAddBreadRequest(AddBreadRequeset event, Emitter<WidgetState> emit){
    emit(AddBreadRequesetLoadingState());
    isFloatingActionbuttonShow = false;
    emit(AddBreadRequesetSuccessState());
  }
}
