CocoaPlant
==========

[Merriam-Webster defines plant][1] as:

1 a : a young tree, vine, shrub, or herb planted or suitable for planting

and the verb as:

1 a : to put or set in the ground for growth <plant seeds>


Aim
---

In that vein, the aim of CocoaPlant is to grow the Cocoa frameworks & libraries
by adding useful classes, categories, and methods to make Cocoa even better.


Summary
-------

Currently, CocoaPlant is a Cocoa Touch Static Library for use with iOS apps.

CocoaPlant consists of three parts:

1. Plantation (Foundation)
2. UIPlant (UIKit)
3. PlantData (CoreData)

### Plantation

`NSString` leading & trailing trimming methods.

    [[[NSFileManager alloc] init] URLForApplicationDirectory:NSDocumentDirectory]

### UIPlant

`UIAlertView`: `showWithTitle:`, `showWithError:`

### PlantData

Set up the Core Data stack with one method call:

    [NSManagedObjectContext contextWithStoreType:NSSQLiteStoreType error:&error]

Customize fetch requests with blocks:

    NSArray *results = [User fetchInContext:context error:&error
                                    options:^(NSFetchRequest *request) {
                                        [request setFetchLimit:1];
                                        [request setPredicate:predicate];
                                        [request setSortDescriptors:sortDescriptors];
                                        // ...
                                    }];


Project Setup
-------------

### Add CocoaPlant as a [Git submodule][2]

This will help you [pull in updates][3] and [make contributions][4].

    cd ~/Projects/Acani/ # sample project root directory

    # Let's make a new directory called Libraries for third-party code.
    git submodule add https://github.com/acani/CocoaPlant.git Libraries/CocoaPlant
    git submodule update --init
    git commit -am 'Add CocoaPlant as a submodule & update --init.'


### Add CocoaPlant to Your Xcode Project

In Xcode, select your project at the top of the Project Navigator (⌘1), and press Option-Command-N to create a new group. Name it, e.g., "Libraries." Then, with the Libraries group selected, press Option-Command-A to add files to your project, select `CocoaPlant.xcodeproj` in `Libraries/CocoaPlant/CocoaPlant`, and confirm that "Copy items into destination group's folder (if needed)" is unchecked, "Create groups for any added folders" is selected, and all targets are unchecked. Then, click Add.

In Terminal, review and commit your changes:

    git diff -w -M --color-words HEAD
    git commit -am 'Add Libraries/CocoaPlant group & CocoaPlant project.'


### Edit Your Application Target's Settings

In Xcode, select your main Xcode project at the top of the Project Navigator (⌘1), and then, select the target to which you want to add CocoaPlant.

#### [Edit Build Phases][5]

Select the "Build Phases" tab.

* Under the "Target Dependencies" group, click the plus button, select CocoaPlant from the menu, and click Add.
* Under the "Link Binary With Libraries" group, click the plus button, select `libCocoaPlant.a` from the menu, and click Add.

#### [Edit Build Settings][6]

Select the "Build Settings" tab. Make sure "All" is selected in the top left of the bar under the tabs.

* Search for "Header Search Paths," click on it, hit enter, paste `Libraries/CocoaPlant`, and hit enter. (This leaves "Recursive" unchecked.)
* Do the same for "Other Linker Flags," except paste [`-ObjC -force_load ${BUILT_PRODUCTS_DIR}/libCocoaPlant.a`][7]

In Terminal, review and commit your changes:

    git diff -w -M --color-words HEAD
    git commit -am 'Edit target info, phases & settings for CocoaPlant.'


Using CocoaPlant in Your App
-----------------------

* Include CocoaPlant in your app's prefix header file, e.g., `AppName-Prefix.pch`:

        #import <CocoaPlant/CocoaPlant.h>


<a name="update">Updating the CocoaPlant iOS SDK</a>
-----------------------------------------------

Pull in remote updates by running these commands from your project root directory:

    git submodule foreach 'git pull --rebase'
    git commit -am 'Update submodules to latest commit.'

You can add an alias (to `~/.gitconfig`) for the first of the two commands above:

    git config --global alias.sup "submodule foreach 'git pull --rebase'"

Then, to pull in remote updates, you can just do:

    git sup


<a name="contribute">Contributing to the CocoaPlant iOS SDK</a>
----------------------------------------------------------

* Commit your changes.

        cd ~/Projects/Acani/Libraries/CocoaPlant
        git add -A
        git commit

* Fork this repo on GitHub, add your fork as a remote, and push.

        git remote add myuser git@github.com:myuser/venmo-ios-sdk.git
        git push myuser master

* Send CocoaPlant a pull request on GitHub.


Related
-------

* Foundation
  * [CWFoundation][8]
  * [Omni Foundation][9]
  * [GHKit][10]

* UIKit
  * [CWUIKit][11]
  * [HTFramework][12]

* Core Data
  * [MagicalRecord][13]
  * [CWCoreData][14]
  * [ObjectiveResource][15]
  * [RestKit][16]

* General
  * [iOS Frameworks][17]
  * [SSToolKit][18]
  * [Tapku][19]


  [1]: http://www.merriam-webster.com/dictionary/plant
  [2]: http://book.git-scm.com/5_submodules.html
  [3]: #update
  [4]: #contribute
  [5]: http://j.mp/pBH1KE
  [6]: http://j.mp/mR5Jco
  [7]: http://developer.apple.com/library/mac/#qa/qa1490/_index.html
  [8]: https://github.com/jayway/CWFoundation
  [9]: http://www.omnigroup.com/company/developer/
  [10]: http://gabriel.github.com/gh-kit/
  [11]: https://github.com/jayway/CWUIKit
  [12]: https://github.com/huddletech/HTFramework
  [13]: https://github.com/magicalpanda/MagicalRecord
  [14]: https://github.com/jayway/CWCoreData
  [15]: http://iphoneonrails.com/
  [16]: http://restkit.org/
  [17]: http://iosframeworks.com/
  [18]: http://sstoolk.it/
  [19]: http://tapku.com/
