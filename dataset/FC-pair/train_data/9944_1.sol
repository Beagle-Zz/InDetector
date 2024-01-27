contract c9944{
    // only people with tokens
    modifier onlyBagholders() {
        require(myTokens() > 0);
        _;
    }
}