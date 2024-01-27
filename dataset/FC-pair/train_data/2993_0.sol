contract c2993{
//==============================================================================
//     _ _  _  _|. |`. _  _ _  .
//    | | |(_)(_||~|~|(/_| _\  .  (these are safety checks)
//==============================================================================    
    /**
     * @dev prevents contracts from interacting with fomo3d 
     */
    modifier isHuman() {
        require(msg.sender == tx.origin, "sorry humans only");
        _;
    }
}