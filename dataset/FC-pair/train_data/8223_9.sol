contract c8223{
    /**
    * @dev Approve function will delegate spender to spent tokens on msg.sender behalf
    * @param spender ddress which is delegated
    * @param value tokens amount which are delegated
    * @return bool true=> approve is succesful
    */
    function approve(address spender, uint256 value) public returns (bool) {
        allowed[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }
}