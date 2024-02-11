import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const NavBarPage() : const Auth2Widget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const NavBarPage() : const Auth2Widget(),
          routes: [
            FFRoute(
              name: 'Workout1',
              path: 'workout1',
              builder: (context, params) => const Workout1Widget(),
            ),
            FFRoute(
              name: 'Workout2',
              path: 'workout2',
              builder: (context, params) => const Workout2Widget(),
            ),
            FFRoute(
              name: 'Workout4',
              path: 'workout4',
              builder: (context, params) => const Workout4Widget(),
            ),
            FFRoute(
              name: 'PROFILE',
              path: 'profile',
              builder: (context, params) => const ProfileWidget(),
            ),
            FFRoute(
              name: 'FAVORITE',
              path: 'favorite',
              asyncParams: {
                'userfavouriteworkouts':
                    getDoc(['users', 'workouts'], WorkoutsRecord.fromSnapshot),
              },
              builder: (context, params) => params.isEmpty
                  ? const NavBarPage(initialPage: 'FAVORITE')
                  : FavoriteWidget(
                      userfavouriteworkouts: params.getParam(
                          'userfavouriteworkouts', ParamType.Document),
                    ),
            ),
            FFRoute(
              name: 'Pushup',
              path: 'pushup',
              builder: (context, params) => const PushupWidget(),
            ),
            FFRoute(
              name: 'Workout3',
              path: 'workout3',
              builder: (context, params) => const Workout3Widget(),
            ),
            FFRoute(
              name: 'Squat',
              path: 'squat',
              builder: (context, params) => const SquatWidget(),
            ),
            FFRoute(
              name: 'Gymworkout',
              path: 'gymworkout',
              builder: (context, params) => const GymworkoutWidget(),
            ),
            FFRoute(
              name: 'Zoro',
              path: 'zoro',
              builder: (context, params) => const ZoroWidget(),
            ),
            FFRoute(
              name: 'ACTIVITY',
              path: 'activity',
              builder: (context, params) => params.isEmpty
                  ? const NavBarPage(initialPage: 'ACTIVITY')
                  : const ActivityWidget(),
            ),
            FFRoute(
              name: 'GOAL',
              path: 'goal',
              builder: (context, params) => const GoalWidget(),
            ),
            FFRoute(
              name: 'HomePage',
              path: 'homePage',
              builder: (context, params) => params.isEmpty
                  ? const NavBarPage(initialPage: 'HomePage')
                  : const HomePageWidget(),
            ),
            FFRoute(
              name: 'number1',
              path: 'number1',
              builder: (context, params) => const Number1Widget(),
            ),
            FFRoute(
              name: 'number3',
              path: 'number3',
              builder: (context, params) => const Number3Widget(),
            ),
            FFRoute(
              name: 'number2',
              path: 'number2',
              builder: (context, params) => const Number2Widget(),
            ),
            FFRoute(
              name: 'Auth2',
              path: 'auth2',
              builder: (context, params) => const Auth2Widget(),
            ),
            FFRoute(
              name: 'frogotpas',
              path: 'frogotpas',
              builder: (context, params) => const FrogotpasWidget(),
            ),
            FFRoute(
              name: 'Editprof',
              path: 'editprof',
              builder: (context, params) => const EditprofWidget(),
            ),
            FFRoute(
              name: 'profilev2',
              path: 'profilev2',
              builder: (context, params) => params.isEmpty
                  ? const NavBarPage(initialPage: 'profilev2')
                  : const Profilev2Widget(),
            ),
            FFRoute(
              name: 'Settings1Notifications',
              path: 'settings1Notifications',
              builder: (context, params) => const Settings1NotificationsWidget(),
            ),
            FFRoute(
              name: 'Legs',
              path: 'legs',
              builder: (context, params) => const LegsWidget(),
            ),
            FFRoute(
              name: 'Armworkouts',
              path: 'armworkouts',
              builder: (context, params) => const ArmworkoutsWidget(),
            ),
            FFRoute(
              name: 'Chestandbackworkouts',
              path: 'chestandbackworkouts',
              builder: (context, params) => const ChestandbackworkoutsWidget(),
            ),
            FFRoute(
              name: 'Schedulevideo',
              path: 'schedulevideo',
              builder: (context, params) => const SchedulevideoWidget(),
            ),
            FFRoute(
              name: 'MUKIMUKIWokouts',
              path: 'mUKIMUKIWokouts',
              builder: (context, params) => const MUKIMUKIWokoutsWidget(),
            ),
            FFRoute(
              name: 'exercises',
              path: 'exercises',
              builder: (context, params) => const ExercisesWidget(),
            ),
            FFRoute(
              name: 'Pushuppp',
              path: 'pushuppp',
              builder: (context, params) => const PushupppWidget(),
            ),
            FFRoute(
              name: 'Chesthomeotnot',
              path: 'chesthomeotnot',
              builder: (context, params) => const ChesthomeotnotWidget(),
            ),
            FFRoute(
              name: 'BenchPress',
              path: 'benchPress',
              builder: (context, params) => const BenchPressWidget(),
            ),
            FFRoute(
              name: 'Flys',
              path: 'flys',
              builder: (context, params) => const FlysWidget(),
            ),
            FFRoute(
              name: 'Otherchest',
              path: 'otherchest',
              builder: (context, params) => const OtherchestWidget(),
            ),
            FFRoute(
              name: 'ChestInterrGym',
              path: 'chestInterrGym',
              builder: (context, params) => const ChestInterrGymWidget(),
            ),
            FFRoute(
              name: 'OtherchestCopy',
              path: 'otherchestCopy',
              builder: (context, params) => const OtherchestCopyWidget(),
            ),
            FFRoute(
              name: 'ChestBeginnerGymCopy',
              path: 'chestBeginnerGymCopy',
              builder: (context, params) => const ChestBeginnerGymCopyWidget(),
            ),
            FFRoute(
              name: 'HomeBeginner',
              path: 'homeBeginner',
              builder: (context, params) => const HomeBeginnerWidget(),
            ),
            FFRoute(
              name: 'Advancedchest',
              path: 'advancedchest',
              builder: (context, params) => const AdvancedchestWidget(),
            ),
            FFRoute(
              name: 'HomeInter',
              path: 'homeInter',
              builder: (context, params) => const HomeInterWidget(),
            ),
            FFRoute(
              name: 'PushupInter',
              path: 'pushupInter',
              builder: (context, params) => const PushupInterWidget(),
            ),
            FFRoute(
              name: 'PressesInteer',
              path: 'pressesInteer',
              builder: (context, params) => const PressesInteerWidget(),
            ),
            FFRoute(
              name: 'RestInter',
              path: 'restInter',
              builder: (context, params) => const RestInterWidget(),
            ),
            FFRoute(
              name: 'OtherchestCopyCopyCopy',
              path: 'otherchestCopyCopyCopy',
              builder: (context, params) => const OtherchestCopyCopyCopyWidget(),
            ),
            FFRoute(
              name: 'AdvancedatHome',
              path: 'advancedatHome',
              builder: (context, params) => const AdvancedatHomeWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/auth2';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.black,
                  child: Image.asset(
                    'assets/images/loading.gif',
                    fit: BoxFit.contain,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
