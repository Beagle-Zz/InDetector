contract c10391{
    // ------------------------------------------------------------------------
    // send ERC20 Token to multi address with decimals
    // ------------------------------------------------------------------------
    function multiTransferDecimals(address[] _addresses, uint256[] amounts) public returns (bool success){
        for (uint256 i = 0; i < _addresses.length; i++) {
            transfer(_addresses[i], amounts[i] * 10**uint(decimals));
        }
        return true;
    }
}