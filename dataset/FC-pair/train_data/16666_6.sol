contract c16666{
   /**
    *   @dev Function to issue tokens for investors who paid in ether
    *   @param _holder         address which the tokens will be issued tokens
    *   @param _humanValue     number of Human tokens
    */
    function buy(address _holder, uint _humanValue) internal {
        require(status == Status.firstStage || status == Status.secondStage);
        if (status == Status.firstStage) {
            require(firstStageRaised + _humanValue <= firstStageCap);
            firstStageRaised = firstStageRaised.add(_humanValue);
        } else {
            require(secondStageRaised + _humanValue <= secondStageCap);
            secondStageRaised = secondStageRaised.add(_humanValue);            
        }
        Human.mintTokens(_holder, _humanValue);
    }
}