// Create non-persistent TUN interfaces
#include <iostream>
#include <sys/ioctl.h>
#include <linux/if.h>
#include <linux/if_tun.h>
#include <fcntl.h>
#include <cstring>
#include <unistd.h>
using namespace std;

int main (void)
{
	int tun_fd = -1, err = 0, fd_cnt = 0;
	struct ifreq ifr;
	memset(&ifr, 0, sizeof(ifr));
	ifr.ifr_flags = IFF_TUN | IFF_NO_PI | IFF_MULTI_QUEUE;
	for (int i = 10; i < 1246; i++)
	{
		sprintf(ifr.ifr_name, "tunc%d", i);
		cout << "Setting " << ifr.ifr_name << endl;

		// Create 16 Qs
		for (auto j = 0; j < 16; j++)
		{
			tun_fd = open("/dev/net/tun", O_RDWR);
			if (tun_fd < 0 ) {
				cout << "Failed open: " << ifr.ifr_name << endl;
				goto done;
			}

			err = ioctl(tun_fd, TUNSETIFF, (void *)&ifr);
			if (err) {
				cout << "Failed ioctl: " << ifr.ifr_name << endl;
				goto done;
			}
			fd_cnt++;
			sleep (0.2);
		}
		cout << "Setup: " << ifr.ifr_name << " FD cnt: " << fd_cnt << endl;
		sleep(0.5);

	}
done:
	cout << "Done. Kill me";
	sleep (300);
	return 0;

}
