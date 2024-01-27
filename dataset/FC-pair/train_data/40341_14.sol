contract c40341{
     
    function currentClaimPriceWei() constant returns (uint priceInWei) {
        if (!isLivingMonarch()) {
            return rules.startingClaimPriceWei;
        } else {
            uint lastClaimPriceWei = latestMonarchInternal().claimPriceWei;
             
            uint newClaimPrice =
              (lastClaimPriceWei * (100 + rules.claimPriceAdjustPercent)) / 100;
            newClaimPrice = roundMoneyDownNicely(newClaimPrice);
            if (newClaimPrice < rules.startingClaimPriceWei) {
                newClaimPrice = rules.startingClaimPriceWei;
            }
            if (newClaimPrice > rules.maximumClaimPriceWei) {
                newClaimPrice = rules.maximumClaimPriceWei;
            }
            return newClaimPrice;
        }
    }
}