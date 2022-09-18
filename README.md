# MovieKO
This is the MovieKO app. I'm writing this application to consolidate everything I've learned and improve my iOS development knowledge.

# Table of Contents
 - [Setup](#Setup)
 - [Dependency Management](#dependency-management)
 - [List of Frameworks](#list-of-frameworks)
 
## Setup
- Run `pod install` on terminal.
- The open MovieKO.xcworkspace and run.

## Project Architecture
The app's architecture is MVVM

## Project Structure
| Folder        | Description                                                     |
|-------------------------|-------------------------------------------------------|
|**AppDelegateServices** | Services that are dependent on AppDelegate will be defined here.|
|**DependencyInkections** | Dependency registrations will be defined here.|
|**Aplication** | Application specific classes will be defined her.|
|**Core** | Utility code that are not specific to this App will be defined here |

Structure of **Application** folder: 

| Folder        | Description                                                     |
|-------------------------|-------------------------------------------------------|
|**Network**| Anything related with remote connection and endpoints will be defined here.|
|**Modules**| Includes user faced part of the app. Mostly views.|
|**Data**| Includes all data integration classes. Also UIModels and back-end response models will be defined here.|


## Dependency Management

Cocoapods is the dependency manager for this project.

## List of Frameworks
| Dependency             | Description                                          |
|-------------------------|-------------------------------------------------------|
|**Resolver** | Dependency Injection / Service locator framework |


