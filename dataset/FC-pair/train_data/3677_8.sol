contract c3677{
    /// @dev Setup function sets external token address.
    /// @param singularDTVTokenAddress Token address.
    function setup(address singularDTVTokenAddress)
        external
        onlyOwner
        returns (bool)
    {
        if (address(singularDTVToken) == 0) {
            singularDTVToken = AbstractSingularDTVToken(singularDTVTokenAddress);
            return true;
        }
        return false;
    }
}