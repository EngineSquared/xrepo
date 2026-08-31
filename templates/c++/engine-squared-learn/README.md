# EngineSquared — learning track

You reached the EngineSquared learning track through the project template. The
template is the fallback path — it cannot deliver the exercises, and this
directory holds none of them.

Here is the real thing. Three commands, and you never clone the engine:

```sh
xmake addon --install github:EngineSquared/learn
xmake learn init my-engine-learning
cd my-engine-learning && xmake learn
```

Requires **xmake 3.1.1 or newer**, the version where `xmake addon` arrived. Check
yours with `xmake --version`.

## Why the template does not hold the exercises

`xmake create -t` copies a template once. Nothing reaches the copy afterwards —
not a new chapter, not a fixed hint, not the change that keeps an exercise
compiling after the engine's API moves. The addon can be updated, so the
curriculum lives there and this template only points at it.

You can delete this directory once the three commands above have run.

## Where things are

- the track, the exercises and the book: <https://github.com/EngineSquared/learn>
- the engine itself: <https://github.com/EngineSquared/EngineSquared>
- why the track is built this way: [ADR 01](https://github.com/EngineSquared/EngineSquared/blob/main/docs/decisions/01-learning-track.md)
