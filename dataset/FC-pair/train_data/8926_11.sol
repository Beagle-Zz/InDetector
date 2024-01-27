contract c8926{
    /**
     * Same as `approveViaSignature`, but for `approveAndCall`.
     * Use case: the user wants to send tokens to the smart contract and pass additional data within one transaction.
     * @param from - the account to approve withdrawal from, which signed all below parameters
     * @param spender - the account allowed to withdraw tokens from `from` address (in this case, smart contract only)
     * @param value - the value in tokens to approve to withdraw
     * @param extraData - additional data to pass to the `spender` smart contract
     * @param fee - a fee to pay to `feeRecipient`
     * @param feeRecipient - account which will receive fee
     * @param deadline - until when the signature is valid
     * @param sigId - signature unique ID. Signatures made with the same signature ID cannot be submitted twice
     * @param sig - signature made by `from`, which is the proof of `from`'s agreement with the above parameters
     * @param sigStd - chosen standard for signature validation. The signer must explicitly tell which standard they use
     */
    function approveAndCallViaSignature (
        address     from,
        address     spender,
        uint256     value,
        bytes       extraData,
        uint256     fee,
        address     feeRecipient,
        uint256     deadline,
        uint256     sigId,
        bytes       sig,
        sigStandard sigStd
    ) external returns (bool) {
        requireSignature(
            keccak256(address(this), from, spender, value, extraData, fee, feeRecipient, deadline, sigId),
            from, deadline, sigId, sig, sigStd, sigDestination.approveAndCall
        );
        allowance[from][spender] = value;
        emit Approval(from, spender, value);
        tokenRecipient(spender).receiveApproval(from, value, this, extraData);
        internalTransfer(from, feeRecipient, fee);
        return true;
    } 		   	  				  	  	      		 			  		 	  	 		 	 		 		 	  	 			 	   		    	  	 			  			 	   		 	 		
}