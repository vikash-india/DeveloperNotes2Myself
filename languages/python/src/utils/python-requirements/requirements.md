# Description: Python Environment for the Project

### Python Virtual Environment
* Create virtual environment `DeveloperNotes2Myself` for this project.
* DeveloperNotes2Myself is a Python 3 virtual environment.
```
mkvirtualenv --no-site-packages DeveloperNotes2Myself
```

### Python Packages
* This is a list of Python modules needed for this project.
* The `requirements.txt` contains the complete packages list including the dependencies.
```bash
pip install pytz                # For Python Timezone
pip install jupyter             # For Jupyter Notebook
pip install matplotlib          # For visualisations
pip install sympy               # For algebra
```

### Python Requirement File
```
# Generate Requirements File
workon DeveloperNotes2Myself
pip freeze > requirements.txt

# Install From Requirements File
workon DeveloperNotes2Myself
pip install -r requirements.txt
```

### TODO
* None
