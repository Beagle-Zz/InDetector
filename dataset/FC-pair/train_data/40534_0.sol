contract c40534{
     
    function checkExpiry() afterExpiry{
        uint balance = tokenObj.balanceOf(this);
        tokenObj.transfer(beneficiary, balance);
    }
}