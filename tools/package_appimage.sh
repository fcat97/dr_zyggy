echo 'running flutter build'
flutter build linux

echo 'removing existing pkg'
rm -rf build/linux/x64/appImage
mkdir -p build/linux/x64/appImage
cp -r build/linux/x64/release/bundle build/linux/x64/appImage/AppDir
cd build/linux/x64/appImage

echo 'generating builder.yml'
appimage-builder --generate
appimage-builder --recipe AppImageBuilder.yml