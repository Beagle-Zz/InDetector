contract c40145{
	 
    function toYMD (uint departure) returns (string) {
        uint diff = (departure - 1472601600) / 86400;
        uint8 d1 = uint8(diff / 10);
        uint8 d2 = uint8(diff - 10*d1);
        string memory str = '/dep/2016/09/xx';
        bytes memory strb = bytes(str);
        strb[13] = bytes1(d1+48);
        strb[14] = bytes1(d2+48);
		return(string(strb));
    }
}