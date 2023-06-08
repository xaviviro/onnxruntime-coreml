#!/bin/bash

echo "building for $(python --version)"

version_tag="v1.15.0"
version_tag="main"
onnxruntime_dir="onnxruntime"

# cleanup
rm -rf $onnxruntime_dir

# download
git clone --recurse-submodules --shallow-submodules --depth 1 --branch $version_tag https://github.com/microsoft/onnxruntime.git $onnxruntime_dir

root_dir=$(pwd)
dist_dir="$root_dir/dist"

pushd "$root_dir/$onnxruntime_dir" || exit
# install dependencies
pip install -r requirements-dev.txt

# build
./build.sh --clean --config Release
#./build.sh --skip-keras-test --skip_tests --config "Release" --parallel 99 --enable_pybind --build_wheel --wheel_name_suffix=-silicon --osx_arch "arm64" --apple_deploy_target 13 --use_coreml
#./build.sh --skip-keras-test --skip_tests --config MinSizeRel --parallel 99 --enable_pybind --build_wheel --wheel_name_suffix=-silicon --use_coreml --compile_no_warning_as_error --skip_submodule_sync --cmake_extra_defines CMAKE_OSX_ARCHITECTURES=arm64
./build.sh --skip_tests --config Release --parallel --enable_pybind --build_wheel --wheel_name_suffix=-coreml --use_coreml --cmake_extra_defines CMAKE_OSX_ARCHITECTURES=arm64 CMAKE_FLAGS=-Wno-error=unused-but-set-variable --osx_arch "arm64" --arm64

# copy to dist
mkdir -p "$dist_dir"
cp -a ./build/MacOS/Release/dist/*.whl "$dist_dir"

popd || exit