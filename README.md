# Printable Modular Robot (PMR) OpenSCAD files
This repository contains the 3D models of the PMR in *.scad and *.stl file format.

## How-to create modified STL files 
The model description files can be modified and rendered to STL file format by using the [OpenSCAD](http://www.openscad.org) system.

## Structure of the files
In the `./STL/` folder there is the current version of the robot in three different STL-files, ready for printing.

There is one top-level file `fullModule.scad` that can be used to create all three parts that are neccessary to build one robot. It is prepared for rendering all parts into one STL file, allowing for printing a whole robot at once. 

The subfolder `./nutsnbolts/` contains a third party library for generating nutcatches and screws used in the design of the robot.

In `./parts/` there are the description files of the three main components of the robot. These are `arduinoMount.scad`, `servoMount.scad` and `batteryAddOn.scad`. These components are composed of parts mainly described in the `./parts/include/` folder. There are many models of components that are only used for substraction to create special slots for hardware like servos and Arduino boards. To change the hardware components of the robot these slots should also be changed by f.e. changing the model of the servo motor. They are used for substraction with Constructive Solid Geometry (CSG).
