# train_buddy

A seat finder app for Indian trains.

https://github.com/dev-abir/train_buddy/assets/58767260/f477c7cc-f8db-4b04-81b7-af8345676a1d

## How to run?

1. Make sure you have installed the flutter(flutter.dev) and android sdk. Run `flutter doctor` in the terminal, check the output, if everything seems okay, proceed to the next step.

2. Start an android emulator or prepare your physical android device and USB debugging.

3. Run `flutter run` in the project's root, to generate a debug APK and run it in the device.

4. You may also run `flutter build apk` to generate an optimized release build for the app. It will be in `<project root>/build/app/outputs/flutter-apk/app-release.apk`. Install it using file manager / ADB and test the app.

## Design decisions:

This is the most interesting part... Two major things I handled are regarding the logic flow and the division into classes and functions (basically code modularity). There are not a huge no. of cases as this is a very simple app.

### Logic:

1. Now about the logic, basically we have some seats, on searching for a particular seat the seat should be highlighted.

2. We have to store the state of all the seats somehow in the `main.dart` file (file containing the search bar). Then we can use `setState()` of `StatelessWidget` to toggle the state of a particular seat.

3. One thing we could do is to generate array of `Seat` widgets, then handover to `Compartment` widget to render them out. That's a good approach, but the problem with this is that to generate Seats array, we have to write logic like "3 berths facing towards South, then again 3 berths towards North, then the sides, also with proper labels" in a loop (we could do this in constructor). Then again we need to do some logic later when actually rendering the seats (like gap between seats, gap between rows, columns). Actually I at first went with this approach.

4. Another approach (which is currently used in the source code) is to just declare a state variable like `activeSeatNo`, which tracks the seat no. which is being searched for. Now we just need to propagate this number to `Compartment` widget, then it will be sent to `Berths` or `Side`, at last to `Seat` widget, which will compare it with its own seat no., and highlight accroding to that. It seems a simpler approach and will transfer all the rendering and seat labelling, positioning concerns to tge respective widgets. The `main.dart` file need not to be concerned about these.

## Modularity

1. This part is simple... I was thinking about both `Side` and `Berths` have things in common, they essentially just render seats with a background, `Berths` add 3 seats, `Side` for 1 seat, just use an if-else and a loop. Well, we have to add some spacing between the seats... so, add spaces in case of `Berths` and no space for `Side` (another if condition added). They have different background size (the dark blue part behind the seats) (again another if condition). There can be more such conditions if we actually implement this. In short, we can add up conditions and trickeries to satisfy the **DRY** condition, but we should also count for **simplicity** and **code readability**. So, I went with a bit of code duplication and more of readability.

## Other thoughts:

1. There was one edge case, which was related to the input and mapping it to a proper seat number. The conversion is done by `int.tryParse(value)`, which does most of the work, it eliminates -ve nos., decimals etc. The rest of the task is to see whether the number is within 1 and the total no. of seats or not.

2. Extra feature like auto-scroll has been added. Thanks to [scrollable_positioned_list](https://pub.dev/packages/scrollable_positioned_list) library.

3. More features could be added like multiple coaches, a symbol for engine, pantry maybe. Again we need to add graphics like borders and shapes to achieve that, it wasn't required, so I haven't added them.
