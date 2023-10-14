#!/usr/bin/env python3

"""Module providing a function printing python version."""

import sys
import os

print(f"Python Version: {sys.version}")

def PrintDirTree(rootDir):
    """Function printing python version."""
    list_dirs = os.walk(rootDir)
    for root, dirs, files in list_dirs:
        for d in dirs:
            print (os.path.join(root, d) )
        for f in files:
            print (os.path.join(root, f) )

dirPath = os.getcwd()
print(dirPath)
subdir = f"{dirPath}/subdir1"
print(subdir)
print("")
PrintDirTree(subdir)
