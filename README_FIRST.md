# Fitrecipe – Hellmill (teljes projekt váz)

**Használat (biztos működő út):**
1) Hozz létre egy friss Flutter projektet:
   ```bash
   flutter create fitrecipe_hellmill
   ```
2) Másold **ennek a ZIP-nek** a tartalmát a létrejött mappára **rá** (felülírva `lib/`-et és a `pubspec.yaml`-t).
3) Android Studio: *File > Sync Gradle* → majd:
   ```bash
   flutter pub get
   flutter run
   ```

**Build parancsok:**
```bash
flutter build apk --flavor lite -t lib/main_lite.dart --release --split-per-abi
flutter build apk --flavor pro  -t lib/main_pro.dart  --release --split-per-abi
```

**Megjegyzés:** A csomag tartalmaz egy minimál android gradle készletet is (`android/`), de a legstabilabb megoldás az, ha az általad létrehozott projekt `android/` mappáját használod, és ebből csak a beállításokat viszed át.
