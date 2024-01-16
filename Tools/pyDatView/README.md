# pyDatView

A crossplatform GUI to display tabulated data from files or python pandas dataframes. It's compatible Windows, Linux and MacOS, with python 3. Some of its features are: multiples plots, FFT plots, probability plots, export of figures...
The file formats supported, are: CSV files and other formats present in the [weio](http://github.com/ebranlard/weio/) library.
Additional file formats can easily be added.

![PlotScatter](https://github.com/Vialladr/Integrator-project-Ferrand-Vialle_Final/assets/146110958/b192593d-0a11-4986-9e3a-c2c0d8b684c8)

## QuickStart
For **Windows** users, an installer executable is available [here](https://github.com/ebranlard/pyDatView/releases) (look for the latest pyDatView\*.exe)

**Linux** users can use the command lines below, but first they'll need to install the package python-wxgtk\* (e.g. `python-gtk3.0`) from their distribution:
```bash
git clone https://github.com/ebranlard/pyDatView
cd pyDatView
python -m pip install --user -r requirements.txt
make                                            # will run python pyDatView.py
echo "alias pydat='make -C `pwd`'" >> ~/.bashrc
```

**MacOS** users can use a `brew`, `anaconda` or `virtualenv` version of python and pip, but the final version of python that calls the script needs to have access to the screen (for instance using `pythonw`) (see [details for MacOS](#macos-installation)).  We recommend using conda, in the base environment, for which the following commands should work:
```bash
conda install -c conda-forge wxpython            # install wxpython
git clone https://github.com/ebranlard/pyDatView -b dev
cd pyDatView
python -m pip install --user -r requirements.txt
make                         # will run ./pythonmac pyDatView.py 
# OR try
#pythonw pyDatView.py        # NOTE: using pythonw not python
echo "alias pydat='make -C `pwd`'" >> ~/.bashrc   # add an alias for quicklaunch
```
If this fails using the Mac terminal, try the zsh terminal from [VSCode](https://code.visualstudio.com) or [iterm2](https://iterm2.com/downloads.html). More information about the download, requirements and installation is provided [further down this page](#installation)


## Usage
### Launching the GUI
Windows users that used a `setup.exe` file should be able to look for `pyDatView` in the Windows menu, then launch it, and pin the program to the taskbar for easier access.  

If you cloned this repository, the main script at the root (`pyDatView.py`) is executable and will open the GUI directly. A command line interface is provided, e.g.: 
```bash
python pyDatView.py file.csv  # or pythonw pyDatView.py file.csv
```
The python package can also be used directly from python/jupyter to display one or multiple dataframe(s) (called `df1` and `df2` in the example below) or show the data present in one or several file(s). The interface is forgiving for the first argument, and can accept a list or a single value:
```python
import pydatview 
pydatview.show(dataframes=[df1,df2], names=['data1','data2'])
# OR
pydatview.show([df1,df2], names=['data1','data2'])
# OR
pydatview.show(df1)
# OR
pydatview.show(filenames=['file.csv','file2.csv'])
# OR
pydatview.show(['file.csv','file2.csv'])
# OR
pydatview.show('file.csv')
```

### Quicklaunch/Shortcut
**Windows** 
 - If you used the `setup.exe`, you will find the `pyDatView` App in the windows menu, you can launch it from there, pin it to start, pin it to the startbar, open the file location to  
 - If you used the portable version, you'll find `pyDatView.exe` at the root of the directory. You can launch it and pin it to your taskbar. You can also right click, and create a short cut to add to your desktop or start menu.
 - If you clone the repository, you can create a shortcut at the root of the repository. In explorer, right click on an empty space, select New , Shortcut. Set the shortcut as follows:
```
    "C:\PYTHON_DIR\PythonXX\pythonw.exe" "C:\INSTALL_DIR\pyDatView\pyDatView.launch.pyw"
```

**Linux** 

You can add an alias to your bashrc as follows. Navigate to the root of the pyDatView repository, and type:
```
    echo "alias pydat='python `pwd`/pyDatView.py'" >> ~/.bashrc
```
Next time you open a terminal, you can type `pydat` to launch pyDatView. 
Adapt to another terminal like `.shrc`

**MacOS** 

The procedure is the same as for linux, the small issue is that you need to find the "proper" python to call. When you run `./pythonmac` from the root of the directory, the script tries to find the right version for you and finishes by showing a line of the form: `[INFO] Using: /PATH/TO/PYTHON  `. This line gives you the path to python. Add pydat as an alias by running the line below (after adapting the `PATH/TO/PYTHON`): 
```
    echo "alias pydat='PATH/TO/PYTHON  `pwd`/pyDatView.py'" >> ~/.zshrc
```
Next time you open a terminal, you can type `pydat` to launch pyDatView. 



### File association
**Windows** 

To associate a given file type with pyDatView, follow the following steps:

1. Locate `pyDatView.exe`.  If you installed using `setup.exe` or the portable `zip`, you'll find `pyDatView.exe` at the root of the installation folder (default is `C:\Users\%USERNAME%\AppData\Local\pyDatView\`).  If you cannot find the exe, download it from [the repository](/_tools/pyDatView.exe).  If you cloned the repository, you'll find the executable in the subfolder `_tools\` of the repository.

2. Verify that the exe works. Double click on the executable to verify that it lauches pyDatView. If it doesnt, run it from a terminal and look at the outputs.

3. Add the file association. Right click on a file you want to associate pyDatView with. Select "Open With" > "More Apps" > scroll to "Look for another App on my PC" > Navigate to the location of `pyDatView.exe` mentioned above.  If this works, repeat the operation and check the box "Always use this App for his filetype".
 

### Workflow
Documentation is scarce for now, but here are some tips for using the program:
 - You can drag and drop files to the GUI directly to open them. Hold the Ctrl key to add.
 - You can open several files at once, with same or different filetypes. Upon opening multiple files, a new table appears with the list of open files.
 - To add multiple channels or data from multiple files to a plot, use `ctrl + click` or shift-click to make selections.
 - Look for the menus indicated by the "sandwich" symbol (3 horizontal bars &#2630;). These menus are also accessible with right clicks. 
 - The menus will allow you to edit tables (rename, delete, reload, merge), add or remove columns (for instance to convert a signal from one unit to another unit), or change the values displayed in the information table at the bottom. 
 - Different "actions" (e.g. filtering, binning, masking) are available in the menus `data` and `tools` located at the top of the program. 
 - The modes and fileformat drop down menus at the top can usually be kept on `auto`. If a file cannot be read, pay attention to the file extension used, and possibly select a specific file format in the dropdown menu instead of `auto`. 
 - Above the taskbar is the "Pipeline" which lists the different actions (e.g. binning, filtering, mask) that are applied to the different tables before being plotted. The pipeline actions will be reapplied on reload, and python code for them will be generated when exporting a script.
 - Different plot styling options can be found below the plot area. The button next to the "Save" icon can be used to customize the esthetics of the plot (e.g. fontsize, linewidth, legend location).
 - Live plotting can be disabled using the check box "Live plot". This is useful when manipulating large datasets, and potentially wanting to delete some columns without plotting them.
 
 

## Features
Main features:
- Plot of tabular data within a file
- Automatic detection of fileformat (based on [weio](http://github.com/ebranlard/weio/) but possibility to add more formats)
- Reload of data (e.g. on file change)
- Display of statistics
- Export figure as pdf, png, eps, svg
- Export python script
- Export data as csv, or other file formats

Different kind of plots:
- Scatter plots or line plots
- Multiple plots using sub-figures or a different colors
- Probability density function (PDF) plot
- Fast Fourier Transform (FFT) plot

Plot options:
- Logarithmic scales on x and y axis
- Scaling data ("min/max") when ranges and means are different
- Synchronization of the x-axis of the sub-figures while zooming
- Markers annotations and Measurements
- Plot styling options

Data manipulation options:
 - Remove columns in a table, add columns using a given formula, and export the table to csv
 - Mask part of the data (for instance selecting times above a certain value to remove the transient). Apply the mask temporarily, or create a new table from it
 - Filter data (e.g. moving averaging, low-pass filters)
 - Bin data
 - Change units
 - Estimate frequency and damping from a signal
 - Curve fitting
 - Extract radial data from OpenFAST input files



## Screenshots

Scatter plot (by selecting `Scatter`) and several plots on the same figure:

![PlotScatter](https://github.com/Vialladr/Integrator-project-Ferrand-Vialle_Final/assets/146110958/b192593d-0a11-4986-9e3a-c2c0d8b684c8)

<!--![OverPlot](/../screenshots/screenshots/OverPlot.png) -->

Fast Fourier Transform of the signals (by selecting `FFT`) and displaying several plots using subfigures (by selecting `Subplot`). 

![SubPlotFFT](https://github.com/Vialladr/Integrator-project-Ferrand-Vialle_Final/assets/146110958/b08c6e28-f096-456d-8e0a-1ec386de78e8)

Probability density function:

![PlotPDF](https://github.com/Vialladr/Integrator-project-Ferrand-Vialle_Final/assets/146110958/16aae291-8878-401d-a3bd-f8f51a124ad9)

Scaling all plots between 0 and 1 (by selecting `MinMax`)
![PlotMinMax](https://github.com/Vialladr/Integrator-project-Ferrand-Vialle_Final/assets/146110958/f9d49b2e-27e2-4830-9b56-b4b1842e0c36)



## Installation

### Windows installation
For Windows users, installer executables are available [here](https://github.com/ebranlard/pyDatView/releases) (look for the latest pyDatView\*.exe)

### Linux installation
The script is compatible with python 3 and relies on the following python packages: `numpy` `matplotlib`, `pandas`, `wxpython`.
To download the code and install the dependencies (with pip) run the following:
```bash
git clone https://github.com/ebranlard/pyDatView
cd pyDatView
python -m pip install --user -r requirements.txt
```
If the installation of `wxpython` fails, you may need to install the package python-wxgtk\* (e.g. `python-gtk3.0`) from your distribution. For Debian/Ubuntu systems, try:
`sudo apt-get install python-wxgtk3.0`.
For further troubleshooting you can check the [wxPython wiki page](https://wiki.wxpython.org/).

If the requirements are successfully installed you can run pyDatView by typing:
```bash
python pyDatView.py  # or pythonw pyDatView.py 
```
To easily access it later, you can add an alias to your `.bashrc` or install the pydatview module:
```bash
echo "alias pydat='python `pwd`/pyDatview.py'" >> ~/.bashrc
# or
python setup.py install
```


## MacOS installation
The installation should work with python3, with `brew` (with or without a `virtualenv`) or `anaconda`.
First, download the source code:
```bash
git clone https://github.com/ebranlard/pyDatView
cd pyDatView
```
Before installing the requirements, you need to be aware of the two following issues with MacOS:
- If you are using the native version of python, there is an incompatibility between the native version of `matplotlib` on MacOS and the version of `wxpython`. The solution is to use `virtualenv`, `brew` or `anaconda`.
- To use a GUI app, you need a python program that has access to the screen. These special python programs are in different locations. For the system-python, it's usually in `/System`, the `brew` versions are usually in `/usr/local/Cellar`, and the `anaconda` versions are usually called `python.app`.
The script `pythonmac` provided in this repository attempt to find the correct python program depending if you are in a virtual environment, in a conda environment, a system-python or a python from brew or conda. 

Different solutions are provided below depending on your preferred way of working.
For the latest Mac version, we recommend using anaconda.

### Anaconda-python version (outside a virtualenv)
The installation of anaconda sometimes replaces the system python with the anaconda version of python. You can see that by typing `which python`. Use the following:
```
python -m pip install --user -r requirements.txt # install requirements
conda install -c conda-forge wxpython            # install wxpython
pythonw pyDatView.py                             # NOTE: using pythonw not python
```
If the `pythonw` command above fails, try the few next options, and post an issue. You can try the `./pythonmac` provided in this repository
```bash
./pythonmac pyDatView.py
```
If that still doesn't work, you can try using the `python.app` from anaconda:
```bash
/anaconda3/bin/python.app
```
where `/anaconda3/bin/` is the path that would be returned by the command `which conda`. Note the `.app` at the end. If you don't have `python.app`, try installing it with `conda install -c anaconda python.app`


Note also that several users have been struggling to run pyDatView on the mac Terminal in new macOS systems. If you encounter the same issues, we recommend using the integrated zsh terminal from [VSCode](https://code.visualstudio.com) or using a more advanced terminal like [iterm2](https://iterm2.com/downloads.html) and perform the installation steps there. Also, make sure to stick to the base anaconda environment.





### Brew-python version (outside of a virtualenv)
If you have `brew` installed, and you installed python with `brew install python`, then the easiest is to use your `python3` version:
```
python3 -m pip install --user -r requirements.txt
python3 pyDatView.py
```

### Brew-python version (inside a virtualenv)
If you are inside a virtualenv, with python 3, use:
```
pip install -r requirements.txt
./pythonmac pyDatView.py
```
If the `pythonmac` commands fails, contact the developer, and in the meantime try to replace it with something like:
```
$(brew --prefix)/Cellar/python/XXXXX/Frameworks/python.framework/Versions/XXXX/bin/pythonXXX
```
where the result from `brew --prefix` is usually `/usr/loca/` and the `XXX` above corresponds to the version of python you are using in your virtual environment.



Note also that several users have been struggling to run pyDatView on the mac Terminal in new macOS systems. If you encounter the same issues, we recommend using the integrated zsh terminal from [VSCode](https://code.visualstudio.com) or using a more advanced terminal like [iterm2](https://iterm2.com/downloads.html) and perform the installation steps there. Also, make sure to stick to the base anaconda environment.

### Easy access
To easily access the program later, you can add an alias to your `.bashrc` or install the pydatview module:
```bash
echo "alias pydat='python `pwd`/pyDatview.py'" >> ~/.bashrc
# or
python setup.py install
```


## Adding more file formats
File formats can be added by implementing a subclass of `pydatview/io/File.py`, for instance `pydatview/io/VTKFile.py`. Existing examples are found in the folder `pydatview/io`.
Once implemented the fileformat needs to be registered in `pydatview/io/__init__.py` by adding an import line at the beginning of this script and adding a line in the function `fileFormats()` of the form `formats.append(FileFormat(VTKFile))`

If you believe your fileformat will be beneficial to the wind energy community, we recommend to also add your file format to the [weio](http://github.com/ebranlard/weio/) repository.
Follow the procedure mentioned in the README of the weio repository (in particualr adding unit tests and minimalistic example files).
