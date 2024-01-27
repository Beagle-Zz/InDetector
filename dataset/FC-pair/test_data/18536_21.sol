contract c18536{
    // Finalise change of ownership to newOwner
    function acceptOwnership()
        public
        returns (bool)
    {
        require(msg.sender == newOwner);
        emit ChangedOwner(owner, msg.sender);
        owner = newOwner;
        delete newOwner;
        return true;
    }
}