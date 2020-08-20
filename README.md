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

- `gradle build` builds the mod .zip file. The `version` must match the one in `src/info.json` or Factorio will reject the file. Set it in `gradle.properties` or with `gradle build -Pversion="1.5.0"`
- `gradle clean` cleans up after a build by deleting the generated folders
- `gradle patch` attempts to patch the mod in your `factorioModsDirectory` for easy testing. Make sure to set the variable. Make sure not to make commits with this variable set in gradle.properties - you can use `gradle patch -PfactorioModsDirectory="directoryhere"` instead.

Make sure to set the `version` in `build.gradle` before building or Factorio will reject the file.

# License

Licensed under the MIT license.