#!/bin/bash

#update ctags
ctags -R --param-CPreProcessor._expand=1 --fields-C=+'{macrodef}' --fields=+'{signature}'

#update cscope tages
cscope -Rbqk
