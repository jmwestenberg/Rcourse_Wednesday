# Rcourse_Wednesday

This was a repository created to follow along with current state of lessons of the full Rcourse (can be found <https://github.com/jmwestenberg/Rcourse>).

Notes/explanations can be found <https://jmwestenberg.github.io/courses/rcourse/>. 

## General Structure for repository
The overall goal for this structure is to help us organize where our inputs and outputs go. The logic for this structure was thought of through a simplification of the structure in <https://econ-project-templates.readthedocs.io/en/stable/index.html>

### Parent folder

- workingdir.r : has variables for paths to other folders predefined. These variables are then read in to all scripts. The names of these variables are supposed to map directly into the folders. In summary we define the following variable names:
  - folder_processed_data: variable for path to processed data folder
  - folder_raw_data: variable for path to raw_data folder
  - folder_scripts: variable for path to scripts folder 

Note: you will have to change paths in each script to be consistent with the paths to your main working directory folder.

### processed_data
Any data we have cleaned or manipulated at all is stored in this folder.

### raw_data
Where we have our original data stored. This data (ideally) should be absolutely untouched by us. The only thing we do to it is read it into scripts to clean/process. The processed data is then stored in the processed_data folder.

### scripts
Where any scripts we have written go. Depending on the complexity of your project, it may be worth breaking this into different sub-folders (ie. data cleaning scripts, analysis scripts, plotting scripts, etc)

