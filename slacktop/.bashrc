export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# set this to true to prevent certian things from running on startup (see comms.sh)
# this is for when i don't want all sorts of network traffic or startup noises from certain programs
#export QUIET=true

# uncomment to keep tilda-immortal from respawning
export TILDA_UNDEAD=true

# enhance the default path to include 
#	$HOME/.bin for random crap i don't want to pollute my system with
#PATH=${HOME}/.bin:${PATH}
#	sbin's
#PATH=${PATH}:/sbin:/usr/sbin:/usr/local/sbin
#	chrome
#PATH=${PATH}:/opt/google/chrome
#	dropbox
#PATH=${PATH}:/opt/dropbox
#	java
#PATH=${PATH}:/usr/lib64/java/bin
#	scala
#PATH=${PATH}:/usr/lib64/scala/bin

# dedupe $PATH
PATH=${HOME}/.bin:${PATH}:/sbin:/usr/sbin:/usr/local/sbin:/usr/lib64/scala/bin:/usr/lib64/java/bin:/opt/google/chrome:/opt/dropbox:/opt/arduino

export PATH

# "secure" rm. -u remove after overwrite -z overwrite with 0's
alias srm='shred -uz'

# set java and scala homes
export JAVA7_HOME=/usr/lib64/java
export JAVA6_HOME=/usr/lib64/java1.6.0_43
export JAVA_HOME=${JAVA6_HOME}
export SCALA_HOME=/usr/lib64/scala

# cause nobody knows what fluxbox is
#export DE=xfce
#export DESKTOP_SESSION=LXDE

# I HATE NANO :(
export EDITOR=vim

# compressed prompt with path and hostname
small_pwd(){
	if [[ `pwd` == $HOME ]] ;then
		echo -n '~'
	elif [[ $(basename `pwd`) == `pwd` ]] ;then
		echo -n `pwd`
	else
		cwd=`dirname $(pwd) | sed "s:^$HOME:/~:"`
		cwd=`echo $cwd | egrep -o '\/[^/]' | sed ':a;N;$!ba;s/\n//g'`
		echo -n ${cwd//\/\~/\~}/$(basename `pwd`)
	fi
}

# note the \ infront of $(small_pwd)
PS1="\u@\h:\$(small_pwd)\$ "
