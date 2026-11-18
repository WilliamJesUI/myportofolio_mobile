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