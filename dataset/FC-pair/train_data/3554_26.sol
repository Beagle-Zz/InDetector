contract c3554{
    // Refresh user acc
    // Pays dividends if any
    function updateAccount(address account) public returns(uint new_balance){
        require(frozen == false); 
        require(round<=9);
        require(bitmask_check(account, 1024) == false); // banned == false
        if(epoch > 1 && accounts[account].lastEpoch < epoch){
            uint entire = accounts[account].balance/100000000; //1.
            //uint diff_ = accounts[account].balance - entire*100000000;
            if((accounts[account].balance - entire*100000000) >0){
                emit Transfer(account, address(0), (accounts[account].balance - entire*100000000));
            }
            accounts[account].balance = entire*100000000;
            accounts[account].lastEpoch = epoch;
            accounts[account].lastRound = round;
            return accounts[account].balance;
        }
        if(round > accounts[account].lastRound){
            if(round >1 && round <=8){
                // Splits user bal by current multiplier
                uint tempDividedBalance = accounts[account].balance/current_mul();
                // [1.5556663] 4  (r2)
                uint newFixedBalance = tempDividedBalance*current_mul();
                // [1.55566630]  (r2)
                uint lastActiveDigit = tempDividedBalance%10;
                 // 1.555666 [3] 4  (r2)
                uint diff = accounts[account].balance - newFixedBalance;
                // 1.5556663 [4] (r2)
                if(diff > 0){
                    accounts[account].balance = newFixedBalance;
                    emit Transfer(account, address(0), diff);
                }
                uint toBalance = 0;
                if(lastActiveDigit>0 && current_toadd[lastActiveDigit-1]>0){
                    toBalance = current_toadd[lastActiveDigit-1] * current_mul();
                }
                if(toBalance > 0 && toBalance < dec[8-round+1]){ // Not enough
                    renewDec( accounts[account].balance, accounts[account].balance.add(toBalance) );
                    emit Transfer(address(0), account, toBalance);
                    // Refreshing dec arr
                    accounts[account].balance = accounts[account].balance.add(toBalance);
                    // Adding to ball
                    dec[8-round+1] = dec[8-round+1].sub(toBalance);
                    // Taking from burned decimal
                    _totalSupply = _totalSupply.add(toBalance);
                    // Add dividend to _totalSupply
                }
                accounts[account].lastRound = round;
                // Writting last round in wich user got dividends
                if(accounts[account].lastEpoch != epoch){
                    accounts[account].lastEpoch = epoch;
                }
                return accounts[account].balance;
                // returns new balance
            }else{
                if( round == 9){ //100000000 = 9 mul (mul8)
                    uint newBalance = fix_amount(accounts[account].balance);
                    uint _diff = accounts[account].balance.sub(newBalance);
                    if(_diff > 0){
                        renewDec( accounts[account].balance, newBalance );
                        accounts[account].balance = newBalance;
                        emit Transfer(account, address(0), _diff);
                    }
                    accounts[account].lastRound = round;
                    // Writting last round in wich user got dividends
                    if(accounts[account].lastEpoch != epoch){
                        accounts[account].lastEpoch = epoch;
                    }
                    return accounts[account].balance;
                    // returns new balance
                }
            }
        }
    }
}