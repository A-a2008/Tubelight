# Tubelight

## Setup

1. Click on green "<> Code" button
2. Click on "Download ZIP" to download the code
3. Extract the ZIP file into a Project folder

### Windows

Create a virtual environment and install the required packages using the command:
```bash
python -m venv venv
pip install -r requirements.txt
```

After installing the pip packages, please refer to [WeasyPrint Installation](https://doc.courtbouillon.org/weasyprint/stable/first_steps.html) and check for the windows section.

Navigate to the directory containing the `manage.py` file. <br>

Then to start the sever, you can type the command:
```bash
python manage.py runserver
```
This creates a local host server on the port 8000. Additionally if the port 8000 is occupied on your computer, you use the command:
```bash
python manage.py runserver <port>
```

### Linux

Create a virtual environment and install the required packages using the command:
```bash
python -m venv venv
pip install -r requirements.txt
```

Navigate to the directory containing the `manage.py` file.

Then to start the sever, you can type the command:
```bash
python manage.py runserver
```
This creates a local host server on the port 8000. Additionally if the port 8000 is occupied on your computer, you use the command:
```bash
python manage.py runserver <port>
```
