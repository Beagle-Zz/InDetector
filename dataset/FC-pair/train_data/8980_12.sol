contract c8980{
    /////// Getters to allow the same blacklist to be used also by other contracts (including upgraded Full) ///////
    function getBlackListStatus(address _maker) external constant returns (bool) {
        return isBlackListed[_maker];
    }
}