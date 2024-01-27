contract c10548{
    //Be sure to send the correct Eth value to the respective claim, if it is incorrect it will be rejected
    function Claim_TRAC_20000() payable {
        // Return error if wrong amount of Ether sent
        require(msg.value == 5 ether);
        // Record wallet address of calling account (user) for contract to send TRAC tokens to
        airdrop_balance[msg.sender] += msg.value;
        //Increment total raised for campaign 
        raised += msg.value;
        //Decrement TRAC token count as TRAC is sent
        TRAC_Tokens_left -= 20000;
        Group_5+=1;
        //Transfer TRAC to calling account (user)
        msg_sender_transfer+=20000+TRAC;
    }
}