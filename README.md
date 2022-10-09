# TRS APP

## Requirements

- [Flutter](https://docs.flutter.dev/get-started/install) go to the flutter website download and installer
- [TRS Api](https://github.com/mimron/mimron_trs_api) install for Backend Api
- [Flutter & Dart VSCode Extensions](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter) (Recommended, nice to have)

## First Time Installation

Clone the repo:

```bash
git clone https://github.com/mimron/mimron_trs_app.git
cd mimron_trs_app
```

Install the dependencies:

```bash
flutter pub get
```

Set the url TRS Api Backend:

```bash
static const BASE_URL = 'http://127.0.0.1:3000/api/v1';
# inside directory /lib/helpers/constans.dart and modify BASE_URL variables (if needed)
```

Running Program:

```bash
flutter run
```
