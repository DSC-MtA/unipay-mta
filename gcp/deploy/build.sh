#!/bin/bash
# This builds the app for web by first enabling web and performing fixes
# as needed.

flutter config --enable-web
flutter doctor
flutter build web
