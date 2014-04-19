# TCCopyableLabel

TCCopyableLabel is a subclass of `UILabel` that allow a user to copy the label's text to the clipboard, just like a regular text input.

Inspired from [Mattt Thompson](http://mattt.me/)

- Compatibale with Interface Builder.
- Custom string to be copied in the clipboard instead of the label's text (perform formatting to make your user's life easier)
- Long press duration is customizable.
- 

## Documentation :books:

Browse the documentation on [Cocoadocs](http://cocoadocs.org/docsets/TCCopyableLabel) or add it directly to Xcode by [downloading]()) the docset and placing it into `~/Library/Developer/Shared/Documentation/DocSets/`. (or use the great [Dash](http://kapeli.com/dash))

## Installation 

### Cocoapod

Add the following to your Podfile and run `$ pod install`:

```ruby
pod 'TCCopyableLabel'
```

If you don't have CocoaPods installed or integrated into your project, you can learn how to do so [here](http://cocoapods.org).

### Static files

Copy/paste the `TCCopyableLabel` class in your project.

## Examples

Instanciate it as you would do with a regular `UILabel`:



In Interface Builder don't forget to add `TCCopyableLabel` in the class field:



If you wish to perform something once a particular label has been copied, you can do so using the `TCCopyableLabelDelegate` or the `copiedBlock` block property:

```
 TCCopyableLabel *copiableLabel1 = [[TCCopyableLabel alloc] initWithFrame:frame delegate:self];

TCCopyableLabel *copyableLabel2 = [[TCCopyableLabel alloc] initWithFrame:frame  copiedBlock:^(NSString *copiedString) {
  // do stuff        
}];
```

## Changelog

