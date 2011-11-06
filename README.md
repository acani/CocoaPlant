Cocoa Plant
==========

[Merriam-Webster defines plant][1] as:

1 a : a young tree, vine, shrub, or herb planted or suitable for planting

and the [verb to plant][2] as:

1 a : to put or set in the ground for growth <plant seeds>


Chief Definite Aim
------------------

In that vein, the aim of Cocoa Plant is to grow the Cocoa frameworks & libraries
by adding useful classes, categories, and methods to make Cocoa even better.


Summary
-------

Currently, Cocoa Plant is a Cocoa Touch Static Library for use with iOS apps.

Cocoa Plant consists of three parts:

1. Plantation (Foundation)
2. UIPlant (UIKit)
3. PlantData (CoreData)

### Plantation

`NSString` leading & trailing trimming methods, words method.

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

### Add Cocoa Plant as a [Git submodule][3] to the Libraries directory.

This will help you [pull in updates][4] and [make contributions][5].

    cd ~/Projects/Acani/ # sample project root directory

    # Let's make a new directory called Libraries for third-party code.
    git submodule add https://github.com/acani/CocoaPlant.git Libraries/CocoaPlant
    git submodule update --init
    git commit -am 'Add CocoaPlant as a submodule.'


### Add Cocoa Plant to Your Xcode Project.

#### Add the Libraries group to your Project.

In Xcode, select your project at the top of the Project Navigator (⌘1), and press ⌥⌘N to create a new group. Name it, e.g., "Libraries." Then, select the Libraries group, press ⌥⌘0 to Show Utilities, click the small icon to the right just below Path, choose the Libraries directory. Drag the Libraries group to move it before the Frameworks group.

#### Add CocoaPlant.xcodeproj inside the Libraries group.

With the Libraries group selected, press ⌥⌘A to add files, select `CocoaPlant.xcodeproj` in `Libraries/CocoaPlant`, and confirm that "Copy items into destination group's folder (if needed)" is unchecked, "Create groups for any added folders" is selected, and all targets are unchecked. Then, click Add.

In Terminal, review and commit your changes:

    git diff -w -M --color-words HEAD
    git commit -am 'Add Libraries group. Put CocoaPlant.xcodeproj inside.'


### Edit Your Application Project Settings.

In Xcode, select your main Xcode project at the top of the Project Navigator (⌘1), and then, select the project (or target) to which you want to add Cocoa Plant. (To allow all your targets, e.g., your tests target (along with your application target), to import Cocoa Plant, apply these settings at the project level.)

#### [Edit Build Phases][6].

Select the "Build Phases" tab.

* Under the "Target Dependencies" group, click the plus button, select CocoaPlant from the menu, and click Add.
* Under the "Link Binary With Libraries" group, click the plus button, select `libCocoaPlant.a` from the menu, and click Add.

#### [Edit Build Settings][7].

Select the "Build Settings" tab. Make sure "All" is selected in the top left of the bar under the tabs.

* Search for "Header Search Paths," click on it, hit enter, paste `Libraries/CocoaPlant`, and hit enter. (This leaves "Recursive" unchecked.)
* Do the same for "Other Linker Flags," except paste [`-ObjC -force_load ${BUILT_PRODUCTS_DIR}/libCocoaPlant.a`][8]

In Terminal, review and commit your changes:

    git diff -w -M --color-words HEAD
    git commit -am 'Edit target info, phases & settings for Cocoa Plant.'


Using Cocoa Plant in Your App
-----------------------------

* Include Cocoa Plant in any files that use it:

        #import <CocoaPlant/CocoaPlant.h>

* To [reduce build times][9], create a precompiled header file. E.g., `AppName-Prefix.pch`:

        #include "AppName-Prefix.pch"

        #ifdef __OBJC__

        // Frameworks
        #import <Foundation/Foundation.h>

        // Libraries
        #import <CocoaPlant/CocoaPlant.h>

        #endif

    Specify the path to this precompiled header in your test target's Build Settings under Prefix Header.

* Include Cocoa Plant in your app's prefix header file, e.g., `AppName-Prefix.pch`:

        #import <CocoaPlant/CocoaPlant.h>


<a name="update">Updating the Cocoa Plant iOS SDK</a>
-----------------------------------------------------

Pull in remote updates by running these commands from your project root directory:

    git submodule foreach 'git checkout master; git pull --rebase'
    git commit -am 'Update submodules to latest commit.'

You can add an alias (to `~/.gitconfig`) for the first of the two commands above:

    git config --global alias.sup "submodule foreach 'git checkout master; git pull --rebase'"

Then, to pull in remote updates, you can just do:

    git sup


<a name="contribute">Contributing to the Cocoa Plant iOS SDK</a>
----------------------------------------------------------------

* Commit your changes.

        cd ~/Projects/Acani/Libraries/CocoaPlant
        git add -A
        git commit

* Fork this repo on GitHub, add your fork as a remote, and push.

        git remote add myusername git@github.com:myuser/venmo-ios-sdk.git
        git push myusername master

* Send Cocoa Plant a pull request on GitHub.


Related
-------

* Foundation
  * [CWFoundation][10]
  * [Omni Foundation][11]
  * [GHKit][12]

* UIKit
  * [CWUIKit][13]
  * [HTFramework][14]

* Core Data
  * [MagicalRecord][15]
  * [CWCoreData][16]
  * [ObjectiveResource][17]
  * [RestKit][18]

* General
  * [iOS Frameworks][19]
  * [SSToolKit][20]
  * [Tapku][21]


  [1]: http://www.merriam-webster.com/dictionary/plant?show=1
  [2]: http://www.merriam-webster.com/dictionary/plant
  [3]: http://book.git-scm.com/5_submodules.html
  [4]: #update
  [5]: #contribute
  [6]: http://j.mp/pBH1KE
  [7]: http://j.mp/mR5Jco
  [8]: http://developer.apple.com/library/mac/#qa/qa1490/_index.html
  [9]: http://disanji.net/iOS_Doc/#documentation/DeveloperTools/Conceptual/XcodeBuildSystem/800-Reducing_Build_Times/bs_speed_up_build.html
  [10]: https://github.com/jayway/CWFoundation
  [11]: http://www.omnigroup.com/company/developer/
  [12]: http://gabriel.github.com/gh-kit/
  [13]: https://github.com/jayway/CWUIKit
  [14]: https://github.com/huddletech/HTFramework
  [15]: https://github.com/magicalpanda/MagicalRecord
  [16]: https://github.com/jayway/CWCoreData
  [17]: http://iphoneonrails.com/
  [18]: http://restkit.org/
  [19]: http://iosframeworks.com/
  [20]: http://sstoolk.it/
  [21]: http://tapku.com/
