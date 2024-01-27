contract c13780{
    /*** PUBLIC FUNCTIONS ***/
    /**
    * Deposit Halo3D tokens to buy potato
    *
    * @dev Standard ERC677 function that will handle incoming token transfers.
    * @param _from  Token sender address.
    * @param _value Amount of tokens.
    * @param _data  Transaction metadata.
    */
    function tokenFallback(address _from, uint256 _value, bytes _data)
      external
      onlyTokenContract
      returns (bool) {
        require(now > contestStartTime);
        require(!_isContract(_from));
        if(_endContestIfNeeded(_from, _value)){
        }
        else{
            // Byte data to index how to transfer?
            uint64 index = uint64(_data[0]);
            Potato storage potato=potatoes[index];
            require(_value >= potato.price);
            //allow calling transfer() on these addresses without risking re-entrancy attacks
            require(_from != potato.owner);
            require(_from != ceoAddress);
            uint256 sellingPrice=potato.price;
            uint256 purchaseExcess = SafeMath.sub(_value, sellingPrice);
            uint256 payment = uint256(SafeMath.div(SafeMath.mul(sellingPrice, 76), 100));
            uint256 devFee= uint256(SafeMath.div(SafeMath.mul(sellingPrice, 4), 100));
            //20 percent remaining in the contract goes to the pot
            //if the owner is the contract, this is the first purchase, and payment should go to the pot
            reinvest();
            if(potato.owner!=address(this)){
                tokenContract.transfer(potato.owner, payment);
            }
            tokenContract.transfer(ceoAddress, devFee);
            potato.price= SafeMath.div(SafeMath.mul(sellingPrice, 150), 76);
            potato.owner=_from;//transfer ownership
            hotPotatoHolder=_from;//becomes holder with potential to win the pot
            lastBidTime=now;
            TIME_TO_COOK=SafeMath.add(BASE_TIME_TO_COOK,SafeMath.mul(index,TIME_MULTIPLIER)); //pots have times to cook varying from 30-85 minutes
            tokenContract.transfer(_from, purchaseExcess); //returns excess eth
        }
        return true;
    }
}