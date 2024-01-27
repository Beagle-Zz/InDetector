contract c3729{
    /**
    * @dev Process blacklisting
    * @param node Process blacklisting. Put the user in the blacklist.   
    */
    function blacklist(address node) public onlyOwnerOrOperator {
        blacklisted[node] = true;
        emit TMTG_Blacklisted(node);
    }
}