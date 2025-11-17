# ``SparkComponentChip``

The Chips help users quickly recognize an important information that has been entered by them, trigger actions, make selections, or filter content.

## Overview

The component is available on **UIKit** and **SwiftUI** and requires at least **iOS 16**.

It is composed by an optional text, optional icon and optionel extra content. 
At least one of the three is required.

Even if we can put all types of view in the **extra content**, we recommend using only :
- Icon (24px\*24px)
- A Spark Badge

### Implementation

- On SwiftUI, you need to use the ``SparkChip`` View.
- On UIKit, you need to use the ``SparkUIChip`` which inherit from an UIControl.

### Rendering

With a icon
![Component rendering.](chip_with_icon.png)

With a text
![Component rendering.](chip_with_text.png)

With a text and an icon 
![Component rendering.](chip_with_text_and_icon.png)

With a text and an extra content 
![Component rendering.](chip_with_text_and_icon_and_extra_content.png)

With a icon and an extra content 
![Component rendering.](chip_with_icon_and_extra_content.png)

When selected is true 
![Component rendering.](chip_selected.png)

With disabled is true 
![Component rendering.](chip_disabled.png)

## A11y

- The large content display, by default, the text and the icon. You can override theses values.
- If you not provide a text, you must set the **accessibilityLabel**.

## Resources

- Specification on [ZeroHeight](https://zeroheight.com/1186e1705/p/17568d-chip)
- Desing on [Figma](https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=643-21226)
