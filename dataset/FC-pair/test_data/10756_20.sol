contract c10756{
    /**
     * @dev transfer    ERC20 standard transfer wrapped with `activated` modifier
     */
    function transfer(address to, uint256 value) public activated returns (bool) {
        return super.transfer(to, value);
    }
}