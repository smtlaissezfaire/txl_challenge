var x,y,z,m,n := 1
case x of
    label 2:
        z :=1
    label 1:
        put "hi"
        k := 3
    label 4:
        case m of
	    label 5:
		x := m * n
	    label 7:
		x := 4
        end case
        put x
    label:
        put "that's it"
end case
put "done"
