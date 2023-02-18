#!/usr/bin/env bash
# Nerd Fonts Version: 2.3.3
# Script Version: 1.2.0

# Give any parameter to allow some glyphs to be 2 'cells' wide.
# This might or might not be how they are currently handled while patching

text1='Testing'
text2='Nerd Fonts'

leftSymbolsCodes=('E0B0' 'E0B4' 'E0B8' 'E0BC' 'E0C0' 'E0C4' 'E0C6' 'E0C8' 'E0CC' 'E0CE' 'E0CF' 'E0CF' 'E0D1' 'E0D2')
leftSymbols=('' '' '' '' '' '' '' '' '' '' '' '' '' '')
rightSymbolsCodes=('E0B2' 'E0B6' 'E0BA' 'E0BE' 'E0C2' 'E0C5' 'E0C7' 'E0CA' 'E0CC' 'E0CE' 'E0CF' 'E0CF' 'E0D1' 'E0D4')
rightSymbols=('' '' '' '' '' '' '' '' '' '' '' '' '' '')
isWide=(0 0 0 0 1 1 1 1 1 1 1 1 1 0)

# shellcheck disable=SC2034
# don't check unused vars we might want to use them later on
colorReset='\033[0m'
colorBgWhite='\033[107m'
# shellcheck disable=SC2034
# don't check unused vars we might want to use them later on
colorBgLightBlue='\033[104m' # light blue, bright green is 102
colorBgBlack='\033[40m'
colorBg1='\033[100m'
colorBg2=$colorBgBlack
# shellcheck disable=SC2034
# don't check unused vars we might want to use them later on
colorFgLightBlue='\033[94m'
colorFgLightGray='\033[90m'
# shellcheck disable=SC2034
# don't check unused vars we might want to use them later on
colorFgLightYellow='\033[93m'
colorFgBlack='\033[30m'
colorFg1=$colorFgBlack
colorFg2=$colorFgLightGray
colorBgDefault='\033[49m'

echo -e "$colorReset Nerd Fonts :: Testing Powerline Symbol size and alignment"

for i in "${!leftSymbolsCodes[@]}"; do
	pad=' '
	pad2=' '
	symbol=${leftSymbols[$i]}
	symbol2=${rightSymbols[$i]}
	code="${leftSymbolsCodes[$i]}"
	code2="${rightSymbolsCodes[$i]}"

	if [ ${isWide[$i]} -ge 1 -a $# -ge 1 ]; then
		symbol="${symbol} "
		symbol2="${symbol2} "
		pad=
		pad2=
	fi
	if [ "$code" = "$code2" ]; then
		symbol2=${rightSymbols[0]}
		code2='None'
		pad2=' '
	fi

	echo -e "$colorBg1$colorFg1$text1 $code $colorFg2$colorBg2$symbol$pad $text2 $pad$colorFg1$colorBgDefault$symbol -- $colorFg1$colorBgDefault$symbol2$colorFg2$colorBg2$pad2 $text2 $pad2$symbol2$colorBg1$colorFg1 $code2 $colorReset$colorBgWhite\\n$colorReset"

done

printf "\\n"
