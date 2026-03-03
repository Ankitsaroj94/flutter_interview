#!/bin/bash

# Activate fvm if not already activated
dart pub global activate fvm

# Clean the project
fvm flutter clean

# Get dependencies
fvm flutter pub get

# Generate code using build_runner
fvm flutter pub run build_runner build --delete-conflicting-outputs

echo "Project cleaned and rebuilt successfully!"
