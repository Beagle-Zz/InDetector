contract c13159{
    //modifier to limit the minting to not exceed maximum supply limit
    modifier canPoSMint() {
        require(totalSupply < maxTotalSupply);
        _;
    }
}