contract c40380{
     
     
     
    function whichChainIsThis() internal returns (uint8) {
        if (block.number >= 1920000) {
            if (afterForkBlockNumber == 0) {  
                afterForkBlockNumber = block.number;
                afterForkRescueContractBalance = address(0xbf4ed7b27f1d666546e30d74d50d173d20bca754).balance;
            }
            if (afterForkRescueContractBalance < 1000000 ether) {
                return 1;  
            } else {
                return 2;  
            }
        } else {
            return 0;  
        }
    }
}