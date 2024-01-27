contract c18133{
    /**
     * Functions with this modifier check the validity of msg value
     * value must greater than equal minimumBuyPrice
     * total deposit must less than equal maximumBuyPrice
     */
    modifier validValue(){
        // require value >= _minimumBuy AND total deposit of msg.sender <= maximumBuyPrice
        require ( (msg.value >= _minimumBuy) &&
            ( (deposit[msg.sender] + msg.value) <= _maximumBuy) );
        _;
    }
}