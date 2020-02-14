for combo in $(curl -s https://raw.githubusercontent.com/exthmui/hudson/master/exthm-build-targets | sed -e 's/#.*$//' | grep exthm-10 | awk '{printf "exthm_%s-%s\n", $1, $2}')
do
    COMMON_LUNCH_CHOICES += " ${combo}"
done
