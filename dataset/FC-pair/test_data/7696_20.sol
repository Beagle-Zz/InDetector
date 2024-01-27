contract c7696{
    ///////////////////////////////////////////////////////////////////////////////////////////////////////
    // Run this on every change of user balance
    // Refreshes dec[] array
    // Takes initial and new ammount
    // while transaction must be called for each acc.
    function renewDec(uint initSum, uint newSum) internal returns(bool success){
        if(round < 9){
            uint tempInitSum = initSum; 
            uint tempNewSum = newSum; 
            uint cnt = 1;
            while( (tempNewSum > 0 || tempInitSum > 0) && cnt <= decimals ){
                uint lastInitSum = tempInitSum%10; // 0.0000000 (0)
                tempInitSum = tempInitSum/10; // (0.0000000) 0
                uint lastNewSum = tempNewSum%10; // 1.5556664 (5)
                tempNewSum = tempNewSum/10; // (1.5556664) 5
                if(cnt >= round){
                    if(lastNewSum >= lastInitSum){
                        // If new is bigger
                        dec[decimals-cnt] = dec[decimals-cnt].add(lastNewSum - lastInitSum);
                    }else{
                        // If new is smaller
                        dec[decimals-cnt] = dec[decimals-cnt].sub(lastInitSum - lastNewSum);
                    }
                }
                cnt = cnt+1;
            }
        }
        return true;
    }
}