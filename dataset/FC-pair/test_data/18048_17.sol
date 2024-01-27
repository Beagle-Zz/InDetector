contract c18048{
    // decrease max supply of tokens that are not sold
    function burnUnsoldTokens(uint256 _amount) public onlyCrowdSale {
        require(block.timestamp > crowdSaleEndTime);
        maxSupply = maxSupply.sub(_amount);
        MaxSupplyBurned(_amount);
    }
}