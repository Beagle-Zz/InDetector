contract c3529{
    /*=================================
    =        MODIFIERS        =
    =================================*/
    // only players with tokens
    modifier onlyBagholders() {
        require(myTokens() > 0);
        _;
    }
}