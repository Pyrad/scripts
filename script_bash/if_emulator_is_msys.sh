#!/bin/sh -

#################################################
#      To check if current is MSYS emulator     #                                                                                                                                                                                                                                 #
#################################################

# Need to check 3 env variables: TERM_PROGRAM, OS and OSTYPE
echo "TERM_PROGRAM is: $TERM_PROGRAM"
echo "          OS is: $OS"
echo "      OSTYPE is: $OSTYPE"

if [[ ! -z $TERM_PROGRAM ]] && [[ $TERM_PROGRAM == "Tabby" ]] && [[ ! -z $OS ]] && [[ $OS == "Windows_NT" ]] && [[ ! -z $OSTYPE ]] && [[ $OSTYPE == "msys" ]]; then
	### Current is Tabby emulator
	#SUP_FILE_TABBY="${HOME}/.bashrc_for_tabby.sh"
	#[[ -f $SUP_FILE_TABBY ]] && source $SUP_FILE_TABBY
    echo "Current is MSYS terminal"
else
    ### Current emulator might be others, Cmder, for example
	#SUP_FILE_CMDER="${HOME}/.bashrc_for_cmder.sh"
	#[[ -f $SUP_FILE_CMDER ]] && source $SUP_FILE_CMDER
    echo "Current is MSYS terminal"
fi


