contract c16941{
    // Combined "one-request" getState for web-requests optimisation
    function getState() external view returns (bool, bool, uint, uint, uint, uint, uint, uint, bool, uint, uint) {
        return (this.getBetsState(),
                this.getRolled(),
                this.getExpectedReturn(),
                this.getNumberOfBets(),
                this.getRollUnder(),
                this.getOneBet(),
                this.getParticipants(),
                this.getExtraBets(),
                this.getBetsBlock(),
                this.getRoundID(),
                this.getWaitingState());
    }
}