#  Solution Checker
#  Initial Creator: Andrew Friedman
#  Created: 03/27/2020
#  Purpose: Creates READMEs with solution data

import os
import time
import subprocess
from glob import glob

def GetSpeeds(folderName): # Creates README of directory's solution data
    readData = "# " + folderName + "\n"
    # TODO: webscrape problem description
    readData += "## Data \n"
    # TODO: rank by speed
    readData += "| Language | Time (seconds) | Notes |\n"
    readData += "| --- | --- | --- |\n"
    readData += convertValues(CheckPython(folderName)) + "\n"
    print(" Completed running python solution")
    readData += convertValues(CheckCSharp(folderName)) + "\n"
    print(" Completed running C# solution")
    readData += convertValues(CheckC(folderName)) + "\n"
    print(" Completed running Objective C solution")
    readData += convertValues(CheckLisp(folderName)) + "\n"
    print(" Completed running Common Lisp solution")
    readData += convertValues(CheckAssembly(folderName)) + "\n"
    print(" Completed running ARM Assembly solution")
    readMe = open("./" + folderName + "/README.md","w+")
    readMe.write(readData)
    print("Completed running " + folderName + " programs...")

def CheckPython(folderName):
    if os.path.isfile("./" + folderName + "/Solution.py"):
        start_time = time.time()
        output = subprocess.check_output("python " + "./Problem\ " + folderName[-3:] + "/Solution.py", shell=True) # runs solution and stores output
        total = time.time() - start_time
        if (total <= 60):
            return "Python", total, "Valid solution"
        else:
            return "Python", total, "Too slow"
    return "Python", "n/a", "No solution"

def CheckCSharp(folderName):
    path = str("./Problem\ " + folderName[-3:] + "/")
    if os.path.isfile("./" + folderName + "/Solution.cs"):
        os.system("mcs -out:" + path + "Solution.exe " + path + "Solution.cs")
        start_time = time.time()
        output = subprocess.check_output("mono " + "./Problem\ " + folderName[-3:] + "/Solution.exe", shell=True) # runs solution and stores output
        total = time.time() - start_time
        os.system("rm " + path + "Solution.exe ")
        if (total <= 60):
            return "C#", total, "Valid solution"
        else:
            return "C#", total, "Too slow"
    return "C#", "n/a", "No solution"

def CheckC(folderName):
    path = str("./Problem\ " + folderName[-3:] + "/")
    if os.path.isfile("./" + folderName + "/Solution.c"):
        try: # handles compile errors
            error = os.system("gcc " + path + "Solution.c -o " + path + "Solution")
            start_time = time.time()
            output = subprocess.check_output("./Problem\ " + folderName[-3:] + "/Solution", shell=True) # runs solution and stores output
            total = time.time() - start_time
            os.system("rm " + path + "Solution")
            if (total <= 60):
                return "Objective C", total, "Valid solution"
            else:
                return "Objective C", total, "Too slow"
        except:
            return "Objective C", "n/a", "Broken code"
    return "Objective C", "n/a", "No solution"

def CheckLisp(folderName):
    path = str("./Problem\ " + folderName[-3:] + "/")
    if os.path.isfile("./" + folderName + "/Solution.lisp"):
        try:
            start_time = time.time()
            output = subprocess.check_output("sbcl --load ./Problem\ " + folderName[-3:] + "/Solution.lisp --eval '(progn (declaim (sb-ext:muffle-conditions cl:warning)) (sb-ext:quit))'", shell=True) # runs solution and stores output
            total = time.time() - start_time
            if (total <= 60):
                return "Common Lisp", total, "Valid solution"
            else:
                return "Common Lisp", total, "Too slow"
        except:
            return "Common Lisp", "n/a", "Broken code"
    return "Common Lisp", "n/a", "No solution"

def CheckAssembly(folderName):
    path = str("./Problem\ " + folderName[-3:] + "/")
    if os.path.isfile("./" + folderName + "/Solution.s"):
        try:
            error = os.system("as -g -o ./Problem\ " + folderName[-3:] + "/Solution.o ./Problem\ " + folderName[-3:] + "/Solution.s")
            error2 = os.system("ld -o ./Problem\ " + folderName[-3:] + "/Solution ./Problem\ " + folderName[-3:] + "/Solution.o")
        except:
            return "ARM Assembly", "n/a", "Compiling error"
        start_time = time.time()
        try:
            output = subprocess.check_output("./Problem\ " + folderName[-3:] + "/Solution", shell=True) # runs solution and stores output
        except:
            total = time.time() - start_time
            os.system("rm " + path + "Solution.o")
            os.system("rm " + path + "Solution")
            return "ARM Assembly", total, "Runtime error"
        total = time.time() - start_time
        os.system("rm " + path + "Solution.o")
        os.system("rm " + path + "Solution")
        if (total <= 60):
            return "ARM Assembly", total, "Valid solution"
        else:
            return "ARM Assembly", total, "Too slow"
    return "ARM Assembly", "n/a", "No solution"

def convertValues(runningData): # Converts tuple to table-friendly string
    output = "| "
    for x in runningData:
        output += str(x) + " | "
    return output

folders = [ p.replace('/', '') for p in glob('*/') ] # finds immediate folders in directory
folders.sort() # sorts string[]

for folder in folders: # iterate through all folders
    GetSpeeds(folder)
