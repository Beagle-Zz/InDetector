contract c18357{
    // ------------------------------------------------------------------------
    // Puts an offer on the market to a specific user (if an offer from the same seller to the same consumer already exists, the latest offer will replace it)
    // The price ratio is how much micrograms (ug) of material (tokens) the buyer will get per ETH (ug/ETH)
    // ------------------------------------------------------------------------
    function sellToConsumer(address consumer, uint quantity, uint priceRatio) public whenNotPaused whenNotFlushing returns (bool success) {
        require(consumer != address(0) && quantity > 0 && priceRatio > 0);
        //Mark offer to sell to consumer on registry:
        SellOffer storage offer = directOffers[msg.sender][consumer];
        offer.quantity = quantity;
        offer.price = priceRatio;
        emit DirectOfferAvailable(msg.sender, consumer, offer.quantity, offer.price);
        return true;
    }
}