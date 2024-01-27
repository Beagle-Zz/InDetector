contract c3742{
    /**
     * @notice Returns balance of an address.
     * @dev Returns `0` the address was never seen before.
     **/
    function balanceOf(address _addr) public view returns (uint256){
        return balances[_addr];
    }
}