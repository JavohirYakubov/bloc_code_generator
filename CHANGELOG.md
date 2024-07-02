## 1.0.0
---
# Bloc Code Generator

A Dart script to generate Bloc code templates for your Flutter projects.

## Prerequisites

- Dart SDK installed on your machine.

## Usage

1. **Clone the repository**:
   ```bash
   git clone https://github.com/JavohirYakubov/bloc_code_generator.git
   cd bloc_code_generator
   ```

2. **Run the script**:
   ```bash
   dart bin/generate.dart BLOC_NAME
   ```

   Replace `BLOC_NAME` with the desired name for your Bloc, such as `Profile`.

## Example

To generate files for a `Profile` Bloc:
```bash
dart bin/generate.dart Profile
```

This will create the following files in the current directory:
- `profile_state.dart`
- `profile_bloc.dart`
- `profile_page.dart`
- `profile_event.dart`

## License
