FROM resin/rpi-raspbian:jessie

RUN apt-get update && apt-get install -y nano gvfs ipheth-utils libimobiledevice-utils gvfs-backends gvfs-bin gvfs-fuse net-tools aptitude

RUN echo "allow-hotplug eth1" >> /etc/network/interfaces \
	&& echo "iface eth1 inet dhcp" >> /etc/network/interfaces

RUN aptitude install ifuse

RUN mkdir /media/iPhone

RUN sed -i -e 's@ipheth-pair@iPhoneTethering@' /lib/udev/rules.d/90-iphone-tether.rules

COPY iPhoneTethering /lib/udev/
COPY start.sh /App/ 

RUN chmod 755 /lib/udev/iPhoneTethering

CMD ["bash", "/App/start.sh"]
