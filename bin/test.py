#!/usr/bin/env python3

"""Module providing a function printing python version."""

import sys
import os

print(f"Python Version: {sys.version}")

dirPath = os.getcwd()
print(dirPath)
subdir = f"{dirPath}/subdir1"
print(subdir)
if not os.path.exists(subdir):
    os.makedirs(subdir)

filePath = f"{subdir}/myfiile.htm"
print(filePath)

with open(filePath, "w",encoding="utf-8") as file:
    file.write('This is some text')
