# Ollama Desktop

A UI interface for Ollama. It utilizes Ollama API on your local machine.

## About The Project

This application eases the use of ollama, instead of using the terminal, it mainly targets the non-techincal users who wants to have fun with AI without the hustle of installing it manually or using the terminal and its relativlay complex command.

You can download the latest version of the application [here](https://github.com/Hamza-Shewa/ollama_desktop/releases/download/v0.1-beta/Ollama.Desktop.zip)

## Installation Steps:

- unzip the file.
- navigate to the extracted directory.
- launch <ins>ollama_desktop.exe</ins>.

## Manually Build EXE File:

- install flutter from [here](https://docs.flutter.dev/get-started/install)
- navigate to your project directory, make sure you're in root directory where the pubspec.yaml file is located.
- open the terminal in the directory, if you're using windows 11 you can easly right click inside the directory and click open in terminal.
- run the following commands:
  - `flutter pub get`
  - `flutter build windows --release`
- now the terminal will start building your **.EXE** file, once it's done it will return the path of the EXE file for you.

**Note** if you want to copy the project, make sure to copy the whole **Release** folder, as the EXE file depends on the **Dll** files along-side the **data** folder.
