contract c16603{
    /**
    * @notice closure handler
    */
    function finished() public { //When finished eth and tremaining tokens are transfered to creator
        require(state == State.Successful);
        uint256 remanent = tokenReward.balanceOf(this);
        require(creator.send(address(this).balance));
        tokenReward.transfer(creator,remanent);
        emit LogBeneficiaryPaid(creator);
        emit LogContributorsPayout(creator, remanent);
    }
}