# Second Milestone

## What was the original goal of your project?

(Answer here in about a Tweet or less.)

## How have the goals of your project changed?

(Answer here. This should probably be about two to four sentences.)

## What is a significant thing that you learned while building this project?

(Answer here as if you were explaining this topic to a classmate who has never seen it before. This should probably be about three to five sentences.)

*Example (delete me):* To build this project I had to learn how to use the UIPickerView, a UI element that lets the user scroll through items in a list and select one at a time. This required learning how to use delegates, which is when one class instance is used to dictate the behavior of a different class instance. I also had to figure out how to respond when an item is selected, and how to determine the currently selected item at any other point in time.

## Describe an unexpected challenge that came up during this project, and how you overcame it.

(Answer here. This should probably be about two to four sentences.)

## Knowing what you know now, if you were to rebuild this project completely from scratch, what would you do differently, and why?

(Answer here. This should probably be about two to four sentences.)

*Example (delete me):* I would store the Connect Four game state in a different way that would make it easier to determine which cells are adjacent to each other, and in which direction. I made the decision early on to have Column objects that didn't really know about each other; each Column didn't know whether it was the first, second, or third column or whatever, and didn't know whether any others were the first, second, third, etc. It would have been a lot easier and cleaner if I had a method on each Cell that I could use to get the Cell that is adjacent to it in any given direction, something like `Cell.getNeighbor(inDirection:) -> Cell?`.
