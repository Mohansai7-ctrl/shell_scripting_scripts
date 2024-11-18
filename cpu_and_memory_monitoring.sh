get_cpu_check(){
    cpu_idle=$(top -bn1 | grep 'Cpu(s) | awk -F " " '{print $8F}')
    cpu_usage=$(100 - $cpu_idle)
}

