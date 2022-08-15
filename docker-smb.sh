#!/bin/bash
docker run -it -e TZ=America/Sao_Paulo -v /home/juliano/share-samba:/samba -p 139:139 -p 445:445 --name samba -d dperson/samba -p \
	    -u "user;password" \
            -s "user;/samba;no;no;no;user"  
