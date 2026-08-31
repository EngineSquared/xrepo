# xrepo

How to use this repository:

## Save repository

```sh
xrepo add-repo engine-squared-xmake-repo https://github.com/EngineSquared/xrepo
```

## Usage

### Templates

A project using the engine:

```sh
xmake create -l c++ -t engine-squared YOUR_PROJECT_NAME
```

A starting point for the [learning track](https://github.com/EngineSquared/learn).
This one is a fallback: the track itself is an xmake addon, and the generated
project only carries the commands that install it, because a template cannot be
updated after it has been generated.

```sh
xmake create -l c++ -t engine-squared-learn YOUR_PROJECT_NAME
```
