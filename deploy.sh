HOSTNAME=172.179.241.27
USERNAME=azureuser
rm -rf strikingo-landing-page.tar.gz
tar -czvf strikingo-landing-page.tar.gz *
SCRIPT="rm -rf strikingo-landing-page; rm -rf strikingo-landing-page.tar.gz;"

ssh -l ${USERNAME} ${HOSTNAME} "${SCRIPT}"
scp -r strikingo-landing-page.tar.gz "${USERNAME}@${HOSTNAME}:./"
RUN_SCRIPT="tar -xzvf strikingo-landing-page.tar.gz; sudo -S pkill -9 python3; sleep 2; tmux new-session -d -s mysession 'python3 -m http.server 8092'"
ssh -l ${USERNAME} ${HOSTNAME} "${RUN_SCRIPT}" 
exit 0