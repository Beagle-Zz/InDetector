contract c40522{
     
    function transfer(address _from, address _to) checkAccess("elcoin") {
        if (startTime == 0) {
            return;  
        }
        _storeBalanceRecord(_from);
        _storeBalanceRecord(_to);
    }
}