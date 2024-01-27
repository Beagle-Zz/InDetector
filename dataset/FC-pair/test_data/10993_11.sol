contract c10993{
    /**
     * modifier for pause constract. not contains admin and owner
     */
    modifier whenNotPaused() {
        if(paused) {
            require(msg.sender == owner || admins[msg.sender]);
        }
        _;
    }
}