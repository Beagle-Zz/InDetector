contract c8926{
    /**
     * Internal method that makes sure that the given signature corresponds to a given data and is made by `signer`.
     * It utilizes three (four) standards of message signing in Ethereum, as at the moment of this smart contract
     * development there is no single signing standard defined. For example, Metamask and Geth both support
     * personal_sign standard, SignTypedData is only supported by Matamask, Trezor does not support "widely adopted"
     * Ethereum personal_sign but rather personal_sign with fixed prefix and so on.
     * Note that it is always possible to forge any of these signatures using the private key, the problem is that
     * third-party wallets must adopt a single standard for signing messages.
     * @param data - original data which had to be signed by `signer`
     * @param signer - account which made a signature
     * @param deadline - until when the signature is valid
     * @param sigId - signature unique ID. Signatures made with the same signature ID cannot be submitted twice
     * @param sig - signature made by `from`, which is the proof of `from`'s agreement with the above parameters
     * @param sigStd - chosen standard for signature validation. The signer must explicitly tell which standard they use
     * @param sigDest - for which type of action this signature was made
     */
    function requireSignature (
        bytes32 data,
        address signer,
        uint256 deadline,
        uint256 sigId,
        bytes sig,
        sigStandard sigStd,
        sigDestination sigDest
    ) internal {
        bytes32 r;
        bytes32 s;
        uint8 v;
        assembly { // solium-disable-line security/no-inline-assembly
            r := mload(add(sig, 32))
            s := mload(add(sig, 64)) 		   	  				  	  	      		 			  		 	  	 		 	 		 		 	  	 			 	   		    	  	 			  			 	   		 	 		
            v := byte(0, mload(add(sig, 96)))
        }
        if (v < 27)
            v += 27;
        require(block.timestamp <= deadline && !usedSigIds[signer][sigId]); // solium-disable-line security/no-block-members
        if (sigStd == sigStandard.typed) { // Typed signature. This is the most likely scenario to be used and accepted
            require(
                signer == ecrecover(
                    keccak256(
                        sigDest == sigDestination.transfer
                            ? sigDestinationTransfer
                            : sigDest == sigDestination.approve
                                ? sigDestinationApprove
                                : sigDest == sigDestination.approveAndCall
                                    ? sigDestinationApproveAndCall
                                    : sigDestinationTransferFrom,
                        data
                    ),
                    v, r, s
                )
            );
        } else if (sigStd == sigStandard.personal) { // Ethereum signed message signature (Geth and Trezor)
            require(
                signer == ecrecover(keccak256(ethSignedMessagePrefix, "32", data), v, r, s) // Geth-adopted
                ||
                signer == ecrecover(keccak256(ethSignedMessagePrefix, "\x20", data), v, r, s) // Trezor-adopted
            );
        } else { // == 2; Signed string hash signature (the most expensive but universal)
            require(
                signer == ecrecover(keccak256(ethSignedMessagePrefix, "64", hexToString(data)), v, r, s) // Geth
                ||
                signer == ecrecover(keccak256(ethSignedMessagePrefix, "\x40", hexToString(data)), v, r, s) // Trezor
            );
        }
        usedSigIds[signer][sigId] = true;
    }
}