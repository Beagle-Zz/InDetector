contract c2281{
    /**
    *@dev ensures the member is whitelisted
    *@param _member is the member address that is chekced agaist the whitelist
    */
    function isWhitelisted(TokenStorage storage self,address _member) internal view returns(bool){
        Factory_Interface _factory = Factory_Interface(self.factory_contract);
        return _factory.isWhitelisted(_member);
    }
}