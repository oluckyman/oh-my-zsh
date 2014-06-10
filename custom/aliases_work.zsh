# Timeline
alias cdtl="cd ~/Projects/timeline"
alias rntl="cdtl; http-server -p 8000 &"

# ModulInt
alias cdmo="cd ~/Projects/modulint; source ~/virtualenv_home/develop/bin/activate"
alias rnmo="cdmo; python web.py _rnmo_"
alias rnmok="kill \$(ps | grep '[p]ython web.py _rnmo_' | awk '{print \$1}'); rnmo"
alias rnmol="cdmo; mongod &; python web.py _rnmo_"
alias rnmolk="kill \$(ps | grep '[p]ython web.py _rnmo_' | awk '{print \$1}'); rnmol"

# Auction
alias cdau="cd ~/Projects/Auction/auction"
alias rnau="cdau; rails server &"

