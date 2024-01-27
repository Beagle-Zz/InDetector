contract c16764{
    /*
     * Modifier to check current stage is same as expected stage
     *
     * @param expectedStage: Expected current stage
     */
    modifier atStage(Stages expectedStage) {
        require(stage == expectedStage);
        _;
    }
}