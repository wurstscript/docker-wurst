# WurstScript Docker Image

Base wurtscript docker image with grill.
Grill is the wurst package manager and is invoked via the `grill` command.

## Update Wurst

If you're using this image to build a project and want the latest compiler, run `grill update wurstscript` before building your project.
Otherwise the version packaged in this image will be used.

## Installing a Project

To install a project, navigate to the root folder and run `grill update`.

## Compiling a project

To compile and run your project's unit tests, use `grill test`.

## Building a project

coming soon

