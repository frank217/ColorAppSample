# How to Use the Prism App

1) Select a color from color picker
2) Choose a desired color mode to prism selected color.
3) Decide how many color User want to see
4) Get Your color mode


# SwiftUI Colour Wheel with 

A color wheel made all in SwiftUI. 

- The first main one uses `CIHueSaturationValueGradient` `CIFilter` to draw itself, then uses `RadialGradient` and `.blur` to smooth it out. Named `ColourWheel` in code.
- The second one uses SwiftUI's `AngularGradient` with all 360 hues to draw the gradient, then a `RadialGradient` and `.blur` to smooth it out. Named `NewColourWheel` in code.

If you would like to use the slider to change brightness/value, use `ColourWheel`, as `NewColourWheel` does not support setting value at this point in time.

They both interact the same and output in [Red, Green, Blue] or [Hue, Saturation].

![previewjpg](https://raw.githubusercontent.com/Priva28/SwiftUIColourWheel/master/preview.jpg)

![preview](https://raw.githubusercontent.com/Priva28/SwiftUIColourWheel/master/preview.gif)


# Color Info page 

Show RGB and Hex Information based on chosen color, colorMode, and number color User want. 

Note Number of Color may be limited base on colorMode
- e.g) Compliment only returns 2 colors and triad would return 3 colors.

Formula for deciding foregroundcolor
- L = 0.2126 * r + 0.7152 * g + 0.0722 * b //RGB are fraction value
- If L > 0.179 use #000000(Black) else use #ffffff(White)
- More inforamtion here https://stackoverflow.com/questions/3942878/how-to-decide-font-color-in-white-or-black-depending-on-background-color


