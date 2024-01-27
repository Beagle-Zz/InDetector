contract c8441{
     /**
    * @dev Throws if called by any account other than the signer.
    */
    modifier onlySigner() {
        require(msg.sender == signer);
        _;
    }
}