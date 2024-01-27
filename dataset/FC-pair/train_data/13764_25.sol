contract c13764{
    /*get airdrop function*/
    //one can get airdrop by themselves as long as they are willing to pay gas
    function getAirdrop() whenNotLocked canMint whenDropable external returns (bool) {
        require(totalSupply_.add(dropAmount_) <= actualCap_);
        mint(msg.sender, dropAmount_);
        return true;
    }
}