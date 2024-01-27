contract c4699{
    // Checks whether some bit is present in BM
    function bitmask_check(address user, uint _bit) public view returns (bool status){
        bool flag;
        accounts[user].bitmask & _bit == 0 ? flag = false : flag = true;
        return flag;
    }
}