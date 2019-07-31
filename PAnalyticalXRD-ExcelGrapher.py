## Importing all the plotting, excel, and file importing modules
import matplotlib.pyplot as plt
import pandas as pd
import tkinter as tk
from tkinter import filedialog
root = tk.Tk()
root.withdraw()

## Prompt user to open XRD file in excel filetypes
file_path = filedialog.askopenfilename(filetypes=[("MS Excel Files", "*.xlsx")])

## Read excel file assuming no headers; just raw data in first two columns
df=pd.read_excel(file_path, header=None)

##Put in appropriate column name for ease of use
df.columns=['angle', 'intensity']

## Set x-axis as angle column and y-axis as intensity column
x= df['angle']
y= df['intensity']

## Plot X and Y with x-axis as 2theta degrees and y-axis as intensity
plt.plot (x,y)

plt.xlabel('2theta (deg)')
plt.ylabel ('Intensity (a.u.)')
plt.title ('XRD Profile')
plt.show()
