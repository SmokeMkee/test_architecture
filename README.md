# test_architecture

Учебный Flutter-проект для изучения core-архитектуры:

- Clean Architecture (`data/domain/presentation`)
- DI (`get_it` + `injectable`)
- State management (`flutter_bloc`)
- Навигация (`auto_route`) с guard и deep links
- Логирование (`Talker`) + централизованное network logging
- Code generation (`build_runner`, `freezed`, `json_serializable`, `injectable`, `auto_route`, `retrofit`)

## Документация

Подробная документация по архитектуре и всем реализованным сценариям:

- [`ARCHITECTURE_CORE.md`](./ARCHITECTURE_CORE.md)

## Async Lab: Future/Stream/Event Loop

В проект добавлен учебный модуль `async_lab`, который демонстрирует работу Dart-асинхронности в рамках текущей архитектуры.

### Что реализовано

- `cold` поток (single-subscription): `buildColdCounterStream()`
- `hot` поток (broadcast): `buildHotBufferedBroadcast()` с буфером для backpressure
- debounce-поиск: `buildDebounceTransformer()` + `createDebouncedSearchStream()`
- композиция данных из 3 API: `combineLatest3WithRetry()` с retry и fallback
- цепочки трансформаций:
  - `where -> map -> asyncExpand`
  - `where -> map -> asyncMap`
- lifecycle-утилиты:
  - `StreamLifecycleRegistry` для счетчиков подписок/контроллеров
  - `StreamSubscriptionScope` для централизованной отписки в `dispose`

### Схема потоков

1. UI отправляет поисковый текст в `query StreamController`.
2. Поток проходит через `debounce`, `where`, затем через `asyncMap` (вызов поиска).
3. Результаты пробрасываются в broadcast-stream для нескольких слушателей.
4. При `dispose`:
   - отменяются все `StreamSubscription`
   - закрываются все `StreamController`
   - счетчики lifecycle сходятся к нулевым утечкам.

### Event Loop: что важно помнить

- `scheduleMicrotask(...)` выполняется раньше задач из event queue.
- `Future(() {})`, `Future.delayed(Duration.zero, ...)` и `Timer.run(...)` попадают в event queue.
- Синхронный код завершает текущий стек вызовов, затем исполняются microtask, затем event queue.

Проверка порядка вынесена в тест `event loop ordering microtask runs before future and timer event queues`.

### Когда использовать single-subscription vs broadcast

- Используйте single-subscription (cold), когда:
  - важна изоляция и переиспользование источника под одного потребителя
  - подписка должна быть строго одна (например, последовательный pipeline обработки)
- Используйте broadcast (hot), когда:
  - один источник должен обслуживать несколько подписчиков
  - данные похожи на shared-события (UI + аналитика + логирование одновременно)
- Для hot-stream заранее определяйте стратегию backpressure:
  - buffer (как в модуле)
  - debounce/throttle (для высокочастотных событий, например поиск/scroll/input)

### Тесты async-модуля

- `test/async_stream_lab_test.dart`:
  - cold/hot поведение
  - debounce и граничные кейсы
  - combineLatest + retry/fallback
  - asyncExpand vs asyncMap
  - event loop ordering
- `test/async_lifecycle_leak_test.dart`:
  - контроль утечек подписок/контроллеров после `dispose`

## Запуск

```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run
```

## Тесты

```bash
flutter test
```
