contract c8241{
    /**
     * @dev Get the token balance of the contract.
     * @return _balance The token balance of this contract in ether
     */
    function BalanceEth() view public returns (uint256 _balance) {
        return token.balanceOf(address(this)) / 1 ether;
    }
}