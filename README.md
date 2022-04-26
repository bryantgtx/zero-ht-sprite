# test

This is a stripped down version of an app to show some odd things in SpriteWidget

Odd thing 1:  Using a row, SpriteWidgets get a height of zero, while an Image.asset in the same row gets the correct height

Odd thing 2: swap the build function for the gridview version (play_hand.dart), and SpriteWidget now gets a height.  But follow the instructions in the comments, you can see what appears to be some kind of caching where the wrong sprite is returned by SpriteWidget (or maybe spritesheet, not sure).

The rest of this file is from the original app, maybe it will help :) .

Note that the image assets in this repo are public domain, with credit to [www.kenney.nl](https://opengameart.org/content/boardgame-pack).  The spritesheet is not the one that came with his assets, though, since that was not ordered to be addressable, but was made from his original card faces, so is also in the public domain.

## Setting up the development environment and first run
Built with Flutter v2.8.1 in VSCode

1) Clone the repo locally
2) Run ```flutter pub get``` from the app root to load libraries.
3) There is a launch.json file checked in that you can use as a template.  You will want to change it locally, but not check in those changes, since everyone's will be slightly different.  Please issue the following command (you only need to do it once, but it has to be before you stage any changes)
```
git update-index --assume-unchanged .vscode/launch.json
```
4) Make those changes to launch.json that you need.  run ```flutter devices``` to list the available devices.  If you don't see any mobile devices, you will need to either start a simulator (Android Studio -> Tools -> AVD Manager or XCode -> ???), or plug in your own Android device.  Running on a local iOS device requires provisioning profiles, which have not yet been created.
5) Run it locally - if something doesn't work, update the docs!

