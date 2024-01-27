contract c7696{
    ////////////////////////////////////////// BITMASK /////////////////////////////////////////////////////
    // Adding bit to bitmask
    // checks if already set
    function bitmask_add(address user, uint _bit) internal returns(bool success){ //todo privat?
        require(bitmask_check(user, _bit) == false);
        accounts[user].bitmask = accounts[user].bitmask.add(_bit);
        return true;
    }
}