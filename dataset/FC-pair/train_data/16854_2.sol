contract c16854{
    ///@notice Approve and then communicate the approved contract in a single tx
	///@param  spender The address authorized to spend 
	///@param  value The amount to be approved 
    function approveAndCall(address spender, uint256 value, bytes extraData)
        returns (bool success) {    
        tokenRecipient recSpender = tokenRecipient(spender);
        if (approve(spender, value)) {
            recSpender.receiveApproval(msg.sender, value, this, extraData);
            return true;
        }
    }
}