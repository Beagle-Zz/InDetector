contract c7045{
    /**
     * @dev modifier allow only if function is called by administrator
     */
    modifier onlyAdmin() {
        if( !administrators[msg.sender] ){
            revert();
        }
        _;
    }
}