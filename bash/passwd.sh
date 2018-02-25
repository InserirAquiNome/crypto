#!/bin/bash

# This line will genereate a 32 char random pass using A-Za-z0-9!"#$%&'\''()*+,-./:;<=>?@[\]^_`{|}~ chars 
#
#LC_ALL=C tr -dc 'A-Za-z0-9!"#$%&'\''()*+,-./:;<=>?@[\]^_`{|}~' </dev/urandom | head -c 32 ; echo

# This line will genereate a 60 char random pass using A-Za-z0-9
#
#LC_ALL=C tr -dc 'A-Za-z0-9' </dev/urandom | head -c 60 ; echo

# This line will genereate a 16 char random pass using A-Za-z0-9!"#$%&'\''()*+,-./:; chars 
#
#LC_ALL=C tr -dc 'A-Za-z0-9!"#$%&'\''()*+,-./:;' </dev/urandom | head -c 16 ; echo

# The firts line will generate a random number between 16 an 32. This number will be the number os chars of the password
# The second line generate a random pass using A-Za-z0-9!#$%&()*+,-./:;<=>?@[\] chars with the length of the random number created in the line above
#
#digits=$(( RANDOM % (32 - 16 + 1 ) + 16 ))
#
#LC_ALL=C tr -dc 'A-Za-z0-9!#$%&()*+,-./:;<=>?@[\]' </dev/urandom | head -c $digits ; echo

# The firts line will generate a random number between 16 an 32. This number will be the number os chars of the password
# The second line generate a random pass using A-Za-z0-9!"#$%()*+/:?@ chars with the length of the random number created in the line above
#
digits=$(( RANDOM % (32 - 16 + 1 ) + 16 ))

LC_ALL=C tr -dc 'A-Za-z0-9!"#$%()*+/:?@' </dev/urandom | head -c $digits ; echo
