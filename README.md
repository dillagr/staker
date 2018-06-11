# staker
Systemd files for Proof of Stake (PoS) crypto coins. Staking needs open wallets 24x7, so this runs the wallet as a service and restarts it on failure. It automatically starts the service on boot.

### Install Instructions
* Copy the file(s) to */etc/systemd/system*.
* Execute *sudo systemctl daemon-reload*
* Enable the service (e.g. *sudo systemctl enable nyex-staker*)
* Start the service (e.g. *sudo systemctl start nyex-staker*)
