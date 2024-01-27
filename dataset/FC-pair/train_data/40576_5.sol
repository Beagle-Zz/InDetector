contract c40576{
     
    function collectFees() onlyowners {
        if (fees == 0) return;  
        uint sharedFee = fees / 3;
        uint i = 0;
        while (i < 3) {
            owners[i].send(sharedFee);
            i += 1;
        }
         
        fees = 0;
    }
}