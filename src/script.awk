# cat app|wc -l |xargs -I {} awk -v appd="app" -v total={} -f script.awk app
BEGIN{
    printf "========================================BEGIN================================================\n"
    printf "select sum(count)  from ("
}

{
    if (NR==1)
        print "select '" $1"' table_name ,count(1) count from ",$1 " " appd ;
    else if (NR!=total)
        print "select '"$1"',count(1) from ",$1 " "appd ;
    else
        print "select '" $1"',count(1) from ",$1""
}
END{
    printf ") t ; \n"
    printf "========================================END==================================================\n"
}
