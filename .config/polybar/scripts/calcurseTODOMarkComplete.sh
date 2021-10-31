#!/bin/sh
sed -i '1{H;d}; ${p;x;s/\[.\]/[-1]/;s/^\n//}' $HOME/.local/share/calcurse/todo

