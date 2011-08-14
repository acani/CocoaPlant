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


Adding CocoaPlant to Your Project
---------------------------------

1. Add CocoaPlant as a [Git submodule][2] to facilitate updates & contributions.

        cd path/to/your/project
        
        # I put third-party code in Vendor, created by the next command.
        git submodule add https://github.com/acani/CocoaPlant.git Vendor/CocoaPlant
        git submodule update --init
        git commit -am 'Add CocoaPlant as a submodule & update --init.'

  In the future, you can pull in remote updates with:

        git submodule foreach 'git pull --rebase'
        git commit -am 'Update submodules to latest commit.'

  Add an alias (to `~/.gitconfig`) for the first of the two commands above:

        git config --global alias.sup "submodule foreach 'git pull --rebase'"

  Then, you can just do:

        git sup

2. In Xcode, select your project at the top of the Project Navigator (⌘1), and press Option-Command-N to create a new group. Name it, e.g., "Vendor." Then, create a new group inside Vendor called "CocoaPlant." Finally, with the CocoaPlant group selected, press Option-Command-A to add files to your project, select `CocoaPlant.xcodeproj` in `Vendor`, and confirm that "Copy items into destination group's folder (if needed)" is unchecked, "Create groups for any added folders" is selected, and only your application target is checked. Then, click Add. In Terminal, review and commit your changes.

        git diff -w -M --color-words HEAD
        git commit -am 'Add Vendor/CocoaPlant groups & CocoaPlant project.'

3. Back in Xcode, select your main Xcode project at the top of the Project Navigator (⌘1), and then, select the target you want to add CocoaPlant to.

4. Select the "Build Phases" tab.

5. Under the "Target Dependencies" group, click the plus button, select CocoaPlant from the menu, and click Add.

6. Under the "Link Binary With Libraries" group, click the plus button, select `libCocoaPlant.a` from the menu, and click Add.

7. Choose the Build Settings tab. Make sure All in the top left of the bar under the tabs.

8. Add `Vendor/CocoaPlant` to "Library Search Path" (Leave the "Recursive" checkbox unchecked.).

9. [Add `-all_load` & `-ObjC` to "Other Linker Flags."][3]

10. Include CocoaPlant in your app's prefix header file, e.g., `AppName-Prefix.pch`:

        #import <CocoaPlant/CocoaPlant.h>


Related
-------

* Foundation
  * [CWFoundation][4]
  * [Omni Foundation][5]
  * [GHKit][6]

* UIKit
  * [CWUIKit][7]
  * [HTFramework][8]

* Core Data
  * [MagicalRecord][9]
  * [CWCoreData][10]
  * [ObjectiveResource][11]
  * [RestKit][12]

* General
  * [iOS Frameworks][13]
  * [SSToolKit][14]
  * [Tapku][15]


  [1]: http://www.merriam-webster.com/dictionary/plant
  [2]: http://book.git-scm.com/5_submodules.html
  [3]: http://developer.apple.com/library/mac/#qa/qa1490/_index.html
  [4]: https://github.com/jayway/CWFoundation
  [5]: http://www.omnigroup.com/company/developer/
  [6]: http://gabriel.github.com/gh-kit/
  [7]: https://github.com/jayway/CWUIKit
  [8]: https://github.com/huddletech/HTFramework
  [9]: https://github.com/magicalpanda/MagicalRecord
  [10]: https://github.com/jayway/CWCoreData
  [11]: http://iphoneonrails.com/
  [12]: http://restkit.org/
  [13]: http://iosframeworks.com/
  [14]: http://sstoolk.it/
  [15]: http://tapku.com/
