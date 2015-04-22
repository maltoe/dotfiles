function cpstat () {
    tar -cf - "${@: 1: $#-1}" |
    pv -s "$( du -cs -BK --apparent-size "${@: 1: $#-1}" |
              tail -n 1 |
              cut -d "$(echo -e "\t")" -f 1)" |
    ( cd "${@: $#}"; tar -xf - )
;}
