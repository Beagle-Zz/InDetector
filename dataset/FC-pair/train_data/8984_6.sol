contract c8984{
    // data migration
    function migration(address sender, address receiver) onlyOwner public returns (bool) {
        require(sender != receiver);
        bool result= false;
        // Start data migration
        // uint256 t_value = balanceOf(receiver);
        uint256 _value = data.getOldBalanceOf(receiver);
        //Transfer balance
        if (data.balanceOf(receiver) == 0) {
            if (_value > 0) {
                _transfer(sender, receiver, _value);
                result = true;
            }
        }
        //Frozen account migration
        if (data.getOldFrozenAccount(receiver)== true) {
            if (data.frozenAccount(receiver)!= true) {
                data.setFrozenAccount(receiver, true);
            }
        }
        //End data migration
        return result;
    }
}