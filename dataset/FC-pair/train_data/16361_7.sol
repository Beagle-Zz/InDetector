contract c16361{
    // Check if genesis is at a particular stage
    modifier atStage(Stages _stage) {
        require(stage == _stage);
        _;
    }
}