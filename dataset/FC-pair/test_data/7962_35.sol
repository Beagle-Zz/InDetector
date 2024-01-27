contract c7962{
    // Allows someone to send ether and obtain the token
    function purchase(uint256 _tokenId)
    public
    payable
    whenNotPaused {
        address newOwner = msg.sender;
        address oldOwner = animecardToOwner[_tokenId];
        uint256 salePrice = animecardToPrice[_tokenId];
        // Require that the owner of the token is not sending to self.
        require(oldOwner != newOwner);
        // Safety check to prevent against an unexpected 0x0 default.
        require(_addressNotNull(newOwner));
        // Check that sent amount is greater than or equal to the sale price
        require(msg.value >= salePrice);
        uint256 payment = uint256(computePayment(_tokenId, salePrice));
        uint256 purchaseExcess = SafeMath.sub(msg.value, salePrice);
        // Set next listing price.
        animecardPrevPrice[_tokenId] = animecardToPrice[_tokenId];
        animecardToPrice[_tokenId] = computeNextPrice(salePrice);
        // Transfer the Animecard to the buyer.
        _transfer(oldOwner, newOwner, _tokenId);
        // Pay seller of the Animecard if they are not this contract.
        if (oldOwner != address(this)) {
            oldOwner.transfer(payment);
        }
        TokenSold(_tokenId, salePrice, animecardToPrice[_tokenId], oldOwner, newOwner, animecards[_tokenId].characterName);
        // Reimburse the buyer of any excess paid.
        msg.sender.transfer(purchaseExcess);
    }
}