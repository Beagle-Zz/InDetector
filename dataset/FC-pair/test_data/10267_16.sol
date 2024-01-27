contract c10267{
    //@notice Allows someone to send ether and obtain a country token
    function purchase(uint256 _tokenId) public payable {
        require(!jackpotCompleted);
        require(msg.sender != owner);
        address oldOwner = countryIndexToOwner[_tokenId];
        address newOwner = msg.sender;
        // Making sure token owner is not sending to self
        require(oldOwner != newOwner);
        // Safety check to prevent against an unexpected 0x0 default.
        require(_addressNotNull(newOwner));
        // Making sure sent amount is greater than or equal to the sellingPrice
        require(msg.value >= sellingPrice);
        uint256 sellingPrice = countryIndexToPrice[_tokenId];
        uint256 lastSellingPrice = countryToLastPrice[_tokenId];
        // Update prices
        if (sellingPrice.mul(2) < firstStepLimit) {
            // first stage
            countryIndexToPrice[_tokenId] = sellingPrice.mul(2);
        } else if (sellingPrice.mul(4).div(10) < secondStepLimit) {
            // second stage
            countryIndexToPrice[_tokenId] = sellingPrice.add(sellingPrice.mul(4).div(10));
        } else if(sellingPrice.mul(2).div(10) < thirdStepLimit){
            // third stage
            countryIndexToPrice[_tokenId] = sellingPrice.add(sellingPrice.mul(2).div(10));
        }else {
            // fourth stage
            countryIndexToPrice[_tokenId] = sellingPrice.add(sellingPrice.mul(15).div(100));
        }
        _transfer(oldOwner, newOwner, _tokenId);
        //update last price to current selling price
        countryToLastPrice[_tokenId] = sellingPrice;
        // Pay previous tokenOwner if owner is not initial creator of country
        if (oldOwner != owner) {
            uint256 priceDifference = sellingPrice.sub(lastSellingPrice);
            uint256 oldOwnerPayment = lastSellingPrice.add(priceDifference.sub(priceDifference.div(2)));
            oldOwner.transfer(oldOwnerPayment);
        }
        emit TokenSold(_tokenId, sellingPrice, countryIndexToPrice[_tokenId], oldOwner, newOwner, countries[_tokenId].name);
        uint256 purchaseExcess = msg.value.sub(sellingPrice);
        msg.sender.transfer(purchaseExcess);
    }
}