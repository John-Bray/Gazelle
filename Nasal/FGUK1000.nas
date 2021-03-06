var nasal_dir = getprop("/sim/fg-root") ~ "/Aircraft/Instruments-3d/FG1000/Nasal/";
io.load_nasal(nasal_dir ~ 'FG1000.nas', "fg1000");

# Create the FG1000
var fg1000system = fg1000.FG1000.getOrCreateInstance();

# Create a PFD as device 1, MFD as device 2
fg1000system.addPFD(1);
fg1000system.addMFD(2);

# Map the devices to placement objects Screen{i}, in this case Screen1 and Screen2
fg1000system.display(1);
fg1000system.display(2);

# Show the devices
fg1000system.show(1);
fg1000system.show(2);

#  Display a GUI version of device 1 at 50% scale.
#fg1000system.displayGUI(1, 0.5);

var nasal_dir = getprop("/sim/fg-root") ~ "/Aircraft/Instruments-3d/FG1000/Nasal/";
io.load_nasal(nasal_dir ~ 'Interfaces/GenericInterfaceController.nas', "fg1000");

var interfaceController = fg1000.GenericInterfaceController.getOrCreateInstance();
interfaceController.start();