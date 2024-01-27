contract c2750{
    //==============================================================================
    //     _ _  _  _|. |`. _  _ _  .
    //    | | |(_)(_||~|~|(/_| _\  .  (these are safety checks)
    //==============================================================================
    /**
     * @dev used to make sure no one can interact with contract until it has
     * been activated.
     */
    modifier isActivated() {
        require(activated_ == true, "its not ready yet");
        _;
    }
}