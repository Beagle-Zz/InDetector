contract c12911{
    /**
     * Allow to change the team multisig address in the case of emergency.
     */
    function setMultisigPre(address _addr) onlyOwner public {
        require(_addr != address(0));
        preMultisigEther = _addr;
    }
}