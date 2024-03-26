import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sakan/features/main/domain/entities/menu_item.dart';
import 'package:sakan/features/main/presentation/pages/about_us_page.dart';
import 'package:sakan/features/main/presentation/pages/help_page.dart';
import 'package:sakan/features/main/presentation/pages/main_page.dart';
import 'package:sakan/features/main/presentation/pages/menu_page.dart';
import 'package:sakan/features/main/presentation/pages/notification_page.dart';

part 'widget_event.dart';
part 'widget_state.dart';

class WidgetBloc extends Bloc<WidgetEvent, WidgetState> {
  int selectedPage = 2;
  Widget mainPage = const MainPage();
  MenuItem currentItem = MenuItems.notification;
  WidgetBloc() : super(WidgetInitial()) {
    on<ChangeDrwerItem>(onChangeDrawerItem);
    on<ChangeBottomNavicaitonBar>(onChangeBottomNavicationBar);
  }
  onChangeDrawerItem(ChangeDrwerItem event, Emitter<WidgetState> emit) {
    emit(WidgetInitial());
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
    emit(ChangeSelectedItem());
  }

  onChangeBottomNavicationBar(
      ChangeBottomNavicaitonBar event, Emitter<WidgetState> emit) {
    emit(WidgetInitial());
    selectedPage = event.selectedPage;
    emit(ChangeSelectedItem());
  }
}
