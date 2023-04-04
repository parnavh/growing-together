
# Growing Together

---Intro---

## Getting Started

This project is a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## To Run the Code

Ensure that you have Dart & Flutter installed & your choice of IDE correctly configured.

Clone the repository using:

    git clone https://github.com/parnavh/growing-together.git

Switch to the branch `app`

    flutter pub get
    flutter run --no-sound-null-safety

- We are using the option `--no-sound-null-safety` as some the packages used in this app are not compatible with null safety (like: googleapis, etc)
- Further note that the integrated chatbot will not run as the keys used to integrate it are protected.
	- To integrate your own chatbot into the code you can read more [here](https://pub.dev/packages/dialog_flowtter)
	- Or use the apk to try out our chatbot

## To Run the Demo apk on you Device
Simply download the apk linked [here](https://github.com/parnavh/growing-together.git)
