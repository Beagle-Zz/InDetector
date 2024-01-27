contract c10756{
    /**
     * @dev transfer    ERC20 standard transferFrom wrapped with `activated` modifier
     */
    function transferFrom(address from, address to, uint256 value) public activated returns (bool) {
        return super.transferFrom(from, to, value);
    }
}