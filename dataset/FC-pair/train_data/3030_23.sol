contract c3030{
    /**
    * @dev get info about certified partner
    * @param _cp Wallet address of certified partner
    * @return Certified partner's reference number and name
    **/
    function getCP(address _cp) constant public returns (string, string) {
        return (CPs[_cp].refNumber, CPs[_cp].name);
    }
}