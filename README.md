# SDHCALCMakeModules  ![GitHub](https://img.shields.io/github/license/SDHCAL/SDHCALCMakeModules) ![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/SDHCAL/SDHCALCMakeModules) ![GitHub repo size](https://img.shields.io/github/repo-size/SDHCAL/SDHCALCMakeModules) #
Cmake modules for SDHCAL software compilation.

## Introduction 
This depot groups all the `Cmake Modules` needed to build the `SDHCAL` softwares in a way they can be share between different depots.

## How to use these modules

### 1. Download `GetCMakeMM.cmake`
To use `CMakeMM` you have to download the latest `GetCMakeMM.cmake` https://github.com/flagarde/CMakeMM/releases and put it in a place CMake can find it.
### 2. Use `GetCMakeMM.cmake` in your `CMakeLists.txt'.
 ```cmake
	set(CMAKE_MODULE_PATH "${CMAKE_MODULE_PATH}" "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
	include(GetCMakeMM)
	cmmm(VERSION "1.0" 
       URL "https://raw.githubusercontent.com/flagarde/CMakeMM" 
       VERBOSE 
       DESTINATION "CMakeMM" 
       ALWAYS_DOWNLOAD)
 ```
 This will download `CMakeMM` version `1.0` from `https://raw.githubusercontent.com/flagarde/CMakeMM` under `CMakeMM` folder. *More options are available*
 ### 3. Tell to `CMakeMM` where find the modules list and where to save the modules
 ```cmake
 cmmm_modules_list(URL "https://raw.githubusercontent.com/SDHCAL/SDHCALCMakeModules" 
                   BRANCH master
                   FOLDER modules
                   FILENAME ModuleLists
                   DESTINATION "Modules")
 ```
 This will donwload the module list file called `ModuleLists.cmake` in folder `modules` on branch `master` of the github depot `https://raw.githubusercontent.com/SDHCAL/SDHCALCMakeModules`. 
 *More options are available*
 ### 4. Include the module you need
  ```cmake
  include(MyWonderfulModule)
  ```
  This will download the module `MyWonderfulModule.cmake` is it's not present in the `CMAKE_MODULE_PATH` folders or `Modules` folder, then include it. Otherwise it will just include it.
  
## Example
CMakeLists.txt :
```cmake
cmake_minimum_required(VERSION 3.10...3.17.2 FATAL_ERROR)
project(MySoftware 
        VERSION "0.0.1.0" 
        DESCRIPTION "MySoftware" 
        HOMEPAGE_URL "https://github.com/SDHCAL/MySoftware"
        LANGUAGES CXX)

set(CMAKE_MODULE_PATH "${CMAKE_MODULE_PATH}" "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

include(GetCMakeMM)

cmmm(VERSION "1.0" URL "https://raw.githubusercontent.com/flagarde/CMakeMM" 
     VERBOSE 
     DESTINATION "CMakeMM" 
     ALWAYS_DOWNLOAD)

cmmm_modules_list(URL "https://raw.githubusercontent.com/SDHCAL/SDHCALCMakeModules" 
                  BRANCH main
                  DESTINATION "Modules")

# Now download the modules
include(Colors)
```
## Actual module list
[in the "main" branch](https://github.com/SDHCAL/SDHCALCMakeModules/tree/main/modules)
