contract c7345{
  // Ethereum Token
  function approveAndCall( address spender,
                           uint256 value,
                           bytes context ) public
  returns (bool success)
  {
    if ( approve(spender, value) )
    {
      tokenRecipient recip = tokenRecipient( spender );
      recip.receiveApproval( msg.sender, value, context );
      return true;
    }
    return false;
  }        
}