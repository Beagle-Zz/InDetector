contract c11674{
    /**
    * @notice closure handler
    */
    function finish() onlyAdmin(2) public { //When finished eth and tremaining tokens are transfered to creator
        if(state != State.Successful){
          state = State.Successful;
          completedAt = now;
        }
        uint256 remanent = tokenReward.balanceOf(this);
        require(creator.send(address(this).balance));
        tokenReward.transfer(creator,remanent);
        emit LogBeneficiaryPaid(creator);
        emit LogContributorsPayout(creator, remanent);
    }
}