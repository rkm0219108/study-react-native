#!/bin/sh
#https://github.com/venmo/synx
#synxを実行
# Exlude "Frameworks", "Libraries" and "Pods" directories
synx -p -e "Frameworks" -e "Libraries" -e "Pods" ../*.xcodeproj
