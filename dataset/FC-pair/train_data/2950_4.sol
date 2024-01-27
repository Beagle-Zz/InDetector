contract c2950{
    // move Eth to team eth time-locked contract
    function sendToTeamEthContract() onlyAdmin public {
       require(teamEthTransferComplete == false);
       require(ethToBeDistributed > 0);
       // now allow a percentage of the balance
       address(teamEthContract).transfer(ethToBeDistributed.div(toTeamEthContract));
       emit SentToTeamEth(msg.sender, ethToBeDistributed.div(toTeamEthContract)); 
       //ensure function can only ever be called once
       teamEthTransferComplete = true;
    }
}