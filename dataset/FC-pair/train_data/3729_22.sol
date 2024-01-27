contract c3729{
    /**
    * @dev Process unBlacklisting. 
    * @param node Remove the user from the blacklist.   
    */
    function unblacklist(address node) public onlyOwnerOrOperator {
        blacklisted[node] = false;
        emit TMTG_Whitelisted(node);
    }
}