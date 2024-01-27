contract c4699{
    // Removes bit from bitmask
    // checks if already set
    function bitmask_rm(address user, uint _bit) internal returns(bool success){
        require(bitmask_check(user, _bit) == true);
        accounts[user].bitmask = accounts[user].bitmask.sub(_bit);
        return true;
    }
}