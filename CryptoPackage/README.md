# CryptoPackage

## Overview

## Architecture
I wrote a Clean-Architecture based on layers, which uses the Repository Pattern on Data layer and the MMVM Pattern on Presentation Layer.

Dependencies:
* KinFisher - library for downloading and caching images from the web
* PocketSVG - library for svg iamge

**Presentation Layer** 
MVVM Model-View-ViewModel Pattern using:
    ViewControllers

**Domain Layer** 
Holds all business logic. The domain layer starts with classes named UseCases used by Presentation Layer. 
    
    UseCases
    BussinesLogic
    
**Data** 
Repository Pattern from the base sample.

    Repository
    Others Datasources

Each layer has a DI Modoule Provider which provides an instance of available components.


## Notes: 

For timing reason I could not reach to the following points: 

* UI Test
* Improve UI & animation

## License
MIT



