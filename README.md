### Assignment 7
1. A widget tree is a hierarchical, tree-like structure of nested UI elements (widgets) that defines a user interface's layout, appearance, and behavior. It is the logical representation of all the UIs widgets. 

2. MyApp is a StatelessWidget that acts as the root of my application. MyHomePage is a StatelessWidget that will hold fullname, npm, class, and menu items. Infocard is a StatelessWidget that is a reusable card that shows title and content. ItemCard is a StatelessWidget that acts as a button.

3. MaterialApp is a convenience widget that wraps together everything an app following Material Design needs. It’s the root widget because all of these designs must be accesible by every descendant. Placing it at the root means every screen automatically inherits the same theme, navigation, and configuration.

4.  StatefulWidget is dynamic, it can change its appearance or behavior while the app is running. StatelessWidget is static, its configuration
and appearance never change after being built. 
StatelessWidget is ideal for displaying static information like text, icons, or labels that doesn't depend on user input or data updates.
StatefulWidget is useful for interactive components like forms, sliders, or buttons that respond to user input.

5. BuildContext is a handle to a widget’s location in the widget tree. Each widget gets its own context, which knows its ancestors. It allows a widget look up the tree to find information or services provided by ancestors.

6. Hot reload loads code changes into the VM and re-builds the widget tree, preserving the app state; it doesn’t rerun main() or initState()
Hot restart loads code changes into the VM, and restarts the Flutter app, losing the app state. You need a full restart when for example change app permissions or launcher/app configuration.

AI Disclosure:
I used AI as a learning tool for me to explore about more concepts about flutter and dart that is not covered in the tutorial or slides. For the most part this assignment is mainly copy and pasting from the tutorial. So I was able to do the assignment without using AI. I have zero understanding on what I'm doing do since I am just blindly copy pasting. So I use the AI the explain what the code was doing.


### Assignment 8
1. Navigator.push() puts a new screen on top of the stack, so the previous screen stays underneath and the user can go back to it. 
Navigator.pushReplacement() puts a new screen on top and removes the current one, so there is nothing to go back to. 
Navigator.pop() removes the top screen and reveals the one below it.

Form uses Navigator.push(). So underneath the Form there's the homepage the user can go back to

The Home option in the drawer uses Navigator.pushReplacement() to replace the current form with a new MyHomePage. So no form underneath the homepage

2. Every page is built from the same three pieces: a Scaffold that provides the page frame, an AppBar at the top, and the same LeftDrawer widget in the drawer: slot. Because the drawer is one reusable widget, the Home, Add Project, Add Experience, and Add Achievement options are identical and always available, and every page has the same layout and navigation behavior.

So for the colors I did not make it banner consistent because of design choice. They do share similarities though, like they share the same drawer, white AppBar text, outlined fields and indigo Save button.

3. The form uses a single Column of fields, each wrapped in Padding, so inputs are stacked vertically with consistent spacing.
When the screen is small or the keyboard covers part of it the user is able to scroll so every field and the Save button stay reachable. Without it, Flutter would show the yellow and black overflow error. User can't access everything

4. The GlobalKey FormState is attached to the Form widget and gives the code access to the form's state from outside like the Save button's onPressed. Each TextFormField has a validator function that checks its value and returns an error message if it's invalid, or null if it's valid. When Save is pressed, _formKey.currentState!.validate() runs every validator. If any returns a message, it appears under that field and validate() returns false, so the dialog doesn't open. If all pass, it returns true and the AlertDialog shows the values the user entered.

For example, the form rejects a name made only of spaces (" "), because the validator checks value.trim().isEmpty. It also rejects a URL like abc, because it isn't a valid http or https link. Choosing an input widget or keyboard type alone isn't enough because those only affect how the user types, not what can end up in the field. A URL keyboard still lets the user type or paste any text, a text field accepts spaces, and a user can also leave a field empty. Only the validator checks the actual value against the rules.

AI Disclosure:
I used Claude to help understand Flutter concepts (padding, navigation, widgets), debug errors (a missing return, hot reload errors), review my code against the assignment checklist, and draft suggestions for validators and the shared AppBar.
