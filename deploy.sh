HOSTNAME=40.90.250.248
USERNAME=azureuser
SCRIPT="rm -rf strikingo-landing-page;"

ssh -l ${USERNAME} ${HOSTNAME} "${SCRIPT}"
scp -r ../strikingo-landing-page "${USERNAME}@${HOSTNAME}:./"
RUN_SCRIPT="cd strikingo-landing-page;  cd ./strikingo-landing-page; sudo -S pkill -9 python3; sleep 2; tmux new-session -d -s mysession 'python3 -m http.server 8092'"
ssh -l ${USERNAME} ${HOSTNAME} "${RUN_SCRIPT}" 
exit 0