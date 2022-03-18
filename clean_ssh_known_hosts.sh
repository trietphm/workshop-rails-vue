app1="192.168.60.4"
app2="192.168.60.5"
db="192.168.60.6"

ssh-keygen -f "$HOME/.ssh/known_hosts" -R $app1
ssh-keygen -f "$HOME/.ssh/known_hosts" -R $app2
ssh-keygen -f "$HOME/.ssh/known_hosts" -R $db

ssh-keyscan $app1 >> $HOME/.ssh/known_hosts
ssh-keyscan $app2 >> $HOME/.ssh/known_hosts
ssh-keyscan $db >> $HOME/.ssh/known_hosts
