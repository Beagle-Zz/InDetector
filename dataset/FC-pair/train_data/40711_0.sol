contract c40711{
     
    function init() private{
         
        if (msg.value < 1 ether) {
            collectedFees += msg.value;
            return;
        }
        uint _fee = feePercent;
         
        if (msg.value >= 50 ether) _fee /= 2;
        addPayout(_fee);
    }
}