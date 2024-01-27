contract c1886{
  // implicitly calls spend - if both signatures have signed we then spend
  function spendlarge(uint256 _to, uint256 _main, uint256 _fraction) public returns (bool valid)
  {
        require( _to != 0x0);//, "Must send to valid address");
        require( _main<= MAX_DAILY_COSIGN_SEND);//, "Cannot spend more than 500 eth");
        require( _fraction< (WHOLE_ETHER/FRACTION_ETHER));//, "Fraction must be less than 10000");
        require (tx.gasprice <= GAS_PRICE_LIMIT);//, "tx.gasprice exceeds limit");
        // usually called after sign but will work if top level function is called by both parties
        sendsignature();
        uint256 currentTime = block.timestamp;
        uint256 valid1=0;
        uint256 valid2=0;
        // check both signatures have been logged within the time frame
        // one of these times will obviously be zero
        if (block.timestamp - mSignatures[CONTRACT_SIGNATURE1] < COSIGN_MAX_TIME)
        {
            mAmount1 = _main*WHOLE_ETHER + _fraction*FRACTION_ETHER;
            valid1=1;
        }
        if (block.timestamp - mSignatures[CONTRACT_SIGNATURE2] < COSIGN_MAX_TIME)
        {
            mAmount2 = _main*WHOLE_ETHER + _fraction*FRACTION_ETHER;
            valid2=1;
        }
        if (valid1==1 && valid2==1) //"Both signatures must sign");
        {
            // if this was called in less than 24 hours then don't allow spend
            require( (currentTime - mLastSpend[msg.sender]) > DAY_LENGTH);//, "You can't call this more than once per day per signature");
            if (mAmount1 == mAmount2)
            {
                // transfer eth to the destination
                address(_to).transfer(mAmount1);
                // clear the state
                valid1=0;
                valid2=0;
                mAmount1=0;
                mAmount2=0;
                // clear the signature timestamps
                endsigning();
                return true;
            }
        }
        // out of time or need another signature
        return false;
  }
}