part of app;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // set di
  await setInjections();

  runZonedGuarded(() {
    runApp(const Gallery());
  }, (_, __) {});
}
