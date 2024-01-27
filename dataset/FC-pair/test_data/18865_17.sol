contract c18865{
	/* set Max token count to buyout */
    function setByuoutCount(uint count) public onlyOwner {
        byuoutCount = count;
    }
}