contract c16197{
    // After sale end
    /// Finalise purchase: transfers the tokens to caller address
    function finalise()
        public
        when_not_halted
        when_ended
        only_investors(msg.sender)
    {
        finaliseAs(msg.sender);
    }
}