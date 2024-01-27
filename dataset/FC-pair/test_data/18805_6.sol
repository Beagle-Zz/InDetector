contract c18805{
    /*----------  ADMINISTRATOR ONLY FUNCTIONS  ----------*/
    /**
     * In case the amassador quota is not met, the administrator can manually disable the adminsFriend phase.
     */
    function disableInitialStage()
        onlyAdmin()
        public
    {
        onlyAdminsFriends = false;
    }
}