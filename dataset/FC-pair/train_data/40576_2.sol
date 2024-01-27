contract c40576{
     
    function distributeEarnings() private {
         
        while (true) {
             
            uint amount = ads[payoutIdx].amount * 2;
             
            if (balance >= amount) {
                 
                ads[payoutIdx].etherAddress.send(amount / 100 * 80);
                PayoutEarnings(ads[payoutIdx].etherAddress, amount / 100 * 80, 0);
                 
                fees += amount / 100 * 15;
                 
                uint level0Fee = amount / 1000 * 25;  
                uint level1Fee = amount / 1000 * 15;  
                uint level2Fee = amount / 1000 * 10;  
                 
                int refId = ads[payoutIdx].refId;
                if (refId == -1) {
                     
                    balance += level0Fee + level1Fee + level2Fee;
                } else {
                    ads[uint(refId)].etherAddress.send(level0Fee);
                    PayoutEarnings(ads[uint(refId)].etherAddress, level0Fee, 1);
                    refId = ads[uint(refId)].refId;
                    if (refId == -1) {
                         
                        balance += level1Fee + level2Fee;
                    } else {
                         
                        ads[uint(refId)].etherAddress.send(level1Fee);
                        PayoutEarnings(ads[uint(refId)].etherAddress, level1Fee, 2);
                        refId = ads[uint(refId)].refId;
                        if (refId == -1) {
                             
                            balance += level2Fee;
                        } else {
                             
                            ads[uint(refId)].etherAddress.send(level2Fee);
                            PayoutEarnings(ads[uint(refId)].etherAddress, level2Fee, 3);
                        }
                    }
                }
                balance -= amount;
                payoutIdx += 1;
            } else {
                 
                 
                break;
            }
        }
    }
}