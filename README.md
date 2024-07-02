
# Bloc Code Generator

A Dart script to generate Bloc code templates for your Flutter projects.

## Prerequisites

- Dart SDK installed on your machine.

## Usage

### Setting up Short Command

To create a shorter commands (`createBloc`) (`createModel`) for running the script:

1. **Set up an alias**:
   - Open your shell configuration file (`~/.bashrc` or `~/.zshrc`):
   
   ```bash
   nano ~/.bashrc
   # or
   nano ~/.zshrc
   ```

   - Add the following alias to the end of the file:

   ```bash
   alias createBloc="dart /Users/javohiryakubov/Desktop/bloc_code_generator/bin/generate.dart"
   alias createModel="dart /Users/javohiryakubov/Desktop/bloc_code_generator/bin/generate_json_model.dart"
   ```

   - Save the file (`Ctrl + O` in nano) and exit (`Ctrl + X` in nano).

   - Apply the changes:

   ```bash
   source ~/.bashrc
   # or
   source ~/.zshrc
   ```

### Running the Script

1. **Clone the repository**:
   ```bash
   git clone https://github.com/JavohirYakubov/bloc_code_generator.git
   cd bloc_code_generator
   ```

2. **Run the script using the short command**:
   ```bash
   createBloc BLOC_NAME
   ```
   OR
   ```bash
   createModel MODEL_NAME
   ```

   Replace `BLOC_NAME` with the desired name for your Bloc, such as `Profile`.
   Replace `MODEL_NAME` with the desired name for your model, such as `Product`.

## Example

To generate files for a `Profile` Bloc:
```bash
createBloc Profile
```
To generate files for a `ProductModel`:
```bash
createModel ProductModel
```

This will create the following files in the current directory:
- `profile_state.dart`
- `profile_bloc.dart`
- `profile_page.dart`
- `profile_event.dart`
OR
- `product_model.dart`

## License
---