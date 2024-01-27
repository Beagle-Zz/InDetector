contract c13401{
    /// @notice Allow callers to withdraw token in one go from all of its subscribers
    /// @param _owners array of address of subscribers
    /// @return number of successful transfer done
    function multiSubWithdraw(address[] _owners) public returns (uint) {
        uint n = 0;
        for (uint i=0; i < _owners.length; i++) {
            if (subWithdrawFor(_owners[i], msg.sender)) {
                n++;
            } 
        }
        return n;
    }
}