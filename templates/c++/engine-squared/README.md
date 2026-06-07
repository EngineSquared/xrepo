# ${TARGET_NAME}

This project is using [Engine Squared](https://github.com/EngineSquared/EngineSquared).
<!-- Feel free to enhance this documentation -->

## 📑 <samp>Requirements</samp>

### 🔧 <samp>Dependencies</samp>

- [xmake](https://xmake.io/#/)

## ⚡ <samp>Usage</samp>

### 🔧 <samp>Setup</samp>

Start by cloning this repository.

<!-- You can insert a code example to clone this project like
```sh
git clone https://github.com/EngineSquared/EngineSquared.git
cd EngineSquared
```
-->

### 👷 <samp>Building</samp>

```sh
xmake build -y ${TARGET_NAME}
```

### Running

```sh
xmake run ${TARGET_NAME}
```

## Testing & quality

The project is tested with **GoogleTest**: every source file in `src/` has a
mirrored test target in `tests/`.

```sh
xmake test                  # run the full test suite
xmake format -c             # check formatting (clang-format)
xmake check clang.tidy      # static analysis (clang-tidy)
xmake check_leaks           # memory leak detection (macOS)
```

The GitHub Actions CI ([`.github/workflows/ci.yml`](.github/workflows/ci.yml))
runs on both Linux and macOS: repository cleanliness check, `clang-format`,
`clang-tidy`, multi-platform build, tests, coverage (gcovr) and memory leak
detection.

## Architecture

The code follows a strict **ECS** organization:

- **Components** (`src/game/component/`) — pure data attached to entities:
  `Health`, `Armor`, `Stat`, `Ammo`, `Damage`, `TextureHandle`…
- **Systems** (`src/game/system/`) — stateless logic operating on components:
  `ComputeDamage`, `ApplyDamage`, `AmmoInventory`.

Systems are registered on Engine²'s scheduler (`Startup`, `Update`) from
[`src/main.cpp`](src/main.cpp).

