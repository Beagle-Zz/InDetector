contract c16427{
    /**
    * @dev Modifier to make a function callable only when the caller can transfert token.
    */
    modifier canTransfert() {
        if(!transferable){
            require (whitelisted[msg.sender]);
        } 
        _;
   }
}