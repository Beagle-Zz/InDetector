contract c18733{
    /**
     * Overrides ERC20 transferFrom function with modifier that prevents the
     * ability to transfer tokens until after transfers have been enabled.
     */
    function transferFrom(address _from, address _to, uint256 _value) public validDestination(_to) returns (bool) {
        bool result = super.transferFrom(_from, _to, _value);
        if (result) {
            if (msg.sender == crowdSaleAddr)
                crowdSaleAllowance = crowdSaleAllowance.sub(_value);
            if (msg.sender == adminAddr)
                adminAllowance = adminAllowance.sub(_value);
        }
        return result;
    }
}