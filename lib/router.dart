
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_project/screens/home_page_screen/bloc/homepage_bloc.dart';
import 'package:sample_project/screens/home_page_screen/home_page.dart';
import 'package:sample_project/screens/login_screen/bloc/loginscreen_bloc.dart';
import 'package:sample_project/screens/login_screen/login_screen.dart';


import 'authentication/bloc/authentication_bloc.dart';


class AppRoutes {
  static const loginScreen = 'login_screen';
  static const homePageScreen = 'home_page_screen';
}

// ignore: missing_return
Route<dynamic> getRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.loginScreen:
      return _buildLoginScreen(settings);
    case AppRoutes.homePageScreen:
      return _buildHomePage(settings);
  }
   return _buildLoginScreen(settings);
}


// Route<dynamic> _buildLoginScreen() {
//   return MaterialPageRoute(
//     builder: (context) => addAuthBloc(context, PageBuilder.buildLoginScreen()),
//   );
// }
Route<dynamic> _buildLoginScreen(RouteSettings settings) {
  return MaterialPageRoute(builder: (context) {
    final AuthenticationBloc authBloc =
        BlocProvider.of<AuthenticationBloc>(context);
    return addAuthBloc(context, PageBuilder.buildLoginPage(authBloc));
  });
}

Route<dynamic> _buildHomePage(RouteSettings settings) {
  return MaterialPageRoute(builder: (context) {
    final AuthenticationBloc authBloc =
        BlocProvider.of<AuthenticationBloc>(context);
    return addAuthBloc(context, PageBuilder.buildHomePage(authBloc));
  });
}

class PageBuilder {
  // Prefer (✔️) - SplashScreen Screen
  // static Widget buildSplashScreen() {
  //   AuthenticationBloc authBloc;
  //   return BlocProvider(
  //     create: (context) {
  //       authBloc = BlocProvider.of<AuthenticationBloc>(context);
  //     },
  //     child: SplashScreen(authBloc),
  //   );
  // }

  //BottomNavBar(authBloc);
  static Widget buildHomePage(AuthenticationBloc authBloc) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomepageBloc>(
          create: (BuildContext context) {
            return HomepageBloc()..add(HomePageIntialEvent());
          },
        ),
      ],
      child: const HomePage(),
    );
  }
  static Widget buildLoginPage(AuthenticationBloc authBloc) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginscreenBloc>(
          create: (BuildContext context) {
            return LoginscreenBloc()..add(LoginScreenIntialEvent());
          },
        ),
      ],
      child: const LoginScreen(),
    );
    
  }
  
}


Widget addAuthBloc(BuildContext context, Widget widget) {
  return BlocListener(
    bloc: BlocProvider.of<AuthenticationBloc>(context),
    listener: (context, state) {
      if (state is AuthenticationAuthenticated) {
        while (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
        Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
        
      }

      
    },
    child: BlocBuilder(
      bloc: BlocProvider.of<AuthenticationBloc>(context),
      builder: (context, state) {
        return widget;
      },
    ),
  );
  
}