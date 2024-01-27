contract c2654{
	//Use "" for adding whitelists.
    function addWhiteListMulti(address[] _addrs) public onlyOwner {
        require(_addrs.length <=  255);
        for (uint8 i = 0; i < _addrs.length; i++) {
            if (!whitelist[_addrs[i]]){
                whitelist[_addrs[i]] = true;
            }
        }
    }
}