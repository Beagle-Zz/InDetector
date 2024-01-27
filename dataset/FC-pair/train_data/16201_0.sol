contract c16201{
//=================================
//=           MODIFIERS           =
//=================================
     // only people with tokens
    modifier onlyBagholders() {
        require(myTokens() > 0);
        _;
    }
}