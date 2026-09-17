# Running the Scientific Calculator on Mobile

## Option 1: Using Android Studio Emulator (Recommended)

1. **Open Android Studio**
   - Launch Android Studio from your Start menu

2. **Open AVD Manager**
   - Click on "More Actions" → "Virtual Device Manager" (or Tools → Device Manager)
   - Or click the device manager icon in the toolbar

3. **Create a Virtual Device**
   - Click "Create Device"
   - Select a device (e.g., Pixel 6 or Pixel 7)
   - Click "Next"

4. **Select System Image**
   - Choose a system image (e.g., "Tiramisu" API 33 or "UpsideDownCake" API 34)
   - If no images are available, click "Download" next to one
   - Click "Next" and then "Finish"

5. **Start the Emulator**
   - Click the Play button (▶) next to your created emulator
   - Wait for the emulator to boot up

6. **Run the App**
   - Once the emulator is running, go back to your terminal
   - Run: `flutter run`
   - The app will automatically detect and install on the emulator

## Option 2: Using a Physical Android Device

1. **Enable Developer Options**
   - Go to Settings → About Phone
   - Tap "Build Number" 7 times
   - Go back to Settings → Developer Options

2. **Enable USB Debugging**
   - In Developer Options, enable "USB Debugging"
   - Connect your phone to your computer via USB

3. **Authorize USB Debugging**
   - When prompted on your phone, tap "Allow USB Debugging"
   - Check "Always allow from this computer" if desired

4. **Verify Connection**
   - Run: `flutter devices`
   - Your device should appear in the list

5. **Run the App**
   - Run: `flutter run`
   - The app will install and launch on your device

## Quick Commands

```bash
# Check available devices
flutter devices

# Run on a specific device (if multiple available)
flutter run -d <device-id>

# Run on Android emulator specifically
flutter run -d android

# Build APK for manual installation
flutter build apk --release
```

## Troubleshooting

- **No devices found**: Make sure the emulator is running or your device is connected and USB debugging is enabled
- **License issues**: Run `flutter doctor --android-licenses` and accept all licenses
- **Build errors**: Run `flutter clean` then `flutter pub get` and try again




