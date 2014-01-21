function scan() {
  if [ -f diff-$1.patch ];
    then
      patch ~/GRETIL/forme/$1 -o /tmp/$1 < diff-$1.patch && ../read_gretil.py /tmp/$1 --print_identified_verses=none --print_unidentified_verses=none
  else
      ../read_gretil.py ~/GRETIL/forme/$1 --print_identified_verses=none --print_unidentified_verses=none
  fi
}

scan amaru_u.htm
scan bhakirpu.htm
scan bhall_pu.htm
../read_gretil.py bharst_u.htm --print_identified_verses=none --print_unidentified_verses=none
scan kakumspu.htm
../read_gretil.py kragh_pu.htm --print_identified_verses=none --print_unidentified_verses=none
scan maghspvu.htm
scan meghdk_u.htm
scan msubhs_u.htm
scan nkalivpu.htm
scan ramodtpu.htm

PYTHONPATH=.. python generate_stats_table.py > stats_table.html
