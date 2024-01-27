contract c8415{
    /// @notice Buy tokens from contract by sending ether
    function buy() payable public {
       uint amount = msg.value *(10**18)/ buyPrice;               // calculates the amount
       _transfer(this, msg.sender, amount);              // makes the transfers
       if(!owner.send(msg.value)){
           revert();
       }
   }
}