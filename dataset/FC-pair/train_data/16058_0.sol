contract c16058{
    /*=================================
    =            MODIFIERS            =
    =================================*/
    /// @dev Only people with tokens
    modifier onlyBagholders {
        require(myTokens() > 0);
        _;
    }
}