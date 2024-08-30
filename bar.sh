# some configuration on the sway bar

while true 
do
	msg='This will display on the bar'
#	echo "$msg"
#	sleep 1

	date=$(date +'%a, %b %d')
	time=$(date +'%a, %I:%M %p')

	# => Friday, Mar 05 | 03:47 PM
	echo  "$time"
	sleep 1
done
