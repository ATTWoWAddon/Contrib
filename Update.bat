:: Run this batch script to update this repo and all of its submodules with a single button press.
@echo off

git pull --recurse-submodules
git submodule update --remote --recursive

goto :EOF