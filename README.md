# Proof of Stake (PoS)
Systemd files for Proof of Stake (PoS) crypto coins. Staking needs open wallets 24x7, so this runs the wallet as a service and restarts it on failure. It automatically starts the service on boot.


### Install Instructions (.service files)
* Copy the file(s) to */etc/systemd/system*.
* Execute *sudo systemctl daemon-reload*
* Enable the service (e.g. *sudo systemctl enable nyex-staker*)
* Start the service (e.g. *sudo systemctl start nyex-staker*)


### Install Instructions (.conf files)
* Run *nyeriumd* and copy the rpcuser and rpcpassword generated
* The above command creates a blank *nyerium.conf* inside a hidden directory *.nyerium* in the user's home directory
* Replace the *nyerium.conf* file with the applicable configuration file for the node function


### Buy Me Coffee
If you appreciate the code shared and want to show appreciation, buy me some coffee using any of these wallet address(es):
* ***Bitcoin (BTC): 3Kyjg1Wj1PNGN3KhiRprxYvvQpdjC5kT3k***
* ***Etherium (ETH): 0x5F168F895C63ccC5FbEf921047bc2b63f6780c3F***
* ***SmartCash (SMART): SbgqBUuGBVaaFERmc5zPn8XStxXe7vE1SL***
* ***Nyerium (NYEX): NYYJc31kdp9BVdjGuWRZv91b4SYG1pTVWu***


### *Linux Course*
If you're interested to know more about Linux (the operating system which runs these VPS intances), I would suggest this course [The Art of Doing: Learn the Linux Command Line](https://bit.ly/2OFwdfO). It is a highly rated Linux course in Udemy.


&#160;
### *Got Discord? [Why don't you join the discussion?](https://discord.gg/jvMMWNd)*
