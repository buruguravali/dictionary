#  iOS App using Clean Architecture and MVVM C &nbsp;

iOS Project implemented with Clean Layered Architecture with MVVMC in presentation layer .


## Layers
* **Domain Layer** = Entities + Use Cases + Repositories Interfaces
* **Data Repositories Layer** = Repositories Implementations + API (Network) + Persistence DB
* **Presentation Layer (MVVMC)** = ViewModels + Views + Coordinators 

### Dependency Direction



## Includes

* Unit Tests for Use Cases(Domain Layer), ViewModels(Presentation Layer), NetworkService(Repositry and Network Layer)
* Localization 
* All UI is created programatically using UIKIT
* Using Combine for data bidning 
* Used Async Awiat for concurrency . 



## Requirements
* Xcode Version 13.0 +  Swift 5.0+

