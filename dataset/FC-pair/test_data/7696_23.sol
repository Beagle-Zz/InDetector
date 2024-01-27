contract c7696{
    // Checks whether some bit is present in BM
    function bitmask_check(address user, uint _bit) internal view returns (bool status){
        bool flag;
        accounts[user].bitmask & _bit == 0 ? flag = false : flag = true;
        return flag;
    }
}