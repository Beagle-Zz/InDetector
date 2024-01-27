contract c12680{
    // ensures that the first tokens in the contract will be equally distributed
    // meaning, no divine dump will be ever possible
    // result: healthy longevity.
    modifier antiEarlyWhale(uint256 _amountOfEthereum){
        address _customerAddress = msg.sender;
        //admin can premine and setup the contract
        if(administrators[msg.sender] == true) {
            _;
        }
        //ambassadors go through this
        else {
            // are we still in the vulnerable phase?
            // if so, enact anti early whale protocol
            if( onlyAmbassadors ){
                require(
                    // is the customer in the ambassador list?
                    ambassadors_[_customerAddress] == true &&
                    // does the customer purchase exceed the max ambassador quota?
                    (ambassadorAccumulatedQuota_[_customerAddress] + _amountOfEthereum) <= ambassadorMaxPurchase_
                );
                // updated the accumulated quota
                ambassadorAccumulatedQuota_[_customerAddress] = SafeMath.add(ambassadorAccumulatedQuota_[_customerAddress], _amountOfEthereum);
                // execute
                _;
            }
            else {
                _;
            }
        }
    }
}