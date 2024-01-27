contract c8926{
    /**
     * Same as `transferViaSignature`, but for `transferFrom`.
     * Use case: the user wants to withdraw tokens from a smart contract or another user who allowed the user to
     * do so. Important note: the fee is subtracted from the `value`, and `to` address receives `value - fee`.
     * @param signer - the address allowed to call transferFrom, which signed all below parameters
     * @param from - the account to make withdrawal from
     * @param to - the address of the recipient
     * @param value - the value in tokens to withdraw
     * @param fee - a fee to pay to `feeRecipient`
     * @param feeRecipient - account which will receive fee
     * @param deadline - until when the signature is valid
     * @param sigId - signature unique ID. Signatures made with the same signature ID cannot be submitted twice
     * @param sig - signature made by `from`, which is the proof of `from`'s agreement with the above parameters
     * @param sigStd - chosen standard for signature validation. The signer must explicitly tell which standard they use
     */
    function transferFromViaSignature (
        address     signer,
        address     from,
        address     to,
        uint256     value,
        uint256     fee,
        address     feeRecipient,
        uint256     deadline,
        uint256     sigId,
        bytes       sig,
        sigStandard sigStd
    ) external returns (bool) { 		   	  				  	  	      		 			  		 	  	 		 	 		 		 	  	 			 	   		    	  	 			  			 	   		 	 		
        requireSignature(
            keccak256(address(this), from, to, value, fee, feeRecipient, deadline, sigId),
            signer, deadline, sigId, sig, sigStd, sigDestination.transferFrom
        );
        allowance[from][signer] = allowance[from][signer].sub(value);
        internalDoubleTransfer(from, to, value.sub(fee), feeRecipient, fee);
        return true;
    }
}