contract c7461{
    /**
    * @notice It is not recommened to call this function outside of the giveth dapp (giveth.io)
    * this function is bridged to a side chain. If for some reason the sidechain tx fails, the donation
    * will end up in the givers control inside LiquidPledging contract. If you do not use the dapp, there
    * will be no way of notifying the sender/giver that the giver has to take action (withdraw/donate) in
    * the dapp
    *
    * @param giverId The adminId of the liquidPledging pledge admin who is donating
    * @param receiverId The adminId of the liquidPledging pledge admin receiving the donation
    */
    function donate(uint64 giverId, uint64 receiverId) payable external {
        donate(giverId, receiverId, 0, 0);
    }
}