#!/usr/bin -

# Create new chapter files (source & header files) for the reading minutes of
# Effective Modern CPP

if [[ $# -gt 2 ]]; then
    echo "Only 2 arguments are allowed, which are the chapter number and the item number"
    exit 1
fi

if [[ $# -lt 2 ]]; then
    echo "Chapter number and item number are needed (current less than 2 arguments)"
    exit 1
fi

# Chapter number
cnum=$1
# Item number
inum=$2
# Folder for EffectiveModernCpp
emcxx_dir="./src/EffectiveModernCpp"
# File name (header)
hname="${emcxx_dir}/chapter${cnum}_item${inum}.hpp"
# File name (source)
sname="${emcxx_dir}/chapter${cnum}_item${inum}.cpp"

if [[ -f $hname ]] || [[ -d $hname ]]; then
    echo "[ERROR] Header file exists: $hname"
    echo "[ERROR] return because of error"
    exit 1
fi
if [[ -f $sname ]] || [[ -d $sname ]]; then
    echo "[ERROR] Source file exists: $sname"
    echo "[ERROR] return because of error"
    exit 1
fi

echo "Ready to create the following files..."
echo "  (1) $hname"
echo "  (2) $sname"


# Write content to a header file
cat << EOF > $hname
#ifndef EFFECTIVE_MODERN_CPP_CHAPTER${cnum}_ITEM${inum}
#define EFFECTIVE_MODERN_CPP_CHAPTER${cnum}_ITEM${inum}

#include "../utilities/utilities.hpp"

namespace effective_mordern_cpp {

namespace chapter_${cnum} {

namespace item_${inum} {

void test_all();

} // namespace item_${inum}

} // namespace chapter_${cnum}

} // namespace effective_mordern_cpp


#endif // EFFECTIVE_MODERN_CPP_CHAPTER${cnum}_ITEM${inum}
EOF

# Write content to a source file
cat << EOF > $sname
#include "chapter${cnum}_item${inum}.hpp"

namespace effective_mordern_cpp {

namespace chapter_${cnum} {

namespace item_${inum} {


void test_all() {

}


} // namespace item_${inum}

} // namespace chapter_${cnum}

} // namespace effective_mordern_cpp

EOF

echo "Finished"
