#!/bin/bash

# for arg in "$@"; do
#     echo "$arg"
# done

# for var in "$@";
# do
# echo "NEWLINE $var"
# done

echo "$@"

# echo \'"$1"\'
# echo "$2"
# echo "$3"
# echo "$4"

# json=$(echo "$1" | jq -r '@json')
# echo "$json"
# echo "allofnf"
# echo "$2"

# suppress rules on specific resources
# echo "Suppressing rule " "$1"
# aws securityhub batch-update-findings \
#     --finding-identifiers "$1" \
#     --note "$2" \
#     --severity "$3" \
#     --workflow "$4"

# echo "Rule suppressed because " "$2"

# echo "Suppressed  arg $@"


# aws securityhub batch-update-findings \
#     --finding-identifiers "$1" \
#     --note "$2" \
#     --severity "$3" \
#     --workflow "$4"
