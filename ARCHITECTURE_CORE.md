# Документация по core-архитектуре

## 1) Общий подход

Проект построен на принципах Clean Architecture и feature-first структуре:

- `common` — core-инфраструктура (DI, роутер, network, логирование, базовые модели/ошибки).
- `features/news` — вертикальный срез `data/domain/presentation`.
- `features/auth` — вертикальный срез `data/domain/presentation` с авторизацией.

Направление зависимостей:

- `presentation` -> `domain` -> `data` -> external (`dio`, API).
- `common` не зависит от feature presentation и переиспользуется во всех фичах.

## 2) Схема модулей и зависимостей

```text
main.dart
  -> configureDependencies() [injectable + get_it]
  -> runZonedGuarded
  -> App

App
  -> AppRouter (auto_route)
  -> AuthBloc (global provider)

AppRouter
  -> LoginRoute (/login, initial)
  -> ProfileRoute (/profile, guarded)
  -> NewsWrapperRoute (/news) -> NewsRoute
  -> AuthGuard(SessionService)

AuthBloc
  -> GetAuthStatusUseCase
  -> SignInUseCase(login, password)
  -> SignOutUseCase
  -> AuthBehavior
  -> AuthService

AuthService (implements AuthBehavior)
  -> SessionService
  -> AppLogger
  -> hardcoded credentials (test / 123)

NewsBloc
  -> GetNewsUseCase
  -> AppLogger

GetNewsUseCase
  -> GetNewsBehavior

NewsService (implements GetNewsBehavior)
  -> NewsSource (retrofit + dio)
  -> DioExceptionMapper

DioModule
  -> Dio + InterceptorsWrapper
  -> AppLogger (request/response/error logging)
```

## 3) DI-контейнер

Стек:

- `get_it` — runtime container.
- `injectable` — генерация регистраций в `injector.config.dart`.

Ключевые core-сервисы:

- `SessionService` (`@singleton`) — хранение auth-сессии.
- `ConsoleAppLogger` (`@LazySingleton(as: AppLogger)`) — фасад логирования.
- `Talker` (`@lazySingleton`) — backend логирования.
- `SingletonProbeService` / `FactoryProbeService` — проверка жизненных циклов DI.

Проверка жизненных циклов:

- `test/di_lifecycle_test.dart`
  - singleton возвращает один и тот же инстанс.
  - factory возвращает новый инстанс.
  - core-сервисы корректно резолвятся из DI.

## 4) State management

State management: `flutter_bloc`.

### Auth-сценарий

- `AuthBloc` + `AuthEvent` + `AuthState/AuthStatus` (`freezed`).
- Слои:
  - `domain`: `AuthBehavior`, `GetAuthStatusUseCase`, `SignInUseCase`, `SignOutUseCase`.
  - `data`: `AuthService`.
  - `presentation`: `AuthBloc`, `LoginScreen`, `ProfileScreen`.
- Логика входа:
  - `login=test` и `password=123` -> `authorized`.
  - другие значения -> `unauthorized` + `errorMessage`.

Проверка:

- `test/auth_bloc_test.dart`:
  - успешная авторизация по валидным данным;
  - ошибка авторизации по невалидным данным;
  - проверка логирования business-событий.

### News-сценарий

- `NewsBloc` + `NewsState` (`freezed`).
- Состояния: `initial/loading/failure/successLoaded`.
- При ошибке поддержан повторный запрос (retry) из UI.

## 5) Навигация, deep link и guard

Навигация на `auto_route`.

Маршруты:

- `/login` -> `LoginScreen` (стартовый маршрут).
- `/profile` -> `ProfileScreen` (с `AuthGuard`).
- `/news` -> `NewsWrapperRoute` -> дочерний `NewsRoute`.

Guard:

- если пользователь авторизован (`SessionService.isAuthorized == true`) — пропускает.
- иначе редирект на `LoginRoute`.

Deep link:

- поддерживаются прямые переходы на настроенные пути (`/profile`, `/news`) через `MaterialApp.router`.

## 6) Логирование (Talker)

Core-контракт:

- `AppLogger` — единая абстракция логирования для всех слоев.

Реализация:

- `ConsoleAppLogger` на базе `Talker`.

Что логируется:

- бизнес-события (`user_sign_in`, `user_sign_out`, `news_fetch_*`);
- глобальные необработанные ошибки в `main.dart` (`runZonedGuarded`);
- сетевые события из `Dio` interceptor:
  - `network_request` (method/url/headers/query/body),
  - `network_response` (method/url/status/responseBody),
  - `network_error` (request params + response + тип/текст ошибки).

Формат:

- payload выводится структурированно, многострочно, с обрезкой слишком длинных значений.

## 7) Code generation

Используемые генераторы:

- `freezed` — immutable state-модели.
- `json_serializable` — DTO parsing.
- `injectable_generator` — DI graph.
- `auto_route_generator` — route classes.
- `retrofit_generator` — API source generation.

Команда:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

Генерируемые артефакты:

- `injector.config.dart`
- `app_router.gr.dart`
- `*.freezed.dart`
- `*.g.dart`
- `*.gm.dart`

## 8) Быстрая проверка проекта

```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter test
flutter run
```

## 9) Демонстрация для грейдинга

1. Открыть `LoginScreen`, ввести:
   - `test / 123` -> успешный вход и переход на `News`.
   - неверные данные -> Snackbar с ошибкой.
2. Показать guard:
   - попытка перейти на `/profile` без авторизации ведет на `/login`.
3. Показать сетевое логирование:
   - запрос новостей -> в логах видны request/response;
   - при ошибке -> `network_error` с параметрами запроса и response.
4. Показать прохождение тестов:
   - `flutter test`.
