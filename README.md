# WurstScript Docker Image

Base wurtscript docker image with grill.
Grill is the wurst package manager and is invoked via the `grill` command.

## Update Wurst

If you're using this image to build a project and want the latest compiler, run `grill install wurstscript` before building your project.
Otherwise the version packaged in this image will be used.

## Installing a Project

To install a project, navigate to the root folder and run `grill install`.

## Compiling a project

To compile and run your project's unit tests, use `grill test`.

## Building a project

To generate an output map, use `grill build <input_map>`.
This will build the w3x into the `_build` folder, according to `wurst.build` specifications.

