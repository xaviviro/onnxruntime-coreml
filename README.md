# [ONNX Runtime](https://github.com/microsoft/onnxruntime) for Apple M1/M2/ARM64 with CoreML support [![PyPI](https://img.shields.io/pypi/v/onnxruntime-coreml)](https://pypi.org/project/onnxruntime-coreml/)
ONNX Runtime prebuilt wheels for Apple Silicon (M1 / M2 / ARM64)

Based on work of @

The official [ONNX Runtime](https://pypi.org/project/onnxruntime/1.15.0/#files) now contains `arm64` binaries for MacOS as well, but they do only support the CPU backend. This version adds the **CoreML** backend with version `v1.15.0`.

## Install
To install the prebuilt packages, use the following command to install. The package is called **onnxruntime-coreml** but is a drop-in-replacement for the onnxruntime package.

```
pip install onnxruntime-coreml
```

## Build
To build the libraries yourself, please first install the following dependencies and run the build script.

```
brew install wget cmake protobuf git git-lfs
```

```
./build-macos.sh
```

The pre-built wheel packages should be in the `dist` directory.

## About
MIT License - Copyright (c) 2023 @Xaviviro