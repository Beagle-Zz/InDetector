contract c7960{
    /**
     * @dev The initialization method for the token
     *
     * @param _token The address of the token of the fundraiser
     */
    function initializeFundraiserToken(address _token) internal
    {
        token = ERC20Token(_token);
    }
}