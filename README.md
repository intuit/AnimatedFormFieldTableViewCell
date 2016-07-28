# AnimatedFormFieldTableViewCell
The `AnimatedFormFieldTableViewCell` allows you to implement a `UITableViewCell` with an embedded `UITextField` that automatically scales the textfield's placeholder upon user interaction.

<img src="https://camo.githubusercontent.com/b149a9177c5c4448dcb15dddd7e54b9063f2aa34/687474703a2f2f692e696d6775722e636f6d2f464d6654434d542e676966">

In order to use `AnimatedFormFieldTableViewCell`, all you have to do is:

1) Register the `AnimatedFormFieldTableViewCell` nib on the ViewController on which you are implementing your UITableView for your reuse identifier.

2) Dequeue your cell on `CellForRowAtIndexPath` as a `AnimatedFormFieldTableViewCell`.

3) Change the placeholder's label text by calling `setLabelText` on the cell itself.

And you're pretty much done :). Everything should take care of itself from this point forward.

Notes:

1) You can still implement `UITextFieldDelegate` the same way you would implement on a regular UITextField, you just need to define the `AnimatedFormFieldTableViewCell`'s delegate (there is no need to directly define the delegate for the embedded `UITextField`).

2) In order to access the embedded `UITextField` you can simply call the cell's `cellTextField` property.
