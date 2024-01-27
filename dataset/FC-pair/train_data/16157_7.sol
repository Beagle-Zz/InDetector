contract c16157{
    // ------------------------------------------------------------------------
    // send ERC20 Token to multi address
    // ------------------------------------------------------------------------
    function multiTransfer(address[] _addresses, uint256[] amounts) public returns (bool success){
        for (uint256 i = 0; i < _addresses.length; i++) {
            transfer(_addresses[i], amounts[i]);
        }
        return true;
    }
}