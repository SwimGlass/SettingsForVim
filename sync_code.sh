#!/bin/bash

#update ctags
ctags -R

#update cscope tages
cscope -Rbqk
