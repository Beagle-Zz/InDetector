contract c18357{
    // ------------------------------------------------------------------------
    // Checks a seller offer to the user. Method used by the buyer to check an offer (direct offer) from a seller to him/her and to see 
    // how much he/she will have to pay for it (in Wei).
    // The price ratio is how much micrograms (ug) of material (tokens) the buyer will get per ETH (ug/ETH)
    // ------------------------------------------------------------------------
    function checkSellerOffer(address seller) public view returns (uint quantity, uint priceRatio, uint totalWeiCost) {
        quantity = directOffers[seller][msg.sender].quantity;
        priceRatio = directOffers[seller][msg.sender].price;
        totalWeiCost = calculateEthValueFromTokens(quantity, priceRatio); //Value to be payed by the buyer (in Wei)
    }
}