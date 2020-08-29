mysqladmin -uroot ext | awk '/Queries/{q=$4}/Threads_connected/{c=$4}/Threads_running/{r=$4}END{printf("%d %d %d\n", q, c, r)}'

## /pattern/{action}/pattern/{action}/pattern/{action}/pattern/{action}/pattern/{action}/pattern/{action}/pattern/{action}
## to set value to a parameter, you see how it's done in the sample above
