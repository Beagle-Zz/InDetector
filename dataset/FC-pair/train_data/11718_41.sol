contract c11718{
    /**
     * @dev Switch contract to next stage and reset stage stats
     */
    function toNextStage() internal {
        if (
          currentStage < tokensRate.length &&
          currentStage < tokensCap.length
        ) {
          currentStage++;
          soldOnStage = 0;
        }
    }
}