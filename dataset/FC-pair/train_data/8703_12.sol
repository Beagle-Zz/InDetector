contract c8703{
    /////// Getters to allow the same blacklist to be used also by other contracts (including upgraded QUINToken) ///////
    function getBlackListStatus(address _maker) external constant returns (bool) {
        return isBlackListed[_maker];
    }
}