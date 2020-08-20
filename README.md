# Quick Start (1.0 Compatible)

Start with one of three item kits to jump start your Factorio experience. The kit can be selected in the mod config settings. 

Small:
A few belts, burner mining drills and plates.

Medium:
Construction Robots, Personal Roboport, Assembling Machines, Electricity, Car

Big:
Lots of Belt, Poles, Assembling Machine 2's, Logistic Chest (Request/Provider), Roboports, Logistic + Construction Robots and other stuff. 
This kit also unlocks all technologies required by the logistics system.

Forked from Pasukaru's mod because the 1.0 update of Factorio broke it.

# Developers

Build with gradle.

- `gradle build` executes a build for the mod portal. Set the `version` properly or Factorio will reject the file.
- `gradle clean` cleans up after a build by deleting the generated folders
- `gradle patch` attempts to patch the mod in your `factorio_mods_dir` for easy testing. Make sure to set the mods dir variable. Make sure not to make commits with this variable set!

Make sure to set the `version` in `build.gradle` before building or Factorio will reject the file.

# License

Licensed under the MIT license.