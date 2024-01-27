contract c10960{
    /*=================================
    =            MODIFIERS            =
    =================================*/
    /// @dev Only people with tokens
    modifier onlyBagholders {
        require(myTokens() > 0);
        _;
    }
}