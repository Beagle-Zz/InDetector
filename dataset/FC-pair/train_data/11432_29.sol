contract c11432{
     // if crowdsale is unsuccessful, investors can claim refunds here
     function claimRefund() public {
       require(state == State.Failure);
       vault.refund(msg.sender);
    }
}