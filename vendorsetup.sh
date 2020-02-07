for combo in $(curl -s https://raw.githubusercontent.com/exthmui/hudson/master/lineage-build-targets | sed -e 's/#.*$//' | grep exthm-10 | awk '{printf "exthm_%s-%s\n", $1, $2}')
do
    add_lunch_combo $combo
done

add_lunch_combo exthm_arm-userdebug
add_lunch_combo exthm_arm64-userdebug
add_lunch_combo exthm_x86-userdebug
add_lunch_combo exthm_x86_64-userdebug
