#!/bin/bash
#
# bash script que verifica se o node esta sincronizado ou quantos blocks faltam.
#

bitcoindSynced() {

  process=bitcoind
  pidof -s "$process" > /dev/null 2>&1
  status=$?

  blockCount=`bitcoin-cli getblockcount`

  blockChain=`wget -O - http://blockchain.info/q/getblockcount`

  if [[ "$status" -eq 0 ]]; then
	printf "OK!!! bitcoind is running\n\n"
  else
	printf "ERROR!!! bitcoind not running\n\n"
	exit 1
  fi

  blockCount=`bitcoin-cli getblockcount`

  if [[ -z "$blockCount" ]] ; then
	printf "ERROR!!! Error getting blockcount from bitcoind\n"
	exit 1
  fi

  printf "Number of blocks "$blockCount"\n"

  if [[ -z "$blockChain" ]] ; then
	printf "ERROR!!! Error getting blockcount from http://blockchain.info/\n\n"
	
  else
      blockDiff=$(($blockChain -  $blockCount))

      if [[ ! -z "$blockChain" ]] && [[ ! -z "$blockChain" ]] &&  [[ ! -z "$blockDiff" ]] ; then
	  if [[ "$blockDiff" = 0 ]] ; then
	      echo "up to date"
	  else
	      echo ""$blockDiff" blocks behind"
	  fi
      fi
      
  perc=$(echo "$blockCount" / "$blockChain" | bc -l)

  perc=$(echo "$perc"*"100" | bc)

  perc=$(echo "$perc" | cut -c-5)

  printf ""$perc" %% Done \n"
  
  fi
  
  chaintip=$(bitcoin-cli getbestblockhash)

  printf "\nChaintip: "$chaintip"\n\n"

} 2>/dev/null


function BTC_status () {                                                                                                                    
                                                                                                                                            
  source ~/.bash_profile                                                                                                                    
                                                                                                                                            
  process="bitcoind"                                                                                                                        
  pidof -s "$process" > /dev/null 2>&1                                                                                                      
  status=$?                                                                                                                                 
                                                                                                                                            
  if [[ "$status" -eq 0 ]]; then                                                                                                            
    printf "\n"                                                                                                                             
#    echo "$process is running"                                                                                                              
    printf "\n"                                                                                                                             
    uname -a                                                                                                                                
    printf "\n"                                                                                                                             
    date                                                                                                                                    
    printf "\n"                                                                                                                             
    uptime                                                                                                                                  
    printf "\n"                                                                                                                             
    bitcoindSynced

    printf "\n"               
    str1=$(du -sh $HOME/.bitcoin/blocks/ | cut -f 1 )                                                                                                     
    str2=$(du -sh $HOME/.bitcoin/chainstate/ | cut -f 1 )
    printf "\nBlockchain storage space:\n${str1}\t ~/.bitcoin/blocks" 
    printf "\n${str2}\t ~/.bitcoin/chainstate"
    printf "\n\nFull node running for days-hours:minutes:seconds\n$(ps -o etime= -p "$(pidof "$process")")\n\n"                               
  else                                                                                                                                      
    echo "$process is NOT running"                                                                                                          
  fi                                                                                                                                        
                                                                                                                                            
}


source $HOME/.bash_profile

clear
BTC_status
