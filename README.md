# AnimatedFormFieldTableViewCell
The `AnimatedFormFieldTableViewCell` allows you to implement a `UITableViewCell` with an embedded `UITextField` that automatically scales the textfield's placeholder upon user interaction.

<img src="https://camo.githubusercontent.com/b149a9177c5c4448dcb15dddd7e54b9063f2aa34/687474703a2f2f692e696d6775722e636f6d2f464d6654434d542e676966">


Installation:
Grab the "AnimatedFormFieldTableViewCell.xib" and "AnimatedFormFieldTableViewCell.swift" files from the "AnimatedFormFieldTableViewCell" folder and drag them to your project".

In order to use `AnimatedFormFieldTableViewCell`, all you have to do is:

1) Register the `AnimatedFormFieldTableViewCell` nib on the ViewController on which you are implementing your UITableView for your reuse identifier.

2) Dequeue your cell on `CellForRowAtIndexPath` as a `AnimatedFormFieldTableViewCell`.

3) Change the placeholder's label text by calling `setLabelText` on the cell itself.

And you're pretty much done :). Everything should take care of itself from this point forward.

Notes:

1) In order to access the embedded `UITextField` you can simply call the cell's `cellTextField` property.

2) The `AnimatedFormFieldTableViewCell` conforms to the `UITextFieldDelegate` protocol, so if you wish to implement any of the `UITextFieldDelegate` for the cell's textField, you just need to set the `delegate` on the cell itself (and not on the textField - there's no need for that - the cell will take care of that).


3) For best results - cell height should be 60.
