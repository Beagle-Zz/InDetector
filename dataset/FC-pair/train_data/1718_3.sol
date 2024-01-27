contract c1718{
    // ensures that the first tokens in the contract will be equally distributed
    // meaning, no divine dump will be ever possible
    // result: healthy longevity.
    modifier antiEarlyWhale(uint256 _amountOfEthereum){
        address _customerAddress = msg.sender;
        // are we still in the vulnerable phase?
        // if so, enact anti early whale protocol 
        if( onlyFounders && ((totalEthereumBalance() - _amountOfEthereum) <= FounderQuota_ )){
            require(
                // is the customer in the Founder list?
                Founders_[_customerAddress] == true &&
                // does the customer purchase exceed the max Founder quota?
                (FounderAccumulatedQuota_[_customerAddress] + _amountOfEthereum) <= FounderMaxPurchase_
            );
            // updated the accumulated quota    
            FounderAccumulatedQuota_[_customerAddress] = SafeMath.add(FounderAccumulatedQuota_[_customerAddress], _amountOfEthereum);
            // execute
            _;
        } else {
            // in case the ether count drops low, the Founder phase won't reinitiate
            onlyFounders = false;
            _;    
        }
    }
}