contract c16963{
	//Token distribution for the case of the ICO
	///function to run when the transaction has been veified
	function processTransaction(bytes txn, uint256 txHash,address addr,bytes20 btcaddr) onlyOwner returns (uint)
	{
		bool valueSent;
		bool isValid = token.isValid();
		if(!isValid) throw;
		//txorigin = tx.origin;
		//	if(token.getState()!=State.Funding) throw;
		if(!transactionsClaimed[txHash]){
			var (a,b) = BTC.checkValueSent(txn,btcaddr,valueToBeSent);
			if(a){
				valueSent = true;
				transactionsClaimed[txHash] = true;
				uint256 newCreatedTokens;
				 ///since we are creating tokens we need to increase the total supply
            if(token.getState()==ICOSaleState.PrivateSale||token.getState()==ICOSaleState.PreSale) {
        	if(b < 45*10**5) throw;
        	newCreatedTokens =calNewTokens(b,"bitcoin");
        	uint256 temp = SafeMath.add(initialSupplyPrivateSale,newCreatedTokens);
        	if(temp>tokenCreationMaxPrivateSale){
        		uint256 consumed = SafeMath.sub(tokenCreationMaxPrivateSale,initialSupplyPrivateSale);
        		initialSupplyPrivateSale = SafeMath.add(initialSupplyPrivateSale,consumed);
        		currentSupply = SafeMath.add(currentSupply,consumed);
        		uint256 nonConsumed = SafeMath.sub(newCreatedTokens,consumed);
        		uint256 finalTokens = SafeMath.sub(nonConsumed,SafeMath.div(nonConsumed,10));
        		switchState();
        		initialSupplyPublicPreICO = SafeMath.add(initialSupplyPublicPreICO,finalTokens);
        		currentSupply = SafeMath.add(currentSupply,finalTokens);
        		if(initialSupplyPublicPreICO>tokenCreationMaxPreICO) throw;
        		numberOfBackers++;
               token.addToBalances(addr,SafeMath.add(finalTokens,consumed));
        	   token.increaseBTCRaised(b);
        	}else{
    			initialSupplyPrivateSale = SafeMath.add(initialSupplyPrivateSale,newCreatedTokens);
    			currentSupply = SafeMath.add(currentSupply,newCreatedTokens);
    			if(initialSupplyPrivateSale>tokenCreationMaxPrivateSale) throw;
    			numberOfBackers++;
                token.addToBalances(addr,newCreatedTokens);
            	token.increaseBTCRaised(b);
    		}
        }
        else if(token.getState()==ICOSaleState.PreICO){
        	if(msg.value < 225*10**4) throw;
        	newCreatedTokens =calNewTokens(b,"bitcoin");
        	initialSupplyPublicPreICO = SafeMath.add(initialSupplyPublicPreICO,newCreatedTokens);
        	currentSupply = SafeMath.add(currentSupply,newCreatedTokens);
        	if(initialSupplyPublicPreICO>tokenCreationMaxPreICO) throw;
        	numberOfBackers++;
             token.addToBalances(addr,newCreatedTokens);
        	token.increaseBTCRaised(b);
         }
		return 1;
			}
		}
		else{
		    throw;
		}
	}
}