contract c3088{
    /*----------  OWNER ONLY FUNCTIONS  ----------*/
    /**
     * In case the amassador quota is not met, the owner can manually disable the ambassador phase.
     */
    function disableInitialStage()
        onlyOwner()
        public
    {
        onlyAmbassadors = false;
    }
}