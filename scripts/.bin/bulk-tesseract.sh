#!/bin/bash
for filename in *.png ; do
    tesseract "$filename" stdout >> newfile
done
