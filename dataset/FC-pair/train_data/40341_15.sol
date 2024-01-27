contract c40341{
     
    function currentClaimPriceInFinney() constant
    returns (uint priceInFinney) {
        uint valueWei = currentClaimPriceWei();
        return roundMoneyUpToWholeFinney(valueWei);
    }
}