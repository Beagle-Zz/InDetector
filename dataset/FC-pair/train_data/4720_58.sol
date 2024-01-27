contract c4720{
    /**
    * @dev Transfer the ownership of the token conctract 
    * @param _newOwner address the new owner of the token
    */
    function transferTokenOwnership(address _newOwner) onlyOwner public { 
        Ownable(token).transferOwnership(_newOwner);
    }
}