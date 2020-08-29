docker run -it --rm -v /work/:/root centos /bin/bash

# to remove the duplicate line, uniq -c
mysql -uroot -e 'show processlist\G' | grep State: | uniq -c | sort -rn
