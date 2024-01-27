contract c13665{
    /**
    * @dev Checks if pValidationState is in the provided stats
    * @param state State required to run
    */
    modifier checkState(pointsValidationState state){
        require(pValidationState == state);
        _;
    }
}