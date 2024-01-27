contract c12886{
    /**
    * Limit amount of token transfer after the crowdsale is over.
    */
    modifier fccTokenCanTransfer(address _sender, uint256 _value) {
        // Verify if sender is not transfer agent
        if(!transferAgents[_sender]){
            // Verify if present time is not exceed upper bounds period
            if(now < periods[1].time){
                // Amount of token which sender can transfer
                // base on amount of token that they invested in crowdsale and percentage of period
                uint256 transferableCrowedSaleToken = 0;
                // Verify if present time is not exceed lower bounds period
                if(now < periods[0].time){
                    transferableCrowedSaleToken = (investedCrowdsaleToken[_sender].mul(periods[0].percentage)).div(100);
                }else{
                    transferableCrowedSaleToken = (investedCrowdsaleToken[_sender].mul(periods[1].percentage)).div(100);
                }
                // Amount of token that sender have
                // exclude the token which they invest in crowdsale
                uint256 afterCrowedsaleTokenBalance = 0;
                if (receivedToken[_sender] > investedCrowdsaleToken[_sender]) {
                    afterCrowedsaleTokenBalance = receivedToken[_sender].sub(investedCrowdsaleToken[_sender]);
                }
                // Amount of token that sender can transfer
                uint256 totalTransferableBalance = afterCrowedsaleTokenBalance.add(transferableCrowedSaleToken);
                // Amount of transfered and intend to transfer token
                uint256 totalTransfer = _value.add(transferedToken[_sender]);
                require (totalTransferableBalance >= totalTransfer);
            }
        }
        _;
    }
}